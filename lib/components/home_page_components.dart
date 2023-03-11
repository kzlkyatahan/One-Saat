import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageComponents{

  static Widget get analogClock => AnalogClock(
    decoration: BoxDecoration(
      border: Border.all(
        width: 4,
        color: Colors.teal,
        style: BorderStyle.solid,
      ),
      color: Colors.transparent,
      shape: BoxShape.circle,
    ),
    width: 205.w,
    height: 205.w,
    useMilitaryTime: true,
    isLive: true,
    hourHandColor: Colors.black,
    minuteHandColor: Colors.black,
    secondHandColor: Colors.black,
    showSecondHand: true,
    numberColor: Colors.black87,
    showNumbers: true,
    textScaleFactor: 1.5,
    showTicks: true,
    showDigitalClock: false,
    datetime: DateTime.now(),
  );

  static Widget partnerAlarmTextField(
      TextEditingController controller,String hintText,String labelText,
      ){
    return TextField(
      style: GoogleFonts.ubuntu(
        color: Colors.black,
        fontSize: 15.3,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 14,
          top: 12,
          bottom: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        labelText: labelText,
        hintStyle: GoogleFonts.ubuntu(
          color: Colors.black,
          fontSize: 15.3,
        ),
        labelStyle: GoogleFonts.ubuntu(
          color: Colors.black,
          fontSize: 15.3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            )
        ),
      ),
    );
  }

  static Future<bool?> kisaSureliMesaj(String message){
    return Fluttertoast.showToast(
      msg: message,
      fontSize: 16.sp,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

}