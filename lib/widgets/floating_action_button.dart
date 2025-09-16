import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Utilities/constants.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';

class FAB extends StatefulWidget {
  final Function()? normalScanOnPressed;
  final Function()? quickScanOnPressed;
  final Function()? galleryOnPressed;
  final Function? dialOpen;
  final Function? dialClose;

  const FAB({
    required this.normalScanOnPressed,
    required this.quickScanOnPressed,
    required this.galleryOnPressed,
    this.dialOpen,
    this.dialClose,
  });

  @override
  _FABState createState() => _FABState();
}

class _FABState extends State<FAB> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      childMargin: EdgeInsets.fromLTRB(0, 0, 18, 0),
      child: SimpleAnimatedIcon(
        startIcon: Icons.add,
        endIcon: Icons.close,
        size: 30,
        progress: _progress,
      ),
      spaceBetweenChildren: 8.0,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      tooltip: 'Scan Options',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: primaryColor,
      foregroundColor: appWhiteColor,
      elevation: 8.0,
      shape: CircleBorder(),
      onOpen: () {
        _animationController.forward();
      },
      onClose: () {
        _animationController.reverse();
      },
      children: [
        getSpeedDialOption(
            icon: Icons.camera_alt,
            label: 'Normal Scan',
            onTap: widget.normalScanOnPressed),
        getSpeedDialOption(
            icon: Icons.timelapse,
            label: "Quick Scan",
            onTap: widget.quickScanOnPressed),
        getSpeedDialOption(
          icon: Icons.image,
          label: "Import from Gallery",
          onTap: widget.galleryOnPressed,
        ),
      ],
    );
  }

  getSpeedDialOption(
      {required IconData icon, required String label, dynamic onTap}) {
    return SpeedDialChild(
      child: Icon(icon),
      backgroundColor: appWhiteColor,
      label: label,
      labelStyle: TextStyle(fontSize: 16.0, color: primaryColor),
      labelBackgroundColor: appWhiteColor,
      onTap: onTap,
      foregroundColor: primaryColor,
      shape: CircleBorder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
