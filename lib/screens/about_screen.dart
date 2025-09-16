import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utilities/constants.dart';

void launchWebsite(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    print("Couldn't launch the url");
  }
}

class AboutScreen extends StatelessWidget {
  static String route = "AboutScreen";
  final String ahsanLink = "https://www.linkedin.com/in/ahsanjaved5/";
  final String aarzooLink = "https://www.linkedin.com/in/ahsanjaved5/";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appWhiteColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: RichText(
            text: TextSpan(
              text: 'About',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: primaryColor,
              child: ClipOval(
                child: Image.asset(
                  'assets/icon/app_icon.png',
                  fit: BoxFit.contain,
                  width: 150, // same as diameter
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Docum',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                  children: [
                    // TextSpan(
                    //     text: 'Scan', style: TextStyle(color: secondaryColor)),
                    TextSpan(
                      text:
                          ' is an open-source app which enables users to scan hard copies of documents and convert it into a PDF file.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: appBlackColor),
                    ),
                  ],
                ),
              ),
            ),
            // Center(
            //   child: Text(
            //     "Team",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     ContactCard(
            //       name: "Ahsan Javed",
            //       link: ahsanLink,
            //       image: AssetImage('assets/ahsan_profile_pic.jpg'),
            //     ),
            //     ContactCard(
            //       name: "Aarzoo Ahsan",
            //       link: aarzooLink,
            //       image: AssetImage('assets/ahsan_profile_pic.jpg'),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: size.height * 0.25,
            ),
            Center(
              child: Text(
                "We don't collect any data.\n We respect your privacy.",
                style: TextStyle(fontSize: 18, color: primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Version ',
                style: TextStyle(fontSize: 14, color: primaryColor),
                children: [
                  TextSpan(
                      text: '1.0.0', style: TextStyle(color: secondaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String link;
  final String name;
  final AssetImage image;

  const ContactCard(
      {required this.link, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => launchWebsite(link),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.all(8.0),
          height: size.width * 0.4,
          width: size.width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: secondaryColor,
                radius: size.width * 0.13,
                backgroundImage: image,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
