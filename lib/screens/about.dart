import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travegy/responsive/home/responsiveHomeHeader.dart';
import 'package:url_launcher/url_launcher.dart';




class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset('assets/TAlogo.png'),
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
                      'Travegy',
                      style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '''Travegy is an online Travel Home\n introducing all travel service with best price guarantee and easiest way to find best deals and offers all over the world\nTravegy stablished in 2015 with foucsing on find best deals and offers for packages and all traveler services with the easiest way to make your journey perfect and not forgetable\nnow we stablish our Platform to deliver our vision for you and all your needs\ntravegy introducing Flight Tickets, Train Tickets, Activites, Hij, Omarah and Activities and more\nall our offers are global for all Nationalities and Regions
                      Live to Travel ... Travel to Live
                      When ever you Want ... Where ever your Are
                      ''',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
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
                      'Follow us',
                      style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        social(FontAwesomeIcons.facebook, 'https://www.facebook.com/travelopia', data),
                        social(FontAwesomeIcons.instagram, 'https://www.instagram.com/travelopia.travel/', data),
                        social(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/company/travelopiaeg/?viewAsMember=true', data),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  social(IconData icon, String urls, MediaQueryData data){
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          shape: BoxShape.circle
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.grey,
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
}