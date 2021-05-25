/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'dart:ui';

class AnimatedBottomBar extends StatefulWidget {
  static final String path = "lib/src/pages/animations/anim4.dart";
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Take It Easy',
          ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(
          currentIndex: _currentPage,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }

  getPage(int page) {
    switch(page) {
      case 0:
        return food();
      case 1:
        return travel();
      case 2:
        return botones();
    }
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: Icons.fastfood_sharp,
                title: "Food",
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: Icons.airplanemode_active,
                title: "Travel",
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: Icons.apps_outlined,
                title: "Apps",
                isActive: currentIndex == 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  const BottomNavItem(
      {Key key,
        this.isActive = false,
        this.icon,
        this.activeColor,
        this.inactiveColor,
        this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: activeColor ?? Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      )
          : Icon(
        icon,
        color: inactiveColor ?? Colors.black,
      ),
    );
  }
}

class botones extends StatelessWidget {

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
                    _botonesRedondeados(context),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }




  Widget _botonesRedondeados(BuildContext context) {

    return Table(
      children: [
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.blue, Icons.shop, 'Clothes' ),
              _crearBotonRedondeado( Colors.purpleAccent, Icons.headset_mic_rounded, 'gadgets' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.pinkAccent, Icons.hotel, 'hotels' ),
              _crearBotonRedondeado( Colors.orange, Icons.assignment_return, 'selling' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.blueAccent, Icons.movie_filter, 'movies' ),
              _crearBotonRedondeado( Colors.green, Icons.music_note_outlined, 'Music' ),
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

class food extends StatelessWidget {
  static final String path = "lib/src/pages/food.dart";

  final List<Map> restaurants = [
    {
      "image" : AssetImage('assets/burger.jfif'),
      "name":"Burger King",
      "specials":"Vegetarian, Continental"
    },
    {
      "image" : AssetImage('assets/burger.jfif'),
      "name":"Cherry Blossom",
      "specials":"Salads, Dessert"
    },
    {
      "image" : AssetImage('assets/descarga.jfif'),
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : AssetImage('assets/descarga.jfif'),
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          _buildListSectionHeader(context,"Popular restaurants in Kathmandu"),
          _buildPopularRestaurant(),
          _buildListSectionHeader(context,"Food recommendations for you"),
          _buildRecommendedList()
        ],
      ),
    );
  }



  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      textTheme: TextTheme(
          title: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black))
      ),
      iconTheme: IconThemeData(color: Colors.lightGreen),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: 130,
      floating: true,
      flexibleSpace: Container(
        height: 160,
        padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text("Deliver to")),
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){},)
                ],
              ),
              SizedBox(height: 5.0,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    hintText: "Search for restaurant or dishes",
                    suffixIcon: Icon(Icons.search)
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildListSectionHeader(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20.0,top: 20.0),
        child: Text(title,style: Theme.of(context).textTheme.subtitle,),
      ),
    );
  }

  SliverGrid _buildPopularRestaurant() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 130.0,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/burger.jfif'),
                    fit: BoxFit.cover,
                  )
              ),
              SizedBox(height: 10.0,),
              Text(restaurants[index]["name"], style: Theme.of(context).textTheme.title.merge(TextStyle(
                  fontSize: 14.0
              ))),
              SizedBox(height: 5.0,),
              Text(restaurants[index]["specials"], style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                  fontSize: 12.0
              )))
            ],
          ),
        );
      },
          childCount: restaurants.length
      ),
    );
  }

  SliverList _buildRecommendedList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 150.0,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/cake.jfif'),
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 10.0,),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nepali breakfast", style: Theme.of(context).textTheme.title.merge(TextStyle(
                            fontSize: 14.0
                        ))),
                        SizedBox(height: 5.0,),
                        Text("Vegetarian, Nepali", style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                            fontSize: 12.0
                        ))),
                        SizedBox(height: 5.0,),

                      ],
                    ),
                  ),
                  Text("Rs. 180", style: Theme.of(context).textTheme.title.merge(TextStyle(
                      fontSize: 16.0,
                      color: Colors.red
                  ))),
                  IconButton(icon: Icon(Icons.favorite_border), onPressed: (){},),
                  IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){},)
                ],
              ),

            ],
          ),
        );
      },
      ),
    );
  }
}

class travel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hello Take It Easy,",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(
                        "Where do you want to go?",
                        style: TextStyle(color: Colors.grey.shade700),
                      )
                    ],
                  ),
                  CircleAvatar(
                      child: Image(
                        image: AssetImage('assets/descarga.jfif'),
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Material(
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Find destination",
                      prefixIcon: Icon(Icons.location_on),
                      border: InputBorder.none),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
              child: Image(
                  image: AssetImage('assets/japan.jpg')
              )),
            GestureDetector(
                onTap: (){},
                child: Image(
                    image: AssetImage('assets/iceland.jfif')
                )),
            GestureDetector(
                onTap: (){},
                child: Image(
                    image: AssetImage('assets/barcelona.png')
                )),

          ],
        ),
      ),

    );
  }
}

