import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String username;
  final String email;

  const ProfileWidget({ 
    Key? key, 
    required this.username, 
    required this.email, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageSize = 55;
    TextTheme textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(imageSize * 0.5),
              child: Image.asset('assets/images/default_profile_image.png', 
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(this.username, style: textTheme.bodyText2!.apply(
                  fontSizeDelta: -1,
                )),
                const SizedBox(height: 8),
                Text(this.email, style: textTheme.overline!.apply(
                  fontSizeDelta: -4,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}