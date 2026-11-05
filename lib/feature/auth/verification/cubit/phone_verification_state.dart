
part of 'phone_verification_cubit.dart';

sealed class PhoneVerificationState {}

final class PhoneVerificationInitial extends PhoneVerificationState {}

final class PhoneVerificationLoadingState
    extends PhoneVerificationState {}

final class PhoneCodeSentState extends PhoneVerificationState {}

final class PhoneVerifyingState extends PhoneVerificationState {}

final class PhoneVerificationSuccessState
    extends PhoneVerificationState {}

final class PhoneVerificationFailureState
    extends PhoneVerificationState {
  final String errorMsg;

  PhoneVerificationFailureState({
    required this.errorMsg,
  });
}
