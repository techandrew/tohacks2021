import 'package:muggles/screens/home.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../enums.dart';

class ConnectionStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _connectionStatus = Provider.of<ConnectivityStatus>(context);
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            animationEnabled: true,
            size: MediaQuery.of(context).size.width * 0.65,
            customColors: CustomSliderColors(
                progressBarColor:
                    _connectionStatus == ConnectivityStatus.Offline
                        ? Colors.red
                        : Color(primaryColor)),
            customWidths: CustomSliderWidths(progressBarWidth: 10),
            infoProperties: InfoProperties(
              topLabelText: "Today's Consumption",
              topLabelStyle: TextStyle(
                color: Color(secondaryColor),
              ),
              bottomLabelText: 'Cost ₹193',
              bottomLabelStyle: TextStyle(
                fontSize: 16,
                color: Color(secondaryColor),
              ),
              modifier: (percentage) => percentage.toStringAsFixed(1).toString() + ' kWh',
              mainLabelStyle: TextStyle(
                fontSize: 48,
                color: _connectionStatus == ConnectivityStatus.Offline
                    ? Colors.red
                    : Color(primaryColor),
              ),
            ),
          ),
          min: 0,
          max: 10,
          initialValue: wattsconsumed,
        ),
      ),
    );
  }
}
