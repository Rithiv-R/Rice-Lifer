import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardStyle = GoogleFonts.rakkas(textStyle: TextStyle(fontSize: 18));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.greenAccent,
          Colors.white,
          Colors.white,
          Colors.white
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        child: Stack(
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        primary: true,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.greenAccent,
                            focusColor: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: 150,
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80',
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "PROFILE",
                                      style: cardStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.greenAccent,
                            focusColor: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: 150,
                                      child: Image.network(
                                        'https://grammartop.com/wp-content/uploads/2020/11/diseased-2d8f6d3ff0d14e48d3b618409ed5e58f30f64d72.png',
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "FIND DISEASE",
                                      style: cardStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.greenAccent,
                            focusColor: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: 150,
                                      child: Image.network(
                                        'https://play-lh.googleusercontent.com/05jlriR37vJHeKv1dRi8wMXigdIivp_t9BRsze-CDhNAV3HPv4CafUrjC4s30uDQNtBV',
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "AGRO NEAR BY",
                                      style: cardStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
