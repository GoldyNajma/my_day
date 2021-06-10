import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/modules/home/home_screen.dart';
import 'package:my_day/utils/widgets/auth/my_day_email_field.dart';
import 'package:my_day/utils/widgets/auth/my_day_password_field.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({ Key? key }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validatedAtLeastOnce = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    bool formIsValid = _formKey.currentState!.validate();
    
    if(formIsValid) {
      print('~~~~~~~~~~~~~~valid~~~~~~~~~~~~~~');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      print('~~~~~~~~~~~~not valid~~~~~~~~~~~~');
    }
    if (!_validatedAtLeastOnce) {
      setState(() => _validatedAtLeastOnce = true);
    }
    print('email: ${_emailController.text}');
    print('password: ${_passwordController.text}');
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
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
          MyDayEmailField(
            controller: _emailController,
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 31),
          MyDayPasswordField(
            controller: _passwordController,
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 31),
          MyDayRoundedButton(
            buttonColor: MyDayColors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            text: 'Sign in',
            textColor: MyDayColors.white,
            textSize: 24,
            onPressed: _validateForm,
          ),
        ],
      ),
    );
  }
}