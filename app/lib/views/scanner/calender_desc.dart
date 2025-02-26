import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/controllers/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_selector/number_selector.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CalenderDesc extends StatelessWidget {
  CalenderDesc({super.key, required this.imagePath});
  String imagePath;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Select timings"),
      content: Container(
        width: 318.w,
        height: 339.h,
        child: Column(
          children: [
            CheckboxListTile(
                title: Text(
                  "Before Breakfast",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "Before Lunch",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "Before Dinner",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            const Divider(
              thickness: 2,
            ),
            CheckboxListTile(
                title: Text(
                  "After Breakfast",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "After Lunch",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "After Dinner",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {})
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: const Icon(
          PhosphorIcons.caretLeft,
          color: Colors.black,
          size: 32.0,
        ),
        title: const Text(
          "Schedule Medicines",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: ScannerService().upload(File(imagePath)),
        builder: (context, data) {
          if (data.hasError) {
            return const Text('error 404');
          } else if (data.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 29.h),
                  child: NumberSelector(
                    current: 0,
                    onUpdate: (number) {},
                    borderRadius: 20,
                    hasCenteredText: true,
                    min: 0,
                    showMinMax: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value) {
                              print(value); //selected value
                            }),
                      ),
                      Text(
                        "Everyday",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value) {
                              print(value); //selected value
                            }),
                      ),
                      Text(
                        "Alternate days",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F4FE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(326.w, 44.h), //////// HERE
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'Select Timings',
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, color: const Color(0xFF3B63DA)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 19.h),
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 17.0.w, right: 165.w, top: 12.h),
                  child: Text(
                    "About my medicine",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 40.0.w, right: 35.w, top: 8.h),
                      child: Text(
                        "Brufen 200",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: const Color(0xFF3B63DA),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 38.0.w, right: 45.w, top: 8.h),
                      child: Text(
                        " Ibuprofen 200 mg",
                        style: GoogleFonts.poppins(fontSize: 15.sp),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0.w, top: 20.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20),
                        child: Container(
                          height: 38.h,
                          width: 117.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Pain Killer",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  color: const Color(0xFF3B63DA)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F4FE),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20),
                        child: Container(
                          height: 38.h,
                          width: 117.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Inflammation",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  color: const Color(0xFF3B63DA)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F4FE),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B63DA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(320.w, 44.h), //////// HERE
                    ),
                    onPressed: () {},
                    child: Text(
                      'Schedule Now',
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CupertinoActivityIndicator(), Text('Loading')],
            ));
          }
        },
      ),
    );
  }
}
