import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mp_app/pages/europe_page.dart';
import 'package:flutter_mp_app/pages/select_country.dart';

class RegionList {

  final String title;
  final Widget navigateScreen;

  RegionList({ this.title,  this.navigateScreen});

  static List<RegionList> homeList = [

    RegionList(
      title: 'Asia',
      navigateScreen: AsiaCountry(),
    ),
    RegionList(
      title: 'Europe',
      navigateScreen: EuropeCountry(),
    ),
  ];
}
