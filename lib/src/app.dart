//import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './models/image_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

//Create a class that will be our custom Widget
//This class must extend the 'StatelessWidget' base class
class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fecthImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  //Must define a 'build' method that returns
  //the widgets that *this* widget will show
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: new ImageList(images),
        appBar: AppBar(
          title: Text('Lets see some images! test!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fecthImage,
        ),
      ),
    );
  }
}
