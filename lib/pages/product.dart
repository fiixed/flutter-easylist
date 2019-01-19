import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductPage(this.title, this.description, this.price, this.imageUrl);

  // _showWarningDialog(BuildContext context) {
  //   showDialog(context: context, builder: (BuildContext context) {
  //                   return AlertDialog(
  //                     title: Text('Are you sure?'),
  //                     content: Text('This action cannot be undone'),
  //                     actions: <Widget>[
  //                       FlatButton(child: Text('DISCARD'), onPressed: () {
  //                         Navigator.pop(context);
  //                       },),
  //                       FlatButton(child: Text('CONTINUE'), onPressed: () {
  //                         Navigator.pop(context);
  //                         Navigator.pop(context, true);
  //                       },),

  //                     ],
  //                   );
  //                 });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Union Square, San Francisco',
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                ),
                Text(
                  '\$' + price.toString(),
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
