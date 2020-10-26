import 'package:flutter/material.dart';
import 'package:travegy/responsive/home/responsivePopularItem.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

List<String> contactTitle = [
  'Techincal issue?', 'Cancelation?', 'Complaint?', 'General?'
];

List<String> contactSubtitle = [
  'Facing issues while using app or website?', 'Cancelled by mistake, or canot cancell?', 'Faced problem with Doctors or Lab or Pharmacy or Delivery?', 'other inquires',
];

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: contactTitle.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Container(
                        width: data.size.width < 700 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width/2,
                        child: ListTile(
                          enabled: true,
                          title: Text(contactTitle[index], style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20.0),),
                          subtitle: Text(contactSubtitle[index], style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15.0),),
                          trailing: Icon(Icons.navigate_next, color: Colors.red, size: 20.0),
                          onTap: () {}
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
            SafeArea(
              bottom: true,
              child: Column(
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
            ),
            Text(
              'We are usualy here for help\n Kindly to hestiate to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: responseHomePopularFont(data)),
            ),
          ],
        ),
      ),
    );
  }
}