import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/bloc/fruad/fruad_bloc.dart';
import 'package:flutter_boc/models/fruad/fruad_model.dart';
import 'package:flutter_boc/models/fruad/fruads.dart';

class FruadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   final FruadBloc fruadBloc = BlocProvider.of<FruadBloc>(context) ;
   return Scaffold(
     appBar: AppBar(title: Text('Fruad')),
     body: BlocBuilder<FruadBloc,FrudsModel>(
       builder: (context, fruads){
         return Center(
           child: Column(
             children: List.generate(fruads.fruads.length, (index) => Text('${fruads.fruads[index].Fname} , ${fruads.fruads[index].Lname}',
             style: TextStyle(fontSize: 30),),
             ),
           ),
         );
       },
   ),
       floatingActionButton: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Padding(
             padding: EdgeInsets.symmetric(vertical: 5.0),
             child: FloatingActionButton(
               child: Icon(Icons.show_chart),
               onPressed: () {
                 fruadBloc.add(FruadEvent.show) ;
               },
             ),
           )
         ],
   ),
   );
  }

}