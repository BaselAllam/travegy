import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travegy/responsive/home/responsiveHomeEnder.dart';
import 'package:travegy/responsive/home/responsiveHomeHeader.dart';
import 'package:travegy/responsive/home/responsiveHomeSearch.dart';
import 'package:travegy/responsive/home/responsivePopularItem.dart';
import 'package:travegy/screens/about.dart';
import 'package:travegy/screens/contact.dart';
import 'package:travegy/screens/web/searchresult.dart';
import 'package:url_launcher/url_launcher.dart';



class WebHomePage extends StatefulWidget {
  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {

final TextEditingController travelFromController = TextEditingController();
final TextEditingController travelToController = TextEditingController();
final TextEditingController subScribeController = TextEditingController();

final GlobalKey<FormFieldState<String>> travelFromKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> travelToKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

DateTime depatureDate = DateTime.now();
DateTime returnDate = DateTime.now();

bool oneWay = false;

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


List<bool> pressed = [true, false, false];

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
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
                      SizedBox(width: data.size.width <= 760 ? 20.0 : MediaQuery.of(context).size.width/6),
                      barItem('Home', () {}, data),
                      barItem('About', () {
                        Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return About();}));
                      }, data),
                      barItem('Contact', () {
                        Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return ContactUs();}));
                      }, data),
                      social(FontAwesomeIcons.facebook, 'https://www.facebook.com/travelopia', data),
                      social(FontAwesomeIcons.instagram, 'https://www.instagram.com/travelopia.travel/', data),
                      social(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/company/travelopiaeg/?viewAsMember=true', data),
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
                    height: responseiveHomeSearchContainerHeight(data),
                    width: responseiveHomeSearchContainerWidth(data),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(pressed[0] == false){
                                    setState(() {
                                      pressed[0] = true;
                                      pressed[1] = false;
                                      pressed[2] = false;
                                    });
                                  }else{
                                    setState(() {
                                      pressed[0] = true;
                                      pressed[1] = false;
                                      pressed[2] = false;
                                    });
                                  }
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: pressed[0] == true ? Colors.indigo : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Flight',
                                      style: TextStyle(color: pressed[0] == true ? Colors.white : Colors.grey, fontSize: 25.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if(pressed[1] == false){
                                    setState(() {
                                      pressed[0] = false;
                                      pressed[1] = true;
                                      pressed[2] = false;
                                    });
                                  }else{
                                    setState(() {
                                      pressed[0] = false;
                                      pressed[1] = true;
                                      pressed[2] = false;
                                    });
                                  }
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: pressed[1] == true ? Colors.indigo : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Train',
                                      style: TextStyle(color: pressed[1] == true ? Colors.white : Colors.grey, fontSize: 25.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if(pressed[2] == false){
                                    setState(() {
                                      pressed[0] = false;
                                      pressed[1] = false;
                                      pressed[2] = true;
                                    });
                                  }else{
                                    setState(() {
                                      pressed[0] = false;
                                      pressed[1] = true;
                                      pressed[2] = false;
                                    });
                                  }
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: pressed[2] == true ? Colors.indigo : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Cars',
                                      style: TextStyle(color: pressed[2] == true ? Colors.white : Colors.grey, fontSize: 25.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          margin: EdgeInsets.only(bottom: 10.0, top: 5.0, left: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              dateSelector('Depature Date', Icons.date_range, data),
                              dateSelector('Return Date', Icons.date_range, data),
                            ],
                          ),
                        ),
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
                              'Popular\n  Destinations',
                              style: TextStyle(color: Colors.white, fontSize: responseHomePopularFont(data), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
                              'Hot Global\n  Offers',
                              style: TextStyle(color: Colors.white, fontSize: responseHomePopularFont(data), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                            ),
                        ),
                    ),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height/2 - 50,
                        child: deals(data),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 20.0),
                height: MediaQuery.of(context).size.height/2.5,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'City\nof\nthe Day',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: responseHomeCityOfTheDayFont(data), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, decorationColor: Colors.indigo),
                        ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('assets/venice.jpg'),
                            fit: BoxFit.fill
                          ),
                        ),
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
              ),
              Container(
                height: responseiveHomeEnderItemHeight(data),
                color: Colors.white38,
                alignment: Alignment.center,
                child: ender(data),
              ),
            ],
          ),
        ),
      ),
    );
  }
  barItem(String name, Function nav, MediaQueryData data){
    return InkWell(
        onTap: nav,
        child: Container(
          padding: EdgeInsets.all(3.0),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: responseiveHomeHeaderItemFont(data), fontWeight: FontWeight.bold)
          ),
        ),
    );
  }
  social(IconData icon, String urls, MediaQueryData data){
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          shape: BoxShape.circle
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: responseiveHomeHeaderSocial(data),
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
  imageContainer(int index, String image, String name, MediaQueryData data){
    return InkWell(
      onTap: () {},
          child: Container(
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
      ),
    );
  }
  dateSelector(String title, IconData icon, MediaQueryData data) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width/4.5,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black54, fontSize: responseHomeSearchFont(data), fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          title == 'Depature Date' ? '${depatureDate == null ? DateTime.now().toString().substring(0, 10) : depatureDate.toString().substring(0, 10)}' : '${returnDate == null ? DateTime.now().toString().substring(0, 10) : returnDate.toString().substring(0, 10)}',
          style: TextStyle(color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(icon, color: Colors.black54, size: 25.0),
        onTap: () async {
          if(oneWay == true){
            if(title == 'Return Date'){
              return null;
            }else{
              var date = await showDatePicker(
                context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2022),
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
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2022),
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
      height: 70.0,
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
  ender(MediaQueryData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: responseiveHomeEnderItemWidth(data),
          height: responseiveHomeEnderItemHeight(data),
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              enderTitle('Follow Us', () {}),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: social(FontAwesomeIcons.facebook, 'https://www.facebook.com/travelopia', data),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: social(FontAwesomeIcons.instagram, 'https://www.instagram.com/travelopia.travel/', data),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: social(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/company/travelopiaeg/?viewAsMember=true', data),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/TAlogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: responseiveHomeEnderItemWidth(data),
          height: responseiveHomeEnderItemHeight(data),
          margin: EdgeInsets.all(10.0),
          child: Builder(
            builder: (BuildContext context){
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enderTitle('DownLoad Our Apps', () {}),
                enderSubTitle('Android Users', () {
                  Scaffold.of(context).showSnackBar(snack('Our apps coming soon stay tuned'));
                }),
                enderSubTitle('IOS Users', () {
                  Scaffold.of(context).showSnackBar(snack('Our apps coming soon stay tuned'));
                }),
                enderTitle('Resources', () {}),
                enderSubTitle('About', () {
                  Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return About();}));
                }),
                enderSubTitle('Contact Us', () {
                  Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return ContactUs();}));
                }),
                enderSubTitle('Copyright © 2020 Bassel Allam', () async {
                  String url = 'https://www.linkedin.com/in/bassel-allam-012b65b3/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            );
            },
          ),
        ),
        Container(
          width: responseiveHomeEnderItemWidth(data),
          height: responseiveHomeEnderItemHeight(data),
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    labelText: '@ your email',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  controller: subScribeController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.indigo,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'subscribe',
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  enderTitle(String title, Function button) {
    return InkWell(
      onTap: button,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 2.0),
      ),
    );
  }
  enderSubTitle(String title, Function button) {
    return InkWell(
      onTap: button,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, height: 2.0),
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      backgroundColor: Colors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      duration: Duration(seconds: 5),
      content: Text(
        content,
        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)
      ),
    );
  }
  deals(MediaQueryData data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dealsLinks.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: () async {
            String url = dealsLinks[index];
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            width: responseiveHomePopularItemContainerWidth(data),
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
        );
      }
    );
  }
}