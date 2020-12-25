import 'package:dio/dio.dart';
import 'package:flutter_boc/helpers/http_helper.dart';
import 'package:flutter_boc/models/covid/covid_today.dart';
class CovidClient extends FetchClient{
  Future<List<CovidTodayModel>> fetchCovid() async{
    final Response<dynamic> response = await super.CovidModelRequest('/api/open/today') ;
    print([response.data]) ;
    return CovidTodayModel.toList([response.data]) ;
  }
}