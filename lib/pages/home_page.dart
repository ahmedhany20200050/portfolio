import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items_strings.dart';
import 'package:portfolio/widgets/Header.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ItemScrollController scrollController = ItemScrollController();
  List<Widget> navItems = [
    const MainSection(),
    const Skills(),
    const Projects()
  ];
  double iconsSize = 10.sp;
  Future<void> scrollToIndex(int index) async {
    await scrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      backgroundColor: CustomColor.scaffoldBg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const Header(),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: navItems.length,
                    itemBuilder: (context, index) => navItems[index],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceAround,
              textDirection: TextDirection.rtl,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.blue.withOpacity(0.5),
                        blurRadius: 25.sp,
                        spreadRadius: 2.sp,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45.sp,
                        backgroundColor: CustomColor.blue,
                        child: CircleAvatar(
                          radius: 35.sp,
                          backgroundColor: CustomColor.scaffoldBg,
                        ),
                      ),

                      Image.asset(
                        "assets/images/protfolioImage.png",
                        height: 100.sp,

                      ),
                    ],
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Column(
                      children: [
                        Logo(
                          logoText: "Ahmed Hany",
                        ),
                        Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              //use twitter icon from font awesome
                              onPressed: () async {
                                //use url launcher to launch the whatsapp link
                                await launchUrl(Uri.parse(
                                    "https://api.whatsapp.com/send/?phone=201154951688&text=Hello"));
                              },
                              icon: FaIcon(FontAwesomeIcons.whatsapp,
                                  size: 8.sp, color: Colors.green),
                            ),
                            IconButton(
                              //use twitter icon from font awesome
                              onPressed: () async{
                                //use url launcher to launch the mailto link
                                await launchUrl(Uri.parse("https://www.linkedin.com/in/%D8%A7%D8%AD%D9%85%D8%AF-%D9%87%D8%A7%D9%86%D9%8A-3a86351b8/"));
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.linkedinIn,
                                size: 8.sp,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                //use url launcher to launch the mailto link
                                await launchUrl(Uri.parse(
                                    "https://github.com/ahmedhany20200050"));
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.github,
                                size: 8.sp,
                              ),
                            ),
                            IconButton(
                              //use twitter icon from font awesome
                              onPressed: () async {
                                //use url launcher to launch the mailto link
                                await launchUrl(Uri.parse(
                                    "mailto:ahmedhany20200050@gmail.com?subject=Flutter Development&body=Hello"));
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.envelope,
                                size: 8.sp,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // DefaultTextStyle(
            //   maxLines: 1,
            //   style: TextStyle(
            //     fontFamily: "Horizon",
            //     fontSize: 12.sp,
            //     color: CustomColor.blue,
            //   ),
            //   child: SizedBox(
            //     height: 22.sp,
            //     child: AnimatedTextKit(
            //       pause: const Duration(milliseconds: 0),
            //       repeatForever: true,
            //       isRepeatingAnimation: true,
            //       animatedTexts: [
            //         RotateAnimatedText('Android'),
            //         RotateAnimatedText('IOS'),
            //         RotateAnimatedText('Web'),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 16.sp,
            // ),
          ],
        );
      }
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      color: CustomColor.scaffoldBg.withBlue(30),
      child: Column(
        children: [
          SizedBox(
            height: 16.sp,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.sp,
            children: const [
              SkillItem(
                skillName: "Flutter",
                imagePath: "assets/images/flutter.png",
              ),
              SkillItem(
                skillName: "Dart",
                imagePath: "assets/images/dart.png",
              ),
              SkillItem(
                skillName: "Firebase",
                imagePath: "assets/images/firebase.png",
              ),
              SkillItem(
                skillName: "Git/Github",
                imagePath: "assets/images/git.png",
              ),
              SkillItem (
                skillName: "Figma",
                imagePath: "assets/images/figma.png",
              ),
              SkillItem(
                imagePath: "assets/images/logo.webp",
                skillName: "bloc/cubit",
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  const SkillItem({super.key, required this.skillName,this.imagePath});
  final String skillName;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: CustomColor.scaffoldBg,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              if(imagePath != null) Image.asset(imagePath!,height: 20.sp,width: 20.sp,),
              SizedBox(height: 8.sp,),
              Text(
                skillName,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          Text(
            "Projects",
            style: TextStyle(
              fontSize: 20.sp,
              color: CustomColor.blue,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ProjectItem(
                projectName: "Book Store App",
                projectDescription:
                    "Used: Http package, Cubit, Shared Preferences, Path Provider, and more.",
                projectImage: "assets/images/BookStore.jpg",
              ),
              ProjectItem(
                projectName: "Chat App",
                projectDescription:
                    "Chat app with firebase authentication and firestore database",
                projectImage: "assets/images/Chat.jpg",
              ),
              ProjectItem(
                projectName: "Weather App",
                projectDescription:
                    "Weather app with open weather api and geolocator",
                projectImage: "assets/images/clima.jpeg",
              ),
              ProjectItem(
                projectName: "Portfolio",
                projectDescription: "My portfolio app",
                projectImage: "assets/images/protfolioImage.png",
              ),
              ProjectItem(
                projectName: "Deraya for Educational Courses",
                projectDescription: "Used: Gallery package,Http package, Cubit,Youtube package, Shared Preferences, Path Provider, and more.",
                projectImage: "assets/images/Deraya.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectImage,
  });
  final String projectName;
  final String projectDescription;
  final String projectImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.scaffoldBg,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Image.asset(
              projectImage,
              height: 200.sp,
            ),
            SizedBox(
              height: 8.sp,
            ),
            Text(
              projectName,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Text(
              projectDescription,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
