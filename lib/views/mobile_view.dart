import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../providers/info_provider.dart';
import 'admin_login.dart';

class MobileView extends ConsumerStatefulWidget {
  static const route  = 'mobil';
  const MobileView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MobileViewState();
}

class _MobileViewState extends ConsumerState<MobileView> {
  GlobalKey _sliderKey = GlobalKey();
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

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/cyber1.jpeg',),fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
               height:900
               ,
                width: MediaQuery
                    .of(context).size
                    .width - 10,
                child: CarouselSlider.builder(
                    key: _sliderKey,
                    unlimitedMode: true,

                    //enableAutoSlider: true,
                    slideBuilder: (index) {
                      return Container(
                        height:  MediaQuery
                            .of(context).size.height,
                       // alignment: Alignment.center,
                        color:Colors.black26,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start,
                          children: [
                            Gap(30),
                            Text(infoController.allInfo![index].title!,style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 20,fontWeight:
                            FontWeight.w500)),

                            Gap(30),


                            GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileView()));
                                // Navigator.pushNamed(context, MobileView.route);
                               // Navigator.pushNamed(context, AdminPage.route);
                                 showCupertinoModalBottomSheet(context: context, builder: (context){
                                   return Scaffold(
                                     body: Container(
                                       height: 700,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:8.0,right:12,left: 12, bottom:8),
                                         child: SingleChildScrollView(
                                           child: Column(

                                             children: [
                                               Row(
                                                 crossAxisAlignment:CrossAxisAlignment.center,
                                                 mainAxisAlignment:MainAxisAlignment.center,
                                                 children: [
                                                   Spacer(),
                                                   Center(
                                                     child: Text(
                                                       infoController.allInfo![index].title!,
                                                       textAlign: TextAlign.center,
                                                       style: GoogleFonts.crimsonText(
                                                         fontSize: 13,


                                                         fontWeight: FontWeight.bold,
                                                       ),
                                                     ),
                                                   ),

                                                   Spacer(),

                                                   IconButton(icon: Icon(Icons.close),onPressed: (){
                                                     Navigator.pop(context);
                                                   },)
                                                 ],
                                               ),

                                               Gap(30),

                                           Animate(
                                               effects: [FadeEffect(), ScaleEffect()],
                                               delay: Duration
                                                 (milliseconds: 500),
                                                 child: Text(
                                                     infoController.allInfo![index].explanation!,
                                                   style: GoogleFonts.crimsonText(color: Colors.black,fontSize: 14)
                                                 ),
                                               )

                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   );
                                 });
                              },
                              child: Animate(
                                  effects: [FadeEffect(), ScaleEffect()],
                                  delay: Duration
                                    (milliseconds: 1000),
                                  child:     Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                        text: TextSpan(
                                            children: [
                                              TextSpan(text: infoController.allInfo![index].subTitle,style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 20,)),
                                              TextSpan(text: '...read more',style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 20))

                                            ],
                                        )),
                                  )
                              ),
                            )


                            //),
                          ],
                        ),
                      );
                    },
                    slideTransform: CubeTransform(),

                    itemCount: infoController.allInfo!.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
