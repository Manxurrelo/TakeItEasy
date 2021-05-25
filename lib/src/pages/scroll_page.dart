import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[_pagina1(), _pagina2(context)],
        ));
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/descarga.png'),
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.black, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('11°', style: estiloTexto),
          Text('Miércoles', style: estiloTexto),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.black)
        ],
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child:
                    Text('Take Premium', style: TextStyle(fontSize: 20.0)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'login'),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child:
                    Text('Shop online', style: TextStyle(fontSize: 20.0)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'fondo'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Padding(

                    padding:
                    EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child:
                    Text('Contact us', style: TextStyle(fontSize: 20.0)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'chat'),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child:
                    Text('Settings', style: TextStyle(fontSize: 20.0)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'settings'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child:
                    Text('Make your own list', style: TextStyle(fontSize: 20.0)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'bbdd'),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}