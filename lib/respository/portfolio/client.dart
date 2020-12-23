import 'package:dio/dio.dart';
import 'package:flutter_boc/helpers/http_helper.dart';
import 'package:flutter_boc/models/portfolio/market_index.dart';
class PortfolioClient extends FetchClient{
 Future<List<MarketIndexModel>> fetchIndexes() async {
   final Response<dynamic> response = await super.financialModelRequest('/api/v3/quote/^DJI,^GSPC,^IXIC,^RUT,^VIX');
   return MarketIndexModel.toList(response.data) ;
 }
}