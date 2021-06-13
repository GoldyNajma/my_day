import 'package:flutter/material.dart';
import 'package:my_day/data/models/request_body/sign_in_request_body.dart';
import 'package:my_day/modules/sign_in/sign_in_view_model.dart';
import 'package:my_day/utils/widgets/auth/my_day_email_field.dart';
import 'package:my_day/utils/widgets/auth/my_day_password_field.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';

class SignInForm extends StatefulWidget {
  final void Function(String message)? onSuccessSignIn;
  final void Function(String message)? onFailedSignIn;

  const SignInForm({ 
    Key? key,
    this.onSuccessSignIn,
    this.onFailedSignIn,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validatedAtLeastOnce = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    SignInRequestBody requestBody = SignInRequestBody(
      email: _emailController.text, 
      password: _passwordController.text,
    );
    SignInViewModel signInViewModel = SignInViewModel.instance;

    setState(() => _isLoading = true);
    signInViewModel.signIn(requestBody)
      .then((token) => signInViewModel.saveAuthorizationToken(token))
      .then((_) {
        if (widget.onSuccessSignIn != null) {
          widget.onSuccessSignIn!('Signed in successfully.');
        }
      })
      .catchError((error) {
        if (widget.onFailedSignIn != null) {
          widget.onFailedSignIn!('$error.\nSign in failed. Please try again.');
        }
      })
      .whenComplete(() => setState(() => _isLoading = false));
  }

  void _validateForm() {
    if (!_isLoading) {
      bool formIsValid = _formKey.currentState!.validate();
      
      if(formIsValid) {
        _submitForm();
      }
      if (!_validatedAtLeastOnce) {
        setState(() => _validatedAtLeastOnce = true);
      }
    }
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
            buttonColor: Theme.of(context).accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            isLoading: _isLoading,
            text: 'Sign in',
            textStyle: const TextStyle(fontSize: 24),
            onPressed: _validateForm,
          ),
        ],
      ),
    );
  }
}