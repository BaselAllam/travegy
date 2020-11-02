import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/result.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

final TextEditingController travelFromController = TextEditingController();
final TextEditingController travelToController = TextEditingController();
final TextEditingController subScribeController = TextEditingController();

final GlobalKey<FormFieldState<String>> travelFromKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> travelToKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

DateTime depatureDate = DateTime.now();
DateTime returnDate = DateTime.now();

List<bool> pressed = [true, false, false];

bool oneWay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
        title: Text(
          'Search',
          style: TextStyle(color: Colors.indigo, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
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
              field('Depature City', TextInputType.text, travelFromController, travelFromKey, Icons.flight_takeoff),
              field('Arrival City', TextInputType.text, travelToController, travelToKey, Icons.flight_land),
              dateSelector('Depature Date', Icons.date_range),
              dateSelector('Return Date', Icons.date_range),
              Column(
                children: [
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.indigo,
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return Result('Result');}));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
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
  dateSelector(String title, IconData icon) {
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
          style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
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
}