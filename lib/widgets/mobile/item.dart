import 'package:flutter/material.dart';


class Item extends StatefulWidget {

final String hotelName;
final String image;

Item(this.hotelName, this.image);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
          child: Container(
        height: MediaQuery.of(context).size.height /2.5,
        margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      height: 75.0,
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Container(
                          width: 45.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/emirates.png'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'London\n 10:00 AM',
                              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 Hour',
                                  style: TextStyle(color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.normal),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 2.0
                                ),
                                Text(
                                  'Direct',
                                  style: TextStyle(color: Colors.red, fontSize: 13.0, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Text(
                              'CAI\n 12:00 PM',
                              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 75.0,
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Container(
                          width: 45.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/egyptairlogo.png'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'CAI\n10:00 AM',
                              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 Hour',
                                  style: TextStyle(color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.normal),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                  endIndent: 20.0,
                                  indent: 20.0,
                                ),
                                Text(
                                  'Direct',
                                  style: TextStyle(color: Colors.red, fontSize: 13.0, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Text(
                              'London\n 12:00 PM',
                              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, thickness: 1.0, endIndent: 20.0, indent: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Non Refundable',
                          style: TextStyle(color: Colors.red, fontSize: 13.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '20KG Max',
                          style: TextStyle(color: Colors.red, fontSize: 13.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Price : 200\$',
                            style: TextStyle(color: Colors.indigo, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          FlatButton(
                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            color: Colors.indigo,
                            child: Text(
                              'Book Now',
                              style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}