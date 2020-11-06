import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {

  Future<String> downloadData(){
    return Future.delayed(Duration(seconds: 3),(){
      return "Dummy String";
    });
  }

  @override
  Widget build(BuildContext context) {
    //Don't forget type parameter
    return FutureBuilder<String>(
      //Don't forget future parameter (it's future source)
      future:downloadData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState==ConnectionState.done){return Text(snapshot.data);}
        else{return CircularProgressIndicator();}
      //  if(snapshot.hasError){...}
     //   if(snapshot.hasData){...}
      },);
  }
}


