import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/info_provider.dart';



class AdminLoginPage extends ConsumerStatefulWidget {
  static const route  = 'admin';
  const AdminLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminLoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(infoProvider);
  }
  @override
  Widget build(BuildContext context) {

    final infoController = ref.watch(infoProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title:Text('Login',style: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: infoController.emailController,
              decoration: InputDecoration(
                hintText: 'email',
                hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                border:
                OutlineInputBorder()
              ),

            ),
Gap(10),
            TextField(
              controller: infoController.passwordController,
              decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  border:
                  OutlineInputBorder()
              ),
            ),
            Gap(30),
           infoController.load
            ? Center(child: CircularProgressIndicator(),):ElevatedButton(onPressed: () async{
              await infoController.login(context);


            },child: Text('Login',style:GoogleFonts.crimsonText(color: Colors.white,fontSize: 20),),style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity,60),
              minimumSize: Size(double.infinity,60),

            ),),
          ],
        ),
      ),
    );
  }
}
