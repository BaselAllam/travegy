import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/filter.dart';
import 'package:travegy/widgets/mobile/item.dart';



class Result extends StatefulWidget {

final String className;

Result(this.className);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

List hotelName = [
  'Movenpick Naama Bay', 'Hilton Sharks Bay', 'Le Merdien', 'kempiniski'
];

List image = [
  'assets/russia.jpg', 'assets/maldive.jpg', 'assets/venice.jpg', 'assets/roma.jpg'
];


List<String> visitedImage = [
   'assets/russia.jpg', 'assets/roma.jpg', 'assets/maldive.jpg', 'assets/russia.jpg', 'assets/roma.jpg', 'assets/maldive.jpg',
];

List<String> visitedTitle = [
   'Russia', 'Roma', 'Maldives', 'Russia', 'Roma', 'Maldives',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.indigo, size: 25.0),
        title: Text(
          widget.className == 'Result' ?
          'Result' : 'Destinations',
          style: TextStyle(color: Colors.indigo, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 40.0),
          child: ListTile(
            leading: Text(
              '${hotelName.length.toString()} items',
              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            title: Text(
                'Cairo - London\n 12 Aug 2020 - 24 Aug 2020 - 1 Adult',
                style: TextStyle(color: Colors.indigo, fontSize: 13.0, fontWeight: FontWeight.normal),
              ),
            trailing: IconButton(
              icon: Icon(Icons.tune),
              color: Colors.indigo,
              iconSize: 20.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return Filter();}));
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
        child: widget.className == 'Result' ? result() : destination()
      ),
    );
  }
  result() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: hotelName.length,
      itemBuilder: (context, index){
        return Item(hotelName[index], 'assets/roma.jpg');
      },
    );
  }
  destination() {
    return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0
          ),
        scrollDirection: Axis.vertical,
        itemCount: visitedTitle.length,
        itemBuilder: (context, index){
          return Container(
          margin: EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(visitedImage[index]),
              fit: BoxFit.fill
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            visitedTitle[index],
            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.normal)
          ),
        );
        },
      );
  }
}