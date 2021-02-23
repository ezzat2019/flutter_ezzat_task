import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ezzat_task/data/model/weather_model.dart';
import 'package:flutter_ezzat_task/helpers/login_respose.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherScreen extends StatefulWidget {
  final LoginRespose respose;

  WeatherScreen(this.respose, {Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Response> getData(String tokken) async {
    return await Dio().get("http://multi-choice.org/api/WeatherForecast",
        options: Options(headers: {
          'Authorization': 'Bearer $tokken',
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherForecast"),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<Response>(
          future: getData(widget.respose.data.token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              String res = json.encode(snapshot.data.data);
              List<WeatherModel> l = weatherModelFromJson(res);

              return ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      color: Colors.white.withOpacity(.5),
                      elevation: 10,
                      shadowColor: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          FaIcon(
                            FontAwesomeIcons.cloudSun,
                            color: Colors.amber,
                            size: 80,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 100),
                            alignment: Alignment.center,
                            child: Text(
                              l[index].toString(),
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
