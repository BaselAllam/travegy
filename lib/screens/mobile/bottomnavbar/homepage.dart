import 'package:flutter/material.dart';
import 'package:travegy/responsive/home/responsivePopularItem.dart';
import 'package:travegy/screens/mobile/result.dart';
import 'package:url_launcher/url_launcher.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> popularImage = [
  'assets/maldive.jpg', 'assets/roma.jpg', 'assets/russia.jpg', 'assets/venice.jpg', 'assets/hindi.jpg'
];

List<String> popularTitle = [
  'Maldives', 'Roma', 'Russia', 'Venice', 'Hindi'
];


List<String> visitedImage = [
   'assets/russia.jpg', 'assets/roma.jpg', 'assets/maldive.jpg',
];

List<String> visitedTitle = [
   'Russia', 'Roma', 'Maldives',
];

final TextEditingController searchController = TextEditingController();

bool pressed = false;


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

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: ListTile(
                    title: Text(
                      'Find today Offers!',
                      style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'more than 200 Deals Available',
                      style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                  ),
              ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'City of\n The Day',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.indigo, fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, decorationColor: Colors.white, height: 2.0),
                        ),
                        Container(
                        height: MediaQuery.of(context).size.height/3,
                        width: MediaQuery.of(context).size.width/2,
                        margin: EdgeInsets.all(10.0),
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
                  ],
                ),
              ListTile(
                  title: Text(
                    'Popular Destinations',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return Result('Destination');}));
                  },
                ),
              Container(
                height: MediaQuery.of(context).size.height/2.7,
                child: scrolItem(popularTitle, popularImage),
              ),
              ListTile(
                  title: Text(
                    'Hot Offers',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                child: deals(data),
              ),
              ListTile(
                  title: Text(
                    'Most Visited',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return Result('Visited');}));
                  },
                ),
              Container(
                height: MediaQuery.of(context).size.height/2.7,
                child: scrolItem(visitedTitle, visitedImage),
              ),
            ],
          ),
      ),
    );
  }
  scrolItem(List title, List image) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width/2.2,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(image[index]),
                fit: BoxFit.fill
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title[index],
              style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.normal)
            ),
          ),
        );
      },
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