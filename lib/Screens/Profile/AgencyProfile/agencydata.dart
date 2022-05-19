import 'package:flutter/material.dart';

class Agency {
  String companyname;
  String email;
  String phone;
  String agencyimage;

  Agency(
    this.companyname,
    this.email,
    this.phone,
    this.agencyimage,
  );
}

class Agencyinfo {
  Agency myagency = Agency(
    "Real estate",
    "Agencyname@gmail.com",
    "0675915949",
    "assets/images/owner.jpg",
  );
}
