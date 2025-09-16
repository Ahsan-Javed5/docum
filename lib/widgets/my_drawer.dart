import 'package:flutter/material.dart';
import '/Utilities/constants.dart';
import '/screens/about_screen.dart';
import '/screens/getting_started_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      color: appLightBlueColor.withOpacity(
        0.9,
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            'Docum',
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          getDrawerItem(
            label: 'Home',
            onTap: () {
              debugPrint("<----Home Button On Tap Pressed---->");
              Navigator.pop(context);
            },
            icon: Icons.home_filled,
          ),
          getDrawerItem(
            label: 'About',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AboutScreen.route);
            },
            icon: Icons.info,
          ),
          getDrawerItem(
            label: 'Demo',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GettingStartedScreen(
                    showSkip: false,
                  ),
                ),
              );
            },
            icon: Icons.description,
          ),
          Spacer(
            flex: 9,
          ),
          Text(
            'version 1.0.0',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Spacer(),
        ],
      ),
    );
  }

  getDrawerItem({required label, required dynamic onTap, required icon}) {
    return Column(
      children: [
        ListTile(
          leading: Padding(
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Icon(
              icon,
              color: appWhiteColor,
            ),
          ),
          title: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: appWhiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          visualDensity: VisualDensity(horizontal: -4),
          onTap: () => onTap(),
        ),
        Container(
          height: 1,
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          color: appWhiteColor.withOpacity(
            0.5,
          ),
        )
      ],
    );
  }
}
