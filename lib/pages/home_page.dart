import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saat/components/home_page_components.dart';
import 'package:saat/constants/constants.dart';
import 'package:saat/data/data.dart';
import 'package:saat/pages/about_page.dart';
import 'package:timer_builder/timer_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController hour_controller=TextEditingController();
  TextEditingController minute_controller=TextEditingController();

  TextEditingController timer_controller=TextEditingController();

  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async{
    await Future.delayed(
      const Duration(seconds: 3),
    );
    FlutterNativeSplash.remove();
  }

  Future<bool> backKey(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 24.0,
            top: 22.0,
          ),
          actionsPadding: const EdgeInsets.only(
            top: 25.0,
            right: 15.0,
            bottom: 10.0,
          ),
          titlePadding: const EdgeInsets.only(
            left: 24,
            top: 20.0,
          ),
          title: Text(
            "Uyarı",
            style: GoogleFonts.ubuntu(
              fontSize: 25.sp,
            ),
          ),
          content: Text(
            "Çıkış yapmak istiyor musunuz?",
            style: GoogleFonts.ubuntu(
              fontSize: 17.sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                exit(0);
              },
              child: Text(
                "Evet",
                style: GoogleFonts.ubuntu(
                  fontSize: 17.sp,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                "Hayır",
                style: GoogleFonts.ubuntu(
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () => backKey(context),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: HomePageComponents.analogClock,
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: TimerBuilder.periodic(
                      Duration(seconds: 1),
                      builder: (context){
                    return Text(
                      "${Data.getSystemTime()}",
                      style: GoogleFonts.ubuntu(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Alarmlar",
                    style: GoogleFonts.ubuntu(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  margin: Constants.homePageCardMargin,
                  shadowColor: Colors.black,
                  elevation: 5,
                  semanticContainer: true,
                  shape: OutlineInputBorder(
                    borderRadius: Constants.homePageCardBorderRadius,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  color: Colors.teal[300],
                  child: Padding(
                    padding: Constants.homePageCardColumnPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alarm_rounded,
                              color: Colors.white,
                              size: 26.sp,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Alarm Oluştur",
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        HomePageComponents.partnerAlarmTextField(
                          hour_controller, "Saat Giriniz", "Saat",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HomePageComponents.partnerAlarmTextField(
                          minute_controller, "Dakika Giriniz", "Dakika",
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                int? hour=int.tryParse(hour_controller.text.toString());
                                int? minute=int.tryParse(minute_controller.text.toString());

                                if ((hour_controller.text!="") &&
                                    (minute_controller.text!="")){
                                  HomePageComponents.kisaSureliMesaj("Alarm oluşturuldu");
                                  FlutterAlarmClock.createAlarm(hour!, minute!);
                                }else{
                                  HomePageComponents.kisaSureliMesaj("Alanlar boş bırakılamaz");
                                }
                              },
                              child: Center(
                                child: Text(
                                  "Alarm Oluştur",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                HomePageComponents.kisaSureliMesaj("Alarm sayfasına yönlendiriliyor");
                                FlutterAlarmClock.showAlarms();
                              },
                              child: Text(
                                "Alarmları Göster",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  margin: Constants.homePageCardMargin,
                  shadowColor: Colors.black,
                  elevation: 5,
                  semanticContainer: true,
                  shape: OutlineInputBorder(
                    borderRadius: Constants.homePageCardBorderRadius,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  color: Colors.teal[300],
                  child: Padding(
                    padding: Constants.homePageCardColumnPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alarm_rounded,
                              color: Colors.white,
                              size: 26.sp,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Zamanlayıcı Oluştur",
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        HomePageComponents.partnerAlarmTextField(
                          timer_controller, "Saniye Giriniz", "Saniye",
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: (){
                              int? seconds=int.tryParse(timer_controller.text.toString());

                              if (timer_controller.text != ""){
                                HomePageComponents.kisaSureliMesaj("Zamanlayıcı oluşturuldu");
                                FlutterAlarmClock.createTimer(seconds!);
                              }else{
                                HomePageComponents.kisaSureliMesaj("Alan boş bırakılamaz");
                              }
                            },
                            child: Text(
                              "Zamanlayıcı Oluştur",
                              style: GoogleFonts.ubuntu(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: (){
                              HomePageComponents.kisaSureliMesaj("Zamanlayıcılar sayfasına yönlendiriliyor");
                              FlutterAlarmClock.showTimers();
                            },
                            child: Text(
                              "Zamanlayıcıları Göster",
                              style: GoogleFonts.ubuntu(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0,right: 80.0),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) =>
                      const AppAboutPage())
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_rounded,
                          size: 30.w,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Uygulama Hakkında",
                          style: GoogleFonts.ubuntu(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}