import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child: ListTile(
                title: Text(
                  'Bassel Allam',
                  style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Top Traveller\n long press to edit your profile',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                trailing: Container(
                  height: MediaQuery.of(context).size.height/3.5,
                  width: MediaQuery.of(context).size.width/4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/TAlogo.png'),
                      fit: BoxFit.fill
                    ),
                    shape: BoxShape.circle
                  ),
                ),
                onLongPress: () {}
              ),
            ),
            item('Wishlist', Icons.favorite, () {}),
            item('Setting', Icons.settings, () {}),
            item('Contact Us', Icons.phone, () {}),
            item('About Us', Icons.info, () {}),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  social(FontAwesomeIcons.facebook, 'https://www.facebook.com/travelopia'),
                  social(FontAwesomeIcons.instagram, 'https://www.instagram.com/travelopia.travel/'),
                  social(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/company/travelopiaeg/?viewAsMember=true'),
                ],
              ),
            ),
          Column(
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black,
                  child: Text('Sign Out', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  onPressed: () {}
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  item(String title, IconData icon, Function navigation) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        trailing: Icon(icon, size: 20.0, color: Colors.grey),
        onTap: navigation,
      ),
    );
  }
  social(IconData icon, String urls){
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          shape: BoxShape.circle
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.grey,
          iconSize: 20.0,
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
