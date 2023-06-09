import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/components/sign_up_first_page.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/components/sign_up_second_page.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

class SignUpPages extends StatelessWidget {
  const SignUpPages({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpBloc(signUpRepository: sl<BaseSignUpRepository>()),
      child: const SignUpStepper(),
    );
  }
}

class SignUpStepper extends StatefulWidget {
  const SignUpStepper({
    super.key,
  });

  @override
  State<SignUpStepper> createState() => _SignUpStepperState();
}

class _SignUpStepperState extends State<SignUpStepper> {
  int _stepsIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            switch (state.submissionStatus) {
              case SubmissionStatus.initial:
                break;
              case SubmissionStatus.inProgress:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Signing Up...')),
                  );
                break;

              case SubmissionStatus.success:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('successfully signed up')),
                  );
                Navigator.of(context).pop();
                break;
              case SubmissionStatus.failure:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Sign Up Failure')),
                  );
                break;
              default:
                break;
            }
          },
          child: Stepper(
            margin: const EdgeInsets.all(5),
            type: StepperType.horizontal,
            currentStep: _stepsIndex,
            onStepContinue: () {
              if (_stepsIndex == 0) {
                setState(() {
                  _stepsIndex += 1;
                });
              } else if (_stepsIndex == 1) {
                if (_formKey.currentState!.validate()) {
                  context.read<SignUpBloc>().add(const SignUpSubmitted());
                } else {
                  ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('please fill all fields correctly')),
            );

                }
              }
            },
            onStepCancel: () {
              Navigator.pop(context);
            },
            onStepTapped: (index) {
              setState(() {
                _stepsIndex = index;
              });
            },
            steps: [
              Step(
                title: const Text("Sign up"),
                content: const SignUpFirstPage(),
                isActive: _stepsIndex == 0,
              ),
              Step(
                title: const Text("More About yourself"),
                content: const SignUpSecondPage(),
                isActive: _stepsIndex == 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
