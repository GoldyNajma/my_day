import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/data/models/request_body/sign_up_request_body.dart';
import 'package:my_day/modules/sign_up/sign_up_view_model.dart';
import 'package:my_day/utils/widgets/auth/my_day_email_field.dart';
import 'package:my_day/utils/widgets/auth/my_day_password_field.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/my_day_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  final void Function(String message)? onSuccessSignUp;
  final void Function(String message)? onFailedSignUp;

  const SignUpForm({ 
    Key? key,
    this.onSuccessSignUp,
    this.onFailedSignUp,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validatedAtLeastOnce = false;
  bool _isLoading = false;

  void _submitForm() {
    SignUpRequestBody requestBody = SignUpRequestBody(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() => _isLoading = true);
    SignUpViewModel.instance.signUp(requestBody)
      .then((message) {
        if (widget.onSuccessSignUp != null) {
          widget.onSuccessSignUp!(message);
        }
      })
      .catchError((error) {
        if (widget.onFailedSignUp != null) {
          widget.onFailedSignUp!('$error');
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
            buttonColor: Theme.of(context).accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            isLoading: _isLoading,
            text: 'Sign up',
            textStyle: const TextStyle(fontSize: 24),
            onPressed: _validateForm,
          ),
        ],
      ),
    );
  }
}