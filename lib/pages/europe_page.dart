import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mp_app/pages/details_page.dart';
import 'package:flutter_mp_app/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EuropeCountry extends StatefulWidget {

  @override
  _EuropeCountryState createState() => _EuropeCountryState();
}

class _EuropeCountryState extends State<EuropeCountry> {

  var isFilled = false;
  VoidCallback callBack;
  var itemCount;
  Icon icon;

  Future getData() async {
    var url = "https://restcountries.eu/rest/v2/region/Europe";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          title: Text("Select a Country"),
        ),
        body: FutureBuilder(
          future: getData(),
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Fetch  Something "),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Some Error Occurred"),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        String name = snapshot.data[index]["name"];
                        String domain = snapshot.data[index]["alpha3Code"];
                        String flag = snapshot.data[index]["flag"];
                        String region = snapshot.data[index]["region"];
                        String demonym = snapshot.data[index]["demonym"];
                        String capital = snapshot.data[index]["capital"];
                        String currency =
                        snapshot.data[index]["currencies"][0]["name"];
                        String symbol =
                        snapshot.data[index]["currencies"][0]["symbol"];
                        int population = snapshot.data[index]["population"];
                        String callingcode =
                        snapshot.data[index]["callingCodes"][0];
                        print(name);
                        moveTo(region, name, domain, demonym, callingcode,
                            capital, currency, symbol, flag, population);
                        //  print(snapshot.data[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data[index]["name"])
                                      .text
                                      .bold
                                      .color(Colors.black54)
                                      .xl2
                                      .make()
                                ],
                              ),
                              SvgPicture.network(
                                snapshot.data[index]["flag"],
                                height: 35,
                                width: 35,
                              ),
                              // icon,
                            ],
                          )
                              .box
                              .linearGradient(isFilled
                              ? [blueish, blueish]
                              : [lightBlueish, lightBlueish])
                              .color(isFilled ? blueish : Colors.white)
                              .padding(EdgeInsets.symmetric(
                              horizontal: 16, vertical: 32))
                              .rounded
                              .shadowLg
                              .border(color: blueish, width: isFilled ? 0 : 0.3)
                              .make(),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
            }
          },
        ),

      ),
    );
  }

  void moveTo(
      String region,
      String name,
      String domain,
      String demonym,
      String callingcode,
      String capital,
      String currency,
      String symbol,
      String flag,
      int population) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DetailsPage(
            region: region,
            name: name,
            domain: domain,
            demonym: demonym,
            callingcode: callingcode,
            capital: capital,
            currency: currency,
            symbol: symbol,
            flag: flag,
            population: population),
      ),
    );
  }
}
