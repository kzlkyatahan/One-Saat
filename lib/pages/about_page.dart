import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saat/constants/constants.dart';
import 'package:saat/pages/home_page.dart';

class AppAboutPage extends StatefulWidget {
  const AppAboutPage({Key? key}) : super(key: key);

  @override
  State<AppAboutPage> createState() => _AppAboutPageState();
}

class _AppAboutPageState extends State<AppAboutPage> {

  Future<bool> backKey(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>
    const HomePage()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 3,
          title: Center(
            child: Text(
              "Uygulama Hakkında",
              style: GoogleFonts.ubuntu(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () => backKey(context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Uygulama Adı: ",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " One™ Saat",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sürüm Numarası: ",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " 1.0.1",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Uygulama Türü: ",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " Ekosistem Uygulaması",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Altyapı:",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(
                            "images/app_about_platform.svg",
                            width: 236.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Altyapı Revizyonu: ",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " AGMPMAWD01",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Ekosistem:",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(
                            "images/one_ecosystem.svg",
                            width: 180.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    margin: Constants.aboutPageCardMargin,
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: Constants.aboutPageCardRowPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Güncelleme Hizmeti:",
                            style: GoogleFonts.ubuntu(
                              fontSize: (17.5).sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(
                            "images/upser.svg",
                            width: 97.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}