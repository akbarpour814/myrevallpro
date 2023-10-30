import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/gen/assets.gen.dart';
import 'package:revallpro/utils/custom_modals.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/validators.dart';
import 'package:revallpro/views/auth/forget_pass/bloc/forget_pass_bloc.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
              Text('Please enter your email',
                  style: Theme.of(context).textTheme.labelLarge),
              8.h(context).hsb(),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: _emailController,
                validator: emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              30.hsb(),
              BlocProvider(
                create: (context) => ForgetPassBloc(),
                child: BlocConsumer<ForgetPassBloc, ForgetPassState>(
                  buildWhen: (previous, current) => previous != current,
                  listenWhen: (previous, current) => previous != current,
                  listener: (context, state) {
                    if (state is ForgetPassSuccess) {
                      CustomModal.showSuccess(
                          context, 'Check your email to change your password.');
                      Navigator.pop(context);
                    }
                    if (state is ForgetPassError) {
                      CustomModal.showError(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: state is ForgetPassLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<ForgetPassBloc>(context).add(
                                      ForgetPassRequestEvent(
                                          _emailController.text.trim()));
                                }
                              },
                        child: state is ForgetPassLoading
                            ? CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : const Text('Send reset link'));
                  },
                ),
              ),
              26.h(context).hsb(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Back',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
