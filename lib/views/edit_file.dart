import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../providers/info_provider.dart';

class EditTextPage extends ConsumerStatefulWidget {
  const EditTextPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EditTextPageState();
}

class _EditTextPageState extends ConsumerState<EditTextPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(infoProvider).init();

  }
  @override
  Widget build(BuildContext context) {
    final infoController = ref.watch(infoProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){
        infoController.clear();
      showCupertinoModalBottomSheet(context: context, builder: (context)
      {

        return Scaffold(
          body: Container(
            height: 900,
            child: StatefulBuilder(
              builder: (context,widget) {
                final infoController2 = ref.watch(infoProvider);
                return Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [



                          Spacer(),

                          IconButton(icon: Icon(Icons.close),onPressed: (){
                            Navigator.pop(context);
                          },)
                        ],
                      ),
                      TextField(
                        controller: infoController.titleController,
                        decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            border:
                            OutlineInputBorder()
                        ),

                      ),
                      Gap(20),
                      TextField(
                        controller: infoController.subTitleController,
                        decoration: InputDecoration(
                            hintText: 'Sub title',
                            hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            border:
                            OutlineInputBorder()
                        ),

                      ),
                      Gap(20),
                      TextField(
                        controller: infoController.explanationController,
                        maxLines: 10,
                        decoration: InputDecoration(
                            hintText: 'explanation',
                            hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            border:
                            OutlineInputBorder()
                        ),

                      ),
                      Gap(30),

                      infoController2.load
                          ? Center(child: CircularProgressIndicator(),):ElevatedButton(onPressed: () async{
                        await  infoController.create( context);


                      },child: Text('Create',style:GoogleFonts.crimsonText(color: Colors.white,fontSize: 20),),style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity,60),
                        minimumSize: Size(double.infinity,60),

                      ),),
                    ],
                  ),
                );
              }
            ),

          ),
        );
      });

      },child: Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.separated(
              separatorBuilder: (context,index)=>Container(height: 2,color: Colors.black,width: double.infinity,),
              shrinkWrap: true,
              itemCount: infoController.allInfo!
                .length,
              itemBuilder: (context,index) {
                if(index == 0){
                 return  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 8.0, right: 8.0),
                    child: GestureDetector(
                      onLongPress: ()async{
                        await infoController.delete(infoController.allInfo![index]);
                      },
                      onTap: (){
                      showCupertinoModalBottomSheet(context: context, builder: (context)
                      {
                        infoController.titleController.text =  infoController.allInfo![index].title!;
                        infoController.subTitleController.text = infoController.allInfo![index].subTitle!;
                        infoController.explanationController.text = infoController.allInfo![index].explanation!;

                        return Scaffold(
                          body: Container(
                            height: 900,
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 8.0, right: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [



                                      Spacer(),

                                      IconButton(icon: Icon(Icons.close),onPressed: (){
                                        Navigator.pop(context);
                                      },)
                                    ],
                                  ),
                                  TextField(
                                    controller: infoController.titleController,
                                    decoration: InputDecoration(
                                        hintText: 'title',
                                        hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        border:
                                        OutlineInputBorder()
                                    ),

                                  ),
                                  Gap(10),
                                  TextField(
                                    controller: infoController.subTitleController,
                                    decoration: InputDecoration(
                                        hintText: 'sub title',
                                        hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        border:
                                        OutlineInputBorder()
                                    ),

                                  ),
                                  Gap(10),
                                  TextField(
                                    controller: infoController.explanationController,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        hintText: 'description',
                                        hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        border:
                                        OutlineInputBorder()
                                    ),

                                  ),
                                  Gap(10),
                                  infoController.load
                                      ? Center(child: CircularProgressIndicator(),):ElevatedButton(onPressed: () async{

                                    await  infoController.update(infoController.allInfo![index], context);

                                  },child: Text('Update',style:GoogleFonts.crimsonText(color: Colors.white,fontSize: 20),),style: ElevatedButton.styleFrom(
                                    fixedSize: Size(double.infinity,60),
                                    minimumSize: Size(double.infinity,60),

                                  ),),
                                ],
                              ),
                            ),

                          ),
                        );
                      });
                    },
                      child: Container(
                        height: 70,
                        color: Colors.white24,
                        width: double.infinity,

                        child: Center(
                          child: Row(
                            children: [
                              Text('1'),Gap(30),
                              Text(infoController.allInfo!
                              [index].title!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 8.0, right: 8.0),
                  child: GestureDetector(
                    onLongPress: ()async{
                      await infoController.delete(infoController.allInfo![index]);
                    },
                    onTap: (){
                    showCupertinoModalBottomSheet(context: context, builder: (context)
                    {
                      infoController.titleController.text =  infoController.allInfo![index].title!;
                      infoController.subTitleController.text = infoController.allInfo![index].subTitle!;
                      infoController.explanationController.text = infoController.allInfo![index].explanation!;

                      return Scaffold(
                        body: Container(
                          height: 900,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 8.0, right: 8.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: infoController.titleController,
                                  decoration: InputDecoration(
                                      hintText: 'title',
                                      hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(),
                                      border:
                                      OutlineInputBorder()
                                  ),

                                ),
                                Gap(10),
                                TextField(
                                  controller: infoController.subTitleController,
                                  decoration: InputDecoration(
                                      hintText: 'sub title',
                                      hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(),
                                      border:
                                      OutlineInputBorder()
                                  ),

                                ),
                                Gap(10),
                                TextField(
                                  controller: infoController.explanationController,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                      hintText: 'description',
                                      hintStyle: GoogleFonts.crimsonText(color: Colors.black,fontSize: 20),
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(),
                                      border:
                                      OutlineInputBorder()
                                  ),

                                ),
                                Gap(10),
                                infoController.load
                                    ? Center(child: CircularProgressIndicator(),):ElevatedButton(onPressed: () async{


                                     await  infoController.update(infoController.allInfo![index],context);

                                },child: Text('Update',style:GoogleFonts.crimsonText(color: Colors.white,fontSize: 20),),style: ElevatedButton.styleFrom(
                                  fixedSize: Size(double.infinity,60),
                                  minimumSize: Size(double.infinity,60),

                                ),),
                              ],
                            ),
                          ),

                        ),
                      );
                    });
                  },
                    child: Container(
                      height: 70,
                      color: Colors.white24,
                      width: double.infinity,

                      child: Center(
                        child: Row(
                          children: [
                            Text('${index + 1}'),Gap(30),
                            Text(infoController.allInfo!
                                [index].title!),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
