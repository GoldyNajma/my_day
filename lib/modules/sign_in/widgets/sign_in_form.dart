import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/constants.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/my_day_text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({ Key? key }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordHidden = true;
  bool _validatedAtLeastOnce = false;

  bool _isEmptyString(String? text) => text == null || text.isEmpty;

  String? _validateEmail(String? email) {
    if (_isEmptyString(email)) {
      return 'Required field.';
    } else if (!emailRegExp.hasMatch(email ?? '')) {
      return 'Should be a valid email format.';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (_isEmptyString(password)) {
      return 'Required field.';
    } else if (password!.length < 6) {
      return 'Should be at least 6 characters long.';
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AutovalidateMode? autovalidateMode = _validatedAtLeastOnce 
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

    return Form(
      key: _formKey, 
      child: Column(
        children: <Widget>[
          MyDayTextFormField(
            label: 'Email',
            controller: _emailController,
            autovalidateMode: autovalidateMode,
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            suffixIcon: const Icon(Icons.mail_rounded,
              color: MyDayColors.black,
              size: 20,
            ),
          ),
          const SizedBox(height: 31),
          MyDayTextFormField(
            label: 'Password',
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _passwordHidden,
            validator: _validatePassword,
            suffixIcon: IconButton(
              icon: Icon(_passwordHidden ? Boxicons.bxs_show : Boxicons.bxs_hide),
              onPressed: () => setState(() => _passwordHidden = !_passwordHidden),
              color: MyDayColors.black,
              iconSize: 20,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 31),
          MyDayRoundedButton(
            buttonColor: MyDayColors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            text: 'Sign in',
            textColor: MyDayColors.white,
            textSize: 24,
            onPressed: () {
              bool formIsValid = _formKey.currentState!.validate();
              
              if(formIsValid) {
                print('~~~~~~~~~~~~~~valid~~~~~~~~~~~~~~');
              } else {
                print('~~~~~~~~~~~~not valid~~~~~~~~~~~~');
              }
              if (!_validatedAtLeastOnce) {
                _validatedAtLeastOnce = true;
              }
              print('email: ${_emailController.text}');
              print('password: ${_passwordController.text}');
              print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
            },
          )
        ],
      ),
    );
  }
}