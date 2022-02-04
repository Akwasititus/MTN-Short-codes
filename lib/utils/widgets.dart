import 'package:flutter/material.dart';

import 'constants.dart';

class ContentWidget extends StatelessWidget {
  // const ContentWidget({
  //   Key? key,
  // }) : super(key: key);

  final String contentDescribtion;
  final Function()? onPress;
  ContentWidget({
    required this.contentDescribtion,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(contentDescribtion),
        //('MTN Pulse'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            style: outlineButtonStyle,
            onPressed: onPress,
            //() => UrlLauncher.launch("tel://*124#"),
            child: const Text('Dial'),
          ),
        )
      ],
    );
  }
}
