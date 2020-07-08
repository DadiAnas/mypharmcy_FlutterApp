import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_login_signup/src/Widget/autocomplete_textfield.dart';
import 'package:flutter_login_signup/src/Widget/mapCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widget/bezierBotContainer.dart';


class PharmacyPage extends StatefulWidget {
  PharmacyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.arrow_back_ios, color: Color(0xffe46b10)),
            ),
          ],
        ),
      ),
    );
  }



  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }



  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'My',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Ph',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'armacy',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  List<String> getSuggetions(){
    List<String> suggetions=[
      "Rabat",
      "Casablanca",
      "Mohammedia",
      "Azrou",
      "Ifrane",
      "Meknes",
      "Azilal",
      "Fes",
      "Errachidia"];
    return suggetions;
  }

  Widget _main(){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
         /* RichText(
            text: TextSpan(
              text: "Enter a city name:",
              style: GoogleFonts.portLligatSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),*/
          SimpleAutoCompleteTextField(
            suggestions: getSuggetions(),
            decoration: InputDecoration(
                filled: false,
                fillColor: Colors.black12,
                hintText: 'city',
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: height/20,),
          MapCard(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .29,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierBotContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height*.06 ),
                      _title(),
                      _divider(),
                      SizedBox(height: height * .06),
                      _main(),

                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(bottom: 30, right: 30, child: Icon(Icons.info,color:Color(0xffe46b10),size: width* .09,),),
            ],
          ),
        ));
  }
}
