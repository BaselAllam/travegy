import 'package:flutter/material.dart';
import 'package:travegy/responsive/home/responsivePopularItem.dart';





class CityOfTheDay extends StatefulWidget {
  @override
  _CityOfTheDayState createState() => _CityOfTheDayState();
}

class _CityOfTheDayState extends State<CityOfTheDay> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: data.size.width < 700 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/venice.jpg'),
                      fit: BoxFit.fill
                    ),
                  ),
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      shape: BoxShape.circle
                    ),
                      child: IconButton(
                      icon: Icon(Icons.play_arrow),
                      color: Colors.black,
                      iconSize: 25.0,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: data.size.width < 700 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      'Venice',
                      style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'City in italy Europe\n ranked as one of the most popular city for Traveller around the World\n venice has a greate places to visit and more\n average Flight Ticket 300\$ round trip',
                      style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: FlatButton(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Colors.indigo,
                      child: Text(
                        'Check Offer',
                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                height: MediaQuery.of(context).size.height/2,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SafeArea(
                        top: true,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                              'See more in Europe',
                              style: TextStyle(color: Colors.indigo, fontSize: responseHomePopularFont(data), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                            ),
                        ),
                    ),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height/2 - 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            imageContainer(0, 'assets/venice.jpg', 'Venice', data),
                            imageContainer(1, 'assets/russia.jpg', 'Russia', data),
                            imageContainer(2, 'assets/maldive.jpg', 'Maldive', data),
                            imageContainer(3, 'assets/roma.jpg', 'Roma', data),
                            imageContainer(4, 'assets/venice.jpg', 'Venice', data),
                            imageContainer(5, 'assets/russia.jpg', 'Russia', data),
                            imageContainer(6, 'assets/maldive.jpg', 'Maldive', data),
                            imageContainer(7, 'assets/roma.jpg', 'Roma', data),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  imageContainer(int index, String image, String name, MediaQueryData data){
    return Container(
      width: responseiveHomePopularItemContainerWidth(data),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
    );
  }
}