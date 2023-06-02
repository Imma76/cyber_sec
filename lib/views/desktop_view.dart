import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cyber_sec/views/admin_login.dart';
import 'package:cyber_sec/views/mobile_view.dart';
import 'package:flutter/material.dart' hide ModalBottomSheet;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morphing_text/morphing_text.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../providers/info_provider.dart';

class DesktopView extends ConsumerStatefulWidget {
  const DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DesktopViewState();
}

class _DesktopViewState extends ConsumerState<DesktopView> {

  GlobalKey _sliderKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(infoProvider).init();

  }
  final List<String>title = [
   'CYBER SECURITY PERCEPTION',
    'Preparation - Protecting Yourself from Cyber Attacks',
    'CYBER SECURITY RESOURCES',


  ];
  final List<String> subTitle = [
    "Perception in cyber security refers to the way individuals or systems perceive and interpret security-related events or information. It involves understanding how attackers exploit human vulnerabilities, biases, and misconceptions to manipulate or deceive individuals or systems to gain unauthorized access, steal data, or compromise security measures. There are several types of attacks that commonly target human perception in cyber security",
    "Preparation is essential to protect yourself from cyber attacks. By implementing certain measures and best practices, you can significantly reduce the risk of falling victim to malicious activities",
    "Resources - Random Article and Tool",

  ];
  final List<String> explanation =[
     "Perception in cyber security refers to the way individuals or systems perceive and interpret security-related events or information. It involves understanding how attackers exploit human vulnerabilities, biases, and misconceptions to manipulate or deceive individuals or systems to gain unauthorized access, steal data, or compromise security measures.\n\n"
    "There are several types of attacks that commonly target human perception in cyber security:\n\n"
        "1. Phishing Attacks: Phishing attacks involve sending deceptive emails, messages, or websites that appear legitimate to trick users into revealing sensitive information such as passwords, credit card details, or login credentials.\n\n"
        "2. Social Engineering: Social engineering attacks rely on manipulating human behavior and psychology to deceive individuals into divulging confidential information or performing actions that compromise security. This can include techniques like impersonation, pretexting, or baiting.\n\n"
        "3. Spear Phishing: Spear phishing attacks are targeted phishing attempts that are customized and personalized to trick specific individuals or organizations. Attackers often gather personal information from various sources to make the phishing attempt more convincing.\n\n"
        "4. Spoofing: Spoofing attacks involve disguising the identity or source of communication to trick individuals into believing it is from a trusted entity. This can include email spoofing, IP address spoofing, or caller ID spoofing.\n\n"
        "5. Malware: Malware refers to malicious software designed to exploit vulnerabilities in computer systems. Attackers may disguise malware as legitimate software or embed it in seemingly harmless files to deceive users into downloading or executing it.\n\n"
        "6. Man-in-the-Middle (MitM) Attacks: MitM attacks intercept communication between two parties without their knowledge and manipulate the information exchanged. Attackers can eavesdrop, alter, or inject malicious content to exploit vulnerabilities in the communication channel.\n\n"
        "7. Impersonation Attacks: Impersonation attacks involve posing as a trusted individual or entity to deceive users into providing sensitive information or performing actions they would not normally do.\n\n"
        "It's important to stay vigilant and employ security best practices such as regularly updating software, using strong and unique passwords, being cautious of unsolicited messages or attachments, and verifying the authenticity of communication before sharing sensitive information. Cybersecurity awareness and education are crucial in mitigating the risks associated with perception-based attacks.",

    "Preparation is essential to protect yourself from cyber attacks. By implementing certain measures and best practices, you can significantly reduce the risk of falling victim to malicious activities. Here are some steps to protect yourself:\n\n"
        "1. Keep Your Software Updated: Regularly update your operating system, antivirus software, web browsers, and other applications to ensure you have the latest security patches and bug fixes.\n\n"
        "2. Use Strong and Unique Passwords: Create strong and unique passwords for all your online accounts. Avoid using easily guessable information and consider using password manager tools to securely store and manage your passwords.\n\n"
        "3. Enable Two-Factor Authentication (2FA): Enable 2FA whenever possible. This adds an extra layer of security by requiring a second form of verification, such as a temporary code or biometric authentication, in addition to your password.\n\n"
        "4. Be Cautious of Suspicious Emails and Phishing Attempts: Exercise caution when opening emails or clicking on links, especially from unknown or suspicious sources. Be wary of phishing attempts and avoid providing sensitive information through email.\n\n"
        "5. Use Secure Wi-Fi Networks: When connecting to public Wi-Fi networks, be cautious of potential risks. Avoid accessing sensitive information or conducting financial transactions on unsecured networks.\n\n"
        "6. Regularly Backup Your Data: Back up your important files and data regularly. This ensures that even if you fall victim to a cyber attack, you can restore your data without significant loss.\n\n"
        "7. Educate Yourself on Cybersecurity Best Practices: Stay informed about the latest cybersecurity threats and best practices. Be aware of common attack techniques, such as phishing, social engineering, and malware, and learn how to identify and avoid them.\n\n"
        "8. Use Firewalls and Security Software: Install reputable antivirus software and enable firewalls on your devices to protect against malware and unauthorized access.\n\n"
        "9. Be Mindful of Social Media and Online Sharing: Be cautious about the information you share online, especially on social media platforms. Avoid sharing sensitive personal information that can be used for identity theft or targeted attacks.\n\n"
        "10. Regularly Monitor Your Accounts: Keep a close eye on your financial accounts, credit reports, and online activities. Report any suspicious or unauthorized transactions immediately.\n\n"
        "By following these practices, you can enhance your cybersecurity posture and reduce the risk of falling victim to cyber attacks. Stay proactive, stay informed, and prioritize your online security.",
    "Here is a random article and a useful tool related to cybersecurity:\n\n"
        "1. Random Article: 'Top 10 Cybersecurity Best Practices' - This article provides valuable insights into essential cybersecurity best practices to protect yourself and your digital assets from various threats. It covers topics such as password security, software updates, and data encryption.\n\n"
        "2. Tool: 'Nmap' - Nmap is a powerful open-source network scanning tool used by cybersecurity professionals to discover and assess vulnerabilities in network systems. It helps identify open ports, services, and potential security risks within a network.\n\n"
        "Both the article and the tool mentioned here can be valuable resources for enhancing your understanding of cybersecurity and strengthening your security measures.",

  ];

  @override
  Widget build(BuildContext context) {
    final infoController = ref.watch(infoProvider);
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/cyber1.jpeg',),fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            Container(
              height:700
              ,
              width: MediaQuery
                  .of(context).size
                  .width - 100,
              child: CarouselSlider.builder(
                  key: _sliderKey,
                  unlimitedMode: true, enableAutoSlider: true,
                  slideBuilder: (index) {
                    return Container(
                      height:300,
                      alignment: Alignment.center,
                      color:Colors.black26,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                        .center,
                        children: [

                          Text(infoController.allInfo![index].title!,style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 40,fontWeight:
                          FontWeight.w500)),

                          Gap(30),


                          GestureDetector(
                            onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileView()));
                              //Navigator.pushNamed(context, MobileView.route);
                              //Navigator.pushNamed(context, AdminPage.route);
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
                                                      fontSize: 18,


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
                                                style: GoogleFonts.crimsonText(color: Colors.black,fontSize: 18)
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
                              child:     RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(text: infoController.allInfo![index].subTitle,style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 40,)),
                                        TextSpan(text: '...read more',style: GoogleFonts.crimsonText(color: Colors.white,fontSize: 40))

                                      ]
                                  ))
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
    );
  }
}
