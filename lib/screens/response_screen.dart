import 'package:flutter/material.dart';
import 'package:mowasla/models/user.dart';
import 'package:mowasla/services/http_services.dart';
import 'dart:async';



class ResponseClass extends StatefulWidget {

 
  @override
  _ResponseClassState createState() => _ResponseClassState();

  
  final HttpServices httpServices = HttpServices();
  late Future<User>? futureUser;

  @override

  void initState() {
   
  }
}

class _ResponseClassState extends State<ResponseClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Column(children: [
          Text(""),

          ],),
  
        );
  }
}

        // child: FutureBuilder<User>(
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.email ?? "");
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }

          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),