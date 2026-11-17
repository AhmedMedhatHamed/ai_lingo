part of 'phone_verification_cubit.dart';

abstract class PhoneVerificationState {}

class PhoneVerificationInitial extends PhoneVerificationState {}

class PhoneVerificationLoadingState extends PhoneVerificationState {}

class PhoneCodeSentState extends PhoneVerificationState {}

class PhoneVerifyingState extends PhoneVerificationState {}

class PhoneVerificationSuccessState extends PhoneVerificationState {}

class PhoneVerificationFailureState extends PhoneVerificationState {
  final String errorMsg;

  PhoneVerificationFailureState({required this.errorMsg});
}