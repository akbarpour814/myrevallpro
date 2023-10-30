import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/data/model/auth/sign_request_model.dart';
import 'package:revallpro/gen/assets.gen.dart';
import 'package:revallpro/utils/custom_modals.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:revallpro/views/auth/forget_pass/forget_pass_screen.dart';
import 'package:revallpro/views/auth/register/bloc/register_bloc.dart';
import 'package:revallpro/views/auth/signin/signin_screen.dart';

class RegisterSreen extends StatefulWidget {
  const RegisterSreen({super.key});

  @override
  State<RegisterSreen> createState() => _RegisterSreenState();
}

class _RegisterSreenState extends State<RegisterSreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _obscurepass = true;
  IconData _passIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              15.h(context).hsb(),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Assets.resource.logo1
                    .image(width: 12.h(context), height: 12.h(context)),
              ),
              6.h(context).hsb(),
              Text('Create an account',
                  style: Theme.of(context).textTheme.labelLarge),
              8.h(context).hsb(),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: _emailController,
                validator: emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onFieldSubmitted: (value) =>
                    setState(() => _passwordFocusNode.requestFocus()),
              ),
              16.hsb(),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurepass = !_obscurepass;
                        _passIcon = _obscurepass
                            ? Icons.visibility
                            : Icons.visibility_off;
                      });
                    },
                    icon: Icon(
                      _passIcon,
                    ),
                  ),
                ),
                obscureText: _obscurepass,
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: passwordValidator,
              ),
              24.hsb(),
              BlocProvider(
                create: (context) => RegisterBloc(),
                child: BlocConsumer<RegisterBloc, RegisterState>(
                  listenWhen: (previous, current) => previous != current,
                  buildWhen: (previous, current) => previous != current,
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      CustomModal.showSuccess(
                          context, 'Account created succesfully.');
                      MyNavigator.pushReplacement(
                          context,
                          SignInScreen(
                            email: _emailController.text.trim(),
                          ));
                    }
                    if (state is RegisterError) {
                      CustomModal.showError(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: state is RegisterLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                      RegisterRequestEvent(SignRequestModel(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim())));
                                }
                              },
                        child: state is RegisterLoading
                            ? CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : const Text('Get Started'));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget password?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      MyNavigator.push(context, ForgetPassScreen());
                    },
                    child: Text(
                      'Reset here',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              ),
              16.h(context).hsb(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you have an account?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () =>
                        MyNavigator.pushReplacement(context, SignInScreen()),
                    child: Text(
                      'Sign in.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
