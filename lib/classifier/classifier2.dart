import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ricelife/api/Firebaseapi.dart';
import 'package:tflite/tflite.dart';

class Classify1 extends StatefulWidget {
  XFile image;
  Classify1({required this.image});

  @override
  State<Classify1> createState() => _Classify1State();
}

class _Classify1State extends State<Classify1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  var url;

  Future upload(var image) async {
    File s = File(image.path);
    final filename = Timestamp.now();
    final destination = '19MIC0113/$filename';
    var task = FirebaseApi.uploadFile(destination, s);
    if (task == null) {
      return;
    } else {
      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      setState(() {
        this.url = urlDownload;
      });
    }
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
    );
    print("predict = " + output.toString());
    print(output![0]['label']);
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/My_TFlite_Model1.tflite", labels: "assets/label1.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.white,
            Colors.white,
            Colors.greenAccent
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'CHECK FOR ANY DISEASE..',
                    style: GoogleFonts.oleoScript(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'To Ensure Rice Plants are Grown well.',
                    style: GoogleFonts.rakkas(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 250,
              width: 300,
              child: Image.file(
                File(widget.image.path),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: MaterialButton(
                    height: 150,
                    minWidth: 150,
                    clipBehavior: Clip.hardEdge,
                    onPressed: () {
                      classifyImage(File(widget.image.path));
                    },
                    color: Colors.greenAccent,
                    splashColor: Colors.greenAccent,
                    child: Column(
                      children: [
                        Icon(Icons.check_box),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'CHECK FOR',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: MaterialButton(
                    height: 150,
                    minWidth: 150,
                    clipBehavior: Clip.hardEdge,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.redAccent,
                    splashColor: Colors.redAccent,
                    child: Column(
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'GO BACK',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
