import 'dart:ui';

import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';

Padding button({required text1,required  isLoading1,required  tap}) {
  bool isLoading = isLoading1;
  VoidCallback? tap;
  String text = text1;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff373737),
                    Color(0xff6A6A6A),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: ElevatedButton(
              onPressed: tap,
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: kWhite,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Loading please wait...')
                      ],
                    )
                  : Text(text,style: TextStyle(fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    2.5,),),
            ),
          ),
        ),
      ],
    ),
  );
}
