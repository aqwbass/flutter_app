import 'package:meta/meta.dart';
class FruadModel{
  String Fname ;
  String Lname ;

  FruadModel() ;

  factory FruadModel.fromJson(Map<String, dynamic> json){
  FruadModel f = FruadModel() ;
  f.Fname = json['Fname'] ;
  f.Lname = json['Lname'] ;
  return f ;
  }
  static List<FruadModel> toList(List<dynamic> fruads) {
    return fruads
        .map((fruad) => FruadModel.fromJson(fruad))
        .toList() ;
  }


}