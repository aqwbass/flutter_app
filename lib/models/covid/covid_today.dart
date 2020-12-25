import 'dart:developer';

class CovidTodayModel {
  final int confirmed ;
  final int recovered ;
  final int hospitalized ;
  final int deaths ;
  final int newconfirmed ;
  final int newrecovered;
  final int newhospitalized;
  final int newdeaths;
  final String date ;
  final String source ;

  CovidTodayModel({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newconfirmed,
    this.newrecovered,
    this.newhospitalized,
    this.newdeaths,
    this.date,
    this.source
  });
  static List<CovidTodayModel> toList(List<dynamic> items){
    return items
        .map((item) => CovidTodayModel.fromJson(item))
        .toList() ;
  }
  factory CovidTodayModel.fromJson(Map<String, dynamic> json){
    return CovidTodayModel(
      confirmed: json['Confirmed'],
      recovered: json['Recovered'],
      hospitalized: json['Hospitalized'],
      deaths: json['Deaths'],
      newconfirmed: json['NewConfirmed'],
      newrecovered: json['NewRecovered'],
      newhospitalized: json['NewHospitalized'],
      newdeaths: json['NewDeaths'],
      date: json['UpdateDate'],
      source: json['Source'],
    );
  }

}