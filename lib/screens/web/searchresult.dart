import 'package:flutter/material.dart';
import 'package:travegy/responsive/home/result/responsiveResult.dart';
import 'package:travegy/responsive/home/result/responsiveResultDeals.dart';
import 'package:travegy/responsive/home/result/responsiveResultFilter.dart';
import 'package:travegy/screens/web/webFilter.dart';
import 'package:url_launcher/url_launcher.dart';



class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

List title = [
  'Egypt Air', 'Emirates Airway', 'Turkish Airline', 'Etihade Airways', 'Egypt Air', 'Emirates Airway', 'Turkish Airline', 'Etihade Airways',
];


List dealsTitle = [
  'Egypt Air', 'Emirates Airway', 'Turkish Airline', 'Etihade Airways', 'Egypt Air', 'Emirates Airway', 'Turkish Airline', 'Etihade Airways',
];


List dealsLinks = [
  'https://c140.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=4380&source_type=banner&type=click',
  'https://c121.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=4605&source_type=banner&type=click',
  'https://c117.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=4339&source_type=banner&type=click',
  'https://c62.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=1973&source_type=banner&type=click',
  'https://c142.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=4270&source_type=banner&type=click',
  'https://c10.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=540&source_type=banner&type=click',
  'https://c122.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=3697&source_type=banner&type=click',
  'https://c98.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=2438&source_type=banner&type=click',
  'https://c44.travelpayouts.com/click?shmarker=300934&trs=2801&promo_id=2704&source_type=banner&type=click',
];


List dealsImage = [
  'https://c140.travelpayouts.com/content?promo_id=4380&trs=2801&shmarker=300934&type=init',
  'https://c121.travelpayouts.com/content?promo_id=4605&trs=2801&shmarker=300934&type=init',
  'https://c117.travelpayouts.com/content?promo_id=4339&trs=2801&shmarker=300934&type=init',
  'https://c62.travelpayouts.com/content?promo_id=1973&trs=2801&shmarker=300934&type=init',
  'https://c142.travelpayouts.com/content?promo_id=4270&trs=2801&shmarker=300934&type=init',
  'https://c10.travelpayouts.com/content?promo_id=540&trs=2801&shmarker=300934&type=init',
  'https://c122.travelpayouts.com/content?promo_id=3697&trs=2801&shmarker=300934&type=init',
  'https://c98.travelpayouts.com/content?promo_id=2438&trs=2801&shmarker=300934&type=init',
  'https://c44.travelpayouts.com/content?promo_id=2704&trs=2801&shmarker=300934&type=init'
];


bool direct = false;

bool oneStop = false;

bool towStop = false;

List<bool> airline = [false, false, false, false, false, false,];

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Container(
            height: 150.0,
            width: 150.0,
            margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/TAlogo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
      ),
      body: Container(
          child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: data.size.width <= 930 ? 
          Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainResultContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          '${title.length.toString()} results',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Cairo - London\n 12 Aug 2020 - 24 Aug 2020 - 1 Adult',
                          style: TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.normal),
                        ),
                        trailing: data.size.width > 1200 ? Icon(Icons.flight, color: Colors.red, size: 30.0) : 
                        IconButton(
                          icon: Icon(Icons.tune),
                          color: Colors.red,
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return WebFilter();}));
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: result(),
                    ),
                  ],
                ),
              ) : data.size.width <= 1200 ? 
              Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainResultContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          '${title.length.toString()} results',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Cairo - London\n 12 Aug 2020 - 24 Aug 2020 - 1 Adult',
                          style: TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.normal),
                        ),
                        trailing: data.size.width > 1200 ? Icon(Icons.flight, color: Colors.red, size: 30.0) : 
                        IconButton(
                          icon: Icon(Icons.tune),
                          color: Colors.red,
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return WebFilter();}));
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: result(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainDealsContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          '${dealsLinks.length.toString()} Deals',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.local_offer, color: Colors.red, size: 30.0),
                      ),
                    ),
                    Flexible(
                      child: deals(data),
                    ),
                  ],
                ),
              ),
            ],
          ) :
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainFilterContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          'Filter',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.tune, color: Colors.red, size: 30.0),
                      ),
                    ),
                    Flexible(
                      child: filter(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainResultContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          '${title.length.toString()} results',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Cairo - London\n 12 Aug 2020 - 24 Aug 2020 - 1 Adult',
                          style: TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.normal),
                        ),
                        trailing: data.size.width > 1200 ? Icon(Icons.flight, color: Colors.red, size: 30.0) : 
                        IconButton(
                          icon: Icon(Icons.tune),
                          color: Colors.red,
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return WebFilter();}));
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: result(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                width: responsiveMainDealsContainerWidth(data),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: ListTile(
                        title: Text(
                          '${dealsLinks.length.toString()} Deals',
                          style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.local_offer, color: Colors.red, size: 30.0),
                      ),
                    ),
                    Flexible(
                      child: deals(data),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  result() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: title.length,
      itemBuilder: (context, index){
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                  children: [
                    Container(
                      height: 100.0,
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Container(
                          width: 75.0,
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
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.flight_takeoff, color: Colors.indigo, size: 30.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 Hour',
                                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 2.0
                                ),
                                Text(
                                  'Direct',
                                  style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Icon(Icons.flight_land, color: Colors.indigo, size: 30.0),
                            Text(
                              'CAI\n 12:00 PM',
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100.0,
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Container(
                          width: 75.0,
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
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.flight_land, color: Colors.indigo, size: 30.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 Hour',
                                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                  endIndent: 20.0,
                                  indent: 20.0,
                                ),
                                Text(
                                  'Direct',
                                  style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Icon(Icons.flight_takeoff, color: Colors.indigo, size: 30.0),
                            Text(
                              'London\n 12:00 PM',
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          'Price : 200\$',
                          style: TextStyle(color: Colors.indigo, fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Non Refundable',
                          style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '20KG Max',
                          style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                        FlatButton(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.indigo,
                          child: Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
  deals(MediaQueryData data) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: dealsLinks.length,
      itemBuilder: (context, index){
        return Column(
          children: [
            InkWell(
              onTap: () async {
                String url = dealsLinks[index];
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                height: responsiveDealsItem(data),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(dealsImage[index]),
                    fit: BoxFit.fill
                  ),
                ),
                ),
            ),
          ],
        );
      }
    );
  }
  filter() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          title: Text(
            'Stops',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
          ),
          trailing: Icon(Icons.arrow_downward, color: Colors.grey, size: 25.0),
        ),
        filterStopItem('Direct', (value){
            setState(() {
              direct = value;
            });
          },
          direct
        ),
        filterStopItem('1 Stops', (value){
            setState(() {
              oneStop = value;
            });
          },
          oneStop
        ),
        filterStopItem('2 Stops', (value){
            setState(() {
              towStop = value;
            });
          },
          towStop
        ),
        Divider(color: Colors.grey, endIndent: 40.0, indent: 40.0, height: 10.0, thickness: 1.0),
        ListTile(
          title: Text(
            'Airlines',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
          ),
          trailing: Icon(Icons.flight, color: Colors.grey, size: 25.0),
        ),
        filterAirlineItem('assets/emirates.png', 'Emirates Airline', 550, (value){
              setState(() {
                airline[0] = value;
              });
            },
            airline[0]
          ),
        filterAirlineItem('assets/egyptairlogo.png', 'Etihade Airways', 350, (value){
            setState(() {
              airline[1] = value;
            });
          },
          airline[1]
        ),
        filterAirlineItem('assets/etihad.png', 'Etihade Airways', 300, (value){
              setState(() {
                airline[2] = value;
              });
            },
            airline[2]
          ),
        filterAirlineItem('assets/emirates.png', 'Emirates Airways', 650, (value){
              setState(() {
                airline[3] = value;
              });
            },
            airline[3]
          ),
        filterAirlineItem('assets/egyptairlogo.png', 'EgyptAir', 550, (value){
              setState(() {
                airline[4] = value;
              });
            },
            airline[4]
          ),
        filterAirlineItem('assets/etihad.png', 'Etihad Airways', 650, (value){
              setState(() {
                airline[5] = value;
              });
            },
            airline[5]
          ),
      ],
    );
  }
  filterStopItem(String title, Function onSelect, bool value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        trailing: Checkbox(
          activeColor: Colors.indigo,
          checkColor: Colors.white,
          value: value,
          onChanged: onSelect
        ),
      ),
    );
  }
  filterAirlineItem(String image, String title, int subtitle, Function onSelect, bool value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
          leading: Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill
              ),
              shape: BoxShape.circle
            ),
          ),
        title: Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        subtitle: Text(
          '${subtitle.toString()}\$',
          style: TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        trailing: Checkbox(
          activeColor: Colors.indigo,
          checkColor: Colors.white,
          value: value,
          onChanged: onSelect
        ),
      ),
    );
  }
}