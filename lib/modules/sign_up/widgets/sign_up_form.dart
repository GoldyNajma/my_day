import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/auth/my_day_email_field.dart';
import 'package:my_day/utils/widgets/auth/my_day_password_field.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/my_day_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validatedAtLeastOnce = false;

  void _validateForm() {
    bool formIsValid = _formKey.currentState!.validate();
    
    if(formIsValid) {
      print('~~~~~~~~~~~~~~valid~~~~~~~~~~~~~~');
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
  void dispose() {
    _usernameController.dispose();
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
            label: 'Username',
            controller: _usernameController,
            autovalidateMode: autovalidateMode,
            keyboardType: TextInputType.text,
            validator: (String? username) => 
              username == null || username.isEmpty ? 'Required field.' : null,
            suffixIcon: const Icon(Boxicons.bxs_user,
              color: MyDayColors.black,
              size: 20,
            ),
          ),
          const SizedBox(height: 22),
          MyDayEmailField(
            controller: _emailController,
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 22),
          MyDayPasswordField(
            controller: _passwordController,
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 33),
          MyDayRoundedButton(
            buttonColor: MyDayColors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            text: 'Sign up',
            textColor: MyDayColors.white,
            textSize: 24,
            onPressed: _validateForm,
          ),
        ],
      ),
    );
  }
}