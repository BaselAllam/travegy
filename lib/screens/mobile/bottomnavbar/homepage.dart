import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/result.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> popularImage = [
  'assets/maldive.jpg', 'assets/roma.jpg', 'assets/russia.jpg', 'assets/venice.jpg', 'assets/hindi.jpg'
];

List<String> popularTitle = [
  'Maldives', 'Roma', 'Russia', 'Venice', 'Hindi'
];


List<String> visitedImage = [
   'assets/russia.jpg', 'assets/roma.jpg', 'assets/maldive.jpg',
];

List<String> visitedTitle = [
   'Russia', 'Roma', 'Maldives',
];

final TextEditingController searchController = TextEditingController();

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: ListTile(
                    title: Text(
                      'Find today Offers!',
                      style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'more than 200 Deals Available',
                      style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                  ),
              ),
              ListTile(
                  title: Text(
                    'Popular Destinations',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return Result('Destination');}));
                  },
                ),
              Container(
                height: MediaQuery.of(context).size.height/2.7,
                child: scrolItem(popularTitle, popularImage),
              ),
              ListTile(
                  title: Text(
                    'Most Visited',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return Result('Visited');}));
                  },
                ),
              Container(
                height: MediaQuery.of(context).size.height/2.7,
                child: scrolItem(visitedTitle, visitedImage),
              ),
            ],
          ),
      ),
    );
  }
  scrolItem(List title, List image) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
      itemBuilder: (context, index){
        return Container(
          width: MediaQuery.of(context).size.width/2.2,
          margin: EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(image[index]),
              fit: BoxFit.fill
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title[index],
            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.normal)
          ),
        );
      },
    );
  }
}