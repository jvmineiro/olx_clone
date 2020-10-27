import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class ProductTile extends StatelessWidget {

  ProductTile(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 135,
                width: 127,
                child: Image.file(ad.images[0], fit: BoxFit.cover,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
