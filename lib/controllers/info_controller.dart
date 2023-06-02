import 'package:bot_toast/bot_toast.dart';
import 'package:cyber_sec/database/info.dart';
import 'package:cyber_sec/model/cyber_model.dart';
import 'package:cyber_sec/views/admin_login.dart';
import 'package:cyber_sec/views/base_view.dart';
import 'package:cyber_sec/views/edit_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../error_codes.dart';

class InfoController extends ChangeNotifier{
  bool load = false;
  List<CyberModel>? allInfo = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  clear(){
    titleController
    .clear();
    subTitleController.clear();
    explanationController.clear();
  }

  CyberDatabase cyberDatabase = CyberDatabase();
  init(){
    cyberDatabase.getAllInfo()!.listen((event) {
      allInfo = event;
      notifyListeners();
    });
  }

  Future login(context)async{
    if(emailController
    .text.isEmpty || passwordController.text.isEmpty){
      showToast('Complete all fields');
      return;

    }

    load = true;
    notifyListeners();
    try{
     UserCredential user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
     load = false;
     notifyListeners();
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return EditTextPage();
     }));
    }on FirebaseAuthException catch (e) {
      load = false;
      notifyListeners();


      showToast( ErrorCodes.getFirebaseErrorMessage(e));

    }catch(e){
      load = false;
      notifyListeners();
      showToast( e.toString());
    }
  }

  update(CyberModel cyberModel,context)async{
    load = true;
    notifyListeners();

      if(titleController.text
      .isEmpty || subTitleController.text.isEmpty || explanationController.text.isEmpty
      ){
        showToast("complete all fields");
        return;
      }
      cyberModel.explanation = explanationController.text.trim();
      cyberModel.title = titleController.text.trim().toUpperCase();
      cyberModel.subTitle = subTitleController.text
          .trim();

      bool check = await cyberDatabase.updateInfo(cyberModel);
    load = false;
    notifyListeners();
      if(check){
        showToast("updated successfully");
        Navigator.pop(context);
      }else{
        showToast("unable to update");
      }
  }


  create(context)async{
    load = true;
    notifyListeners();

    if(titleController.text
        .isEmpty || subTitleController.text.isEmpty || explanationController.text.isEmpty
    ){
      showToast("complete all fields");
      return;
    }
    CyberModel cyberModel = CyberModel(
      title:
         titleController.text.trim().toUpperCase()
          ,
      subTitle: subTitleController.text.trim(),
      explanation:
        explanationController.text.trim()
    );


    bool check = await cyberDatabase.createInfo(cyberModel);
    load = false;
    notifyListeners();
    if(check){

      showToast("created info successfully");
      Navigator.pop(context);
      clear();
    }else{
      showToast("unable to create info");
    }

  }
  delete(CyberModel cyberModel)async{
    load = true;
    notifyListeners();
    bool deleteCheck =  await cyberDatabase.deleteInfo(cyberModel);
    if(deleteCheck){

      showToast("deleted info successfully");


    }else{
      showToast("unable to delete info");
    }
    load = false;
    notifyListeners();
  }
}

void showToast(message, {duration = const Duration(seconds: 3)}) =>
    BotToast.showText(
      text: message,
      duration: duration,
    );