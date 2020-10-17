import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travegy/screens/searchresult.dart';
import 'package:url_launcher/url_launcher.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final TextEditingController travelFromController = TextEditingController();
final TextEditingController travelToController = TextEditingController();

final GlobalKey<FormFieldState<String>> travelFromKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> travelToKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

DateTime depatureDate = DateTime.now();
DateTime returnDate = DateTime.now();

bool oneWay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/TAlogo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/6),
                      barItem('Home', () {}),
                      barItem('About', () {}),
                      barItem('Contact', () {}),
                      social(FontAwesomeIcons.facebook, 'https://www.facebook.com/travelopia'),
                      social(FontAwesomeIcons.instagram, 'https://www.facebook.com/travelopia'),
                      social(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/company/travelopiaeg/?viewAsMember=true'),
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'When Ever you Want\n       Where Ever you Are',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 55.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width/2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                          child: Row(
                            children: [
                              Text(
                                'One Way?',
                                style: TextStyle(color: Colors.black54, fontSize: 25.0, fontWeight: FontWeight.bold),
                              ),
                              Checkbox(
                                activeColor: Colors.transparent,
                                checkColor: Colors.indigo,
                                hoverColor: Colors.indigo,
                                focusColor: Colors.black54,
                                value: oneWay,
                                onChanged: (value){
                                  setState(() {
                                    oneWay = value;
                                  });
                                }
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          margin: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0),
                          child: Row(
                            children: [
                              field('Depature City', TextInputType.text, travelFromController, travelFromKey, Icons.flight_takeoff),
                              field('Arrival City', TextInputType.text, travelToController, travelToKey, Icons.flight_land),
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          margin: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0),
                          child: Row(
                            children: [
                              dateSelector('Depature Date', Icons.date_range),
                              dateSelector('Return Date', Icons.date_range),
                            ],
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.indigo,
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult();}));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Popular Destinations',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 55.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, decorationColor: Colors.indigo),
                  ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 20.0),
                height: MediaQuery.of(context).size.height/2.3,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    imageContainer(0, 'assets/venice.jpg', 'Venice'),
                    imageContainer(1, 'assets/russia.jpg', 'Russia'),
                    imageContainer(2, 'assets/maldive.jpg', 'Maldive'),
                    imageContainer(3, 'assets/roma.jpg', 'Roma'),
                    imageContainer(4, 'assets/venice.jpg', 'Venice'),
                    imageContainer(5, 'assets/russia.jpg', 'Russia'),
                    imageContainer(6, 'assets/maldive.jpg', 'Maldive'),
                    imageContainer(7, 'assets/roma.jpg', 'Roma'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  barItem(String name, Function nav) {
    return InkWell(
        onTap: nav,
        child: Container(
          padding: EdgeInsets.all(3.0),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)
          ),
        ),
    );
  }
  social(IconData icon, String urls){
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          shape: BoxShape.circle
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: () async {
          String url = urls;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
          },
        ),
    );
  }
  imageContainer(int index, String image, String name){
    return Container(
      width: index == 0 ? MediaQuery.of(context).size.width/3.5 : MediaQuery.of(context).size.width/4.5,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100.0,
        width: index == 0 ? MediaQuery.of(context).size.width/3.5 : MediaQuery.of(context).size.width/4.5,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: ListTile(
            title: Text(
              name,
              style: TextStyle(color: Colors.black54, fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
              'Start from 250\$',
              style: TextStyle(color: Colors.indigo, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.black, size: 35.0)
            ),
          ),
      ),
    );
  }
  dateSelector(String title, IconData icon) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width/4.5,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          title == 'Depature Date' ? '${depatureDate.toString().substring(0, 10)}' : '${returnDate.toString().substring(0, 10)}',
          style: TextStyle(color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(icon, color: Colors.black54, size: 25.0),
        onTap: () async {
          if(oneWay == true){
            if(title == 'Return Date'){
              return null;
            }else{
              var date = await showDatePicker(
                context: null,
                initialDate: null,
                firstDate: null,
                lastDate: null
              );
              setState(() {
                if(title == 'Depature Date'){
                  depatureDate = date;
                }else{
                  returnDate = date;
                }
              });
            }
          }else{
            var date = await showDatePicker(
              context: null,
              initialDate: null,
              firstDate: null,
              lastDate: null
            );
            setState(() {
              if(title == 'Depature Date'){
                depatureDate = date;
              }else{
                returnDate = date;
              }
            });
          }
        },
      ),
    );
  }
  field(String label, TextInputType inputType, TextEditingController controller, Key key, IconData icon) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width/4.5,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field requred!';
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.normal),
          prefixIcon: Icon(icon, color: Colors.black54, size: 25.0),
        ),
        enabled: label == 'Arrival City' ? !oneWay : true,
        keyboardType: inputType,
        textInputAction: TextInputAction.done,
        controller: controller,
      ),
    );
  }
}