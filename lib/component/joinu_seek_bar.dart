

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinu_component/component/seek_bar.dart';



class SiteSeekBar extends StatelessWidget {

  SiteSeekBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SeekBar(
          value: 30,
          progressWidth: 8,
          secondValue: 1,
          progressColor: Colors.blue,
          showThumb: true,
          onStartTrackingTouch: (value) {
            print(value);
          },
          onProgressChanged: (value) {
            print(value);
          },
          onStopTrackingTouch: () {
            print('onStopTrackingTouch');
          },
        )
    );
  }

}