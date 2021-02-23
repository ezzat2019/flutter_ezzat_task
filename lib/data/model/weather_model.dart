
import 'dart:convert';

List<WeatherModel> weatherModelFromJson(String str) => List<WeatherModel>.from(json.decode(str).map((x) => WeatherModel.fromJson(x)));

String weatherModelToJson(List<WeatherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherModel {
  WeatherModel({
    this.date,
    this.temperatureC,
    this.temperatureF,
    this.summary,
  });

  DateTime date;
  int temperatureC;
  int temperatureF;
  String summary;


  @override
  String toString() {
    return 'date: $date\ntemperatureC: $temperatureC\ntemperatureF: $temperatureF\nsummary: $summary';
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    date: DateTime.parse(json["date"]),
    temperatureC: json["temperatureC"],
    temperatureF: json["temperatureF"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "temperatureC": temperatureC,
    "temperatureF": temperatureF,
    "summary": summary,
  };
}
