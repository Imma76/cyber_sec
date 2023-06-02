import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_sec/model/cyber_model.dart';

class CyberDatabase{
  static CollectionReference info = FirebaseFirestore.instance
      .collection("info");


  Stream<List<CyberModel>?>? getAllInfo(){
    try{
   return   info.snapshots().map((event) => event.docs.map((e)  {
     Map<String, dynamic> data = e.data() as Map<String, dynamic>;
     data['id'] = e.id;
  return  CyberModel.fromJson(data);}).toList());

    }catch(e){
      return null;
    }

  }

  Future<bool> updateInfo(CyberModel cyberModel)async{
    try{
      await info.doc(cyberModel.id).set(cyberModel.toJson());
      return true;
    }catch(e){
      return false;
    }
  }


  Future<bool> createInfo(CyberModel cyberModel)async{
    try{
      await info.add(cyberModel.toJson());
      return true;
    }catch(e){
      return false;
    }
  }
  Future<bool> deleteInfo(CyberModel cyberModel)async{
    try{
      await info.doc(cyberModel.id).delete();
      return true;
    }catch(e){
      return false;
    }
  }
}