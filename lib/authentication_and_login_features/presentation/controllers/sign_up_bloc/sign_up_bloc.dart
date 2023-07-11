import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import 'package:snap_jobs/authentication_and_login_features/domain/entities/sign_up_parameters.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/sign_up_use_case.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ///the signUp form inputText should show error if the input is invalid
  ///and the user unfocused the inputText. not when the user is typing.
  SignUpBloc({
    required BaseSignUpRepository signUpRepository,
  })  : _signUpRepository = signUpRepository,
        super(const SignUpState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);

    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmedPasswordChanged>(_onConfirmedPasswordChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);

    on<CountryChanged>(_onCountryChanged);
    on<CityChanged>(_onCityChanged);
    on<AgeChanged>(_onAgeChanged);
    on<GenderChanged>(_onGenderChanged);
    on<PastExperiencesChanged>(_onPastExperiencesChanged);
    on<SkillsChanged>(_onSkillsChanged);

    on<SignUpSubmitted>(_onSubmitted ,
    transformer: droppable(),
    );
  }

  final BaseSignUpRepository _signUpRepository;

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));
    try {
      await sl<SignUpUseCase>().call(
        SignUpParameters(
          email: state.email,
          firstName: state.firstName,
          lastName: state.lastName,
          password: state.password,
          confirmPassword: state.confirmedPassword,
          gender: state.gender,
          phoneNumber: state.phoneNumber,
          age: state.age,
          city: state.city,
          country: state.country,
          pastExperiences: state.pastExperiences,
          skills: state.skills,
        ),
      );
      emit(state.copyWith(submissionStatus: SubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.failure));
    }
  }

  void _onFirstNameChanged(FirstNameChanged event, Emitter<SignUpState> emit) {
    final firstName = event.firstName;
    emit(
      state.copyWith(
        firstName: firstName,
      ),
    );
  }

  void _onLastNameChanged(LastNameChanged event, Emitter<SignUpState> emit) {
    final lastName = event.lastName;
    emit(
      state.copyWith(
        lastName: lastName,
      ),
    );
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void _onConfirmedPasswordChanged(
      ConfirmedPasswordChanged event, Emitter<SignUpState> emit) {
    final confirmedPassword = event.confirmedPassword;
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
      ),
    );
  }

  void _onAgeChanged(AgeChanged event, Emitter<SignUpState> emit) {
    final age = event.age;
    emit(
      state.copyWith(
        age: age,
      ),
    );
  }

  void _onCityChanged(CityChanged event, Emitter<SignUpState> emit) {
    final city = event.city;
    emit(
      state.copyWith(
        city: city,
      ),
    );
  }

  void _onCountryChanged(CountryChanged event, Emitter<SignUpState> emit) {
    final country = event.country;
    emit(
      state.copyWith(
        country: country,
      ),
    );
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<SignUpState> emit) {
    final phoneNumber = event.phoneNumber;
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void _onGenderChanged(GenderChanged event, Emitter<SignUpState> emit) {
    final gender = (event.gender == "male" || event.gender == "female")? event.gender : "female";


    emit(state.copyWith(
      gender: gender,
    ));
  }

  void _onPastExperiencesChanged(
      PastExperiencesChanged event, Emitter<SignUpState> emit) {
    final pastExperiences = event.pastExperiences;
    emit(
      state.copyWith(
        pastExperiences: pastExperiences,
      ),
    );
  }

  void _onSkillsChanged(SkillsChanged event, Emitter<SignUpState> emit) {
    final skills = event.skills;
    emit(
      state.copyWith(
        skills: skills,
      ),
    );
  }
}
