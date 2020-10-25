import 'package:flutter/material.dart';




class WebFilter extends StatefulWidget {
  @override
  _WebFilterState createState() => _WebFilterState();
}

class _WebFilterState extends State<WebFilter> {

bool direct = false;

bool oneStop = false;

bool towStop = false;

List<bool> airline = [false, false, false, false, false, false,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.indigo, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
      ),
      body: filter(),
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
          Column(
            children: [
              FlatButton(
                padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                color: Colors.indigo,
                child: Text(
                  'Apply Filter',
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
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