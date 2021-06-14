import 'package:flutter/material.dart';
import 'package:my_day/modules/home/home_view_model.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';

class SignOutButton extends StatefulWidget {
  final void Function(String message)? onSuccessSignOut;
  final void Function(String message)? onFailedSignOut;

  const SignOutButton({ 
    Key? key,
    this.onSuccessSignOut,
    this.onFailedSignOut, 
  }) : super(key: key);

  @override
  _SignOutButtonState createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    
    return MyDayRoundedButton(
      buttonColor: themeData.errorColor,
      padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 12),
      text: 'Sign Out',
      isLoading: _isLoading,
      onPressed: () {
        setState(() => _isLoading = true);
        HomeViewModel.instance.signOut()
          .then((message) {
            if (widget.onSuccessSignOut != null) {
              widget.onSuccessSignOut!(message);
            }
          })
          .catchError((error) {
            if (widget.onFailedSignOut != null) {
              widget.onFailedSignOut!(error);
            }
          })
          .whenComplete(() => setState(() => _isLoading = false));
      }
    );
  }
}