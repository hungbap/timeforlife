import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static form({
    String? hinttext,
    String? labeltext,
    String? errorText, TextInputType? keyboardType,

  }) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        focusColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        fillColor: Colors.black,
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelText: labeltext,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        errorText: errorText,

      ),
    );
  }
  static contai({
        String? text, Color? color,
      }) {
    return ScreenUtilInit(
    builder: ()=> Container(
      height: 80,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,

      ),
      child: Text(text!, style: TextStyle(fontSize: 18, color: Colors.black),),
    )
    );
  }
  static uista({
    String ? text
}){
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: EdgeInsets.only(left: 10, top:10),
              child: Text(text!, style: TextStyle(color: Color(0xff0B05C7), fontSize:  17),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }
 static contaidate({
   String? text}){
    return Container(
      height: 40,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        text!,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
}
  static hideKeyboard(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static String deleteDot(String s) {
    if (s.contains('.')) {
      return s.trim().replaceAll(RegExp('\\.'), '');
    }
    return s.trim();
  }
}
