import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/literals.dart';

class MySeekBar extends StatefulWidget {
  const MySeekBar({super.key});

  @override
  State<MySeekBar> createState() => _MySeekBarState();
}

class _MySeekBarState extends State<MySeekBar> {
  @override
  Widget build(BuildContext context) {
    int valueHolder = 20;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 15.w,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.white,
              thumbColor: white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.w),
            ),
            child: Slider(
              value: valueHolder.toDouble(),
              min: 1,
              max: 100,
              // activeColor: Colors.lightGreenAccent.shade400,
              // inactiveColor: Colors.grey,
              label: '${valueHolder.round()}',
              onChanged: (double newValue) {
                setState(() {
                  valueHolder = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()}';
              },
            ),
          ),
        ),
      ],
    );
  }
}
