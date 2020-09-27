import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mp_app/utils/colors.dart';

class DetailsPage extends StatelessWidget {
  final String region;
  final String name;
  final String domain;
  final String demonym;
  final String callingcode;
  final String capital;
  final String currency;
  final String symbol;
  final String flag;
  final int population;

  const DetailsPage(
      {Key key,
      this.region,
      this.name,
      this.domain,
      this.demonym,
      this.callingcode,
      this.capital,
      this.currency,
      this.symbol,
      this.flag,
      this.population})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whitecolor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //   child: Container(
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white60, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 30,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: ' $region',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                color: Colors.black)),
                        TextSpan(
                            text: ' / $name',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.blue,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              //  child: Container(
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white60, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  width: 400,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.network(
                        flag,
                        height: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '$name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 26,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '($domain)',
                                      style: TextStyle(
                                          fontFamily: "Serif",
                                          color: Colors.blue,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                            // Text(
                            //   '$name' '($domain)',
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 23,
                            //       color: Colors.black),
                            // ),
                            Text(
                              '$capital',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              "Demonnym"
                                  .text
                                  .xl
                                  .normal
                                  .color(Colors.grey)
                                  .textStyle(context.captionStyle)
                                  .make(),
                              SizedBox(
                                height: 10,
                              ),
                              name.text.normal.color(Colors.black).xl2.make()
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              "Calling Code"
                                  .text
                                  .xl
                                  .normal
                                  .color(Colors.grey)
                                  .textStyle(context.captionStyle)
                                  .make(),
                              SizedBox(
                                height: 10,
                              ),
                              callingcode.text.normal
                                  .color(Colors.black)
                                  .xl2
                                  .make()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              "Currency"
                                  .text
                                  .xl
                                  .normal
                                  .color(Colors.grey)
                                  .textStyle(context.captionStyle)
                                  .make(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$symbol ' '$capital',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              "Population"
                                  .text
                                  .xl
                                  .normal
                                  .color(Colors.grey)
                                  .textStyle(context.captionStyle)
                                  .make(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$population',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
