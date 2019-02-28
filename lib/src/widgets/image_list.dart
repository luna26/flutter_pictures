import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  Widget buildImage(ImageModel image){
    return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue)
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(image.url), 
                  padding: EdgeInsets.only(
                    bottom: 8
                   )
                ),
                Text(image.title),
              ]
            ),
          );
  }

  //Image.network(image.url)

  Widget build(context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return buildImage(images[index]);
        });
  }
}
