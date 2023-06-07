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
      child: SignUpStepper(),
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
  int _StepsIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
            margin: EdgeInsets.all(5),
            type: StepperType.horizontal,
            currentStep: _StepsIndex,
            onStepContinue: () {
              if (_StepsIndex == 0) {
                setState(() {
                  _StepsIndex += 1;
                });
              } else if (_StepsIndex == 1) {
                if (_formKey.currentState!.validate()) {
                  context.read<SignUpBloc>().add(SignUpSubmitted());
                }
              }
            },
            onStepCancel: () {
              Navigator.pop(context);
            },
            onStepTapped: (index) {
              setState(() {
                _StepsIndex = index;
              });
            },
            steps: [
              Step(
                title: Text("Sign up"),
                content: SignUpFirstPage(),
                isActive: _StepsIndex == 0,
              ),
              Step(
                title: Text("More About yourself"),
                content: SignUpSecondPage(),
                isActive: _StepsIndex == 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
