import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BotonesPage2 extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/takeiteasy.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _titulos(),
                    _botonesRedondeados(context),
                  ],
                ),
              )
            ],
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Take it easy'),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ),
        ),
      ),
    );
  }


  Widget _titulos() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Take it easy', style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold )),
            SizedBox( height: 10.0 ),
            Text('La mejor app de compras', style: TextStyle( color: Colors.white, fontSize: 18.0 )),
          ],
        ),
      ),
    );

  }


  Widget _botonesRedondeados(BuildContext context) {

    return Table(
      children: [
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.blue, Icons.border_all, 'General' ),
              _crearBotonRedondeado( Colors.purpleAccent, Icons.directions_bus, 'Bus' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.pinkAccent, Icons.shop, 'Buy' ),
              _crearBotonRedondeado( Colors.orange, Icons.insert_drive_file, 'File' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.blueAccent, Icons.movie_filter, 'Entertaiment' ),
              _crearBotonRedondeado( Colors.green, Icons.cloud, 'Grocery' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.red, Icons.collections, 'Photos' ),
              _crearBotonRedondeado( Colors.teal, Icons.help_outline, 'General' ),
            ]
        )
      ],
    );

  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {


    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),

        ),
      ),
    );
  }


}