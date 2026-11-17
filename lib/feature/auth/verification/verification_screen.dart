import 'dart:async';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/feature/auth/verification/cubit/phone_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
        (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _remainingSeconds = 45;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _remainingSeconds = 45;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get _enteredCode {
    return _controllers.map((controller) => controller.text).join();
  }

  void _verifyCode() {
    final code = _enteredCode;

    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the 6-digit verification code.'),
        ),
      );
      return;
    }

    context.read<PhoneVerificationCubit>().verifyCode(code);
  }

  void _resendCode() {
    final cubit = context.read<PhoneVerificationCubit>();
    final phone = cubit.phoneNumber;

    if (phone == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone number not found. Please try again.'),
        ),
      );
      return;
    }

    for (final controller in _controllers) {
      controller.clear();
    }

    _focusNodes[0].requestFocus();

    cubit.sendCode(phone);
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PhoneVerificationCubit>();

    return BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
      listener: (context, state) {
        if (state is PhoneVerificationSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.profileSetupScreen);
        }

        if (state is PhoneVerificationFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }

        if (state is PhoneCodeSentState) {
          _startTimer();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Verification code sent successfully.'),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state is PhoneVerificationLoadingState ||
                state is PhoneVerifyingState;

        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),

                    const Text(
                      'Verification Code',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Color(0xFF1E293B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12.0),

                    const Text(
                      'Please enter the 6-digit code sent to your phone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF304A73),
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    Text(
                      cubit.phoneNumber ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF304A73),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 35),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                            (index) => SizedBox(
                          width: 45.0,
                          height: 60.0,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 1,
                            enabled: !isLoading,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 5) {
                                _focusNodes[index + 1].requestFocus();
                              } else if (value.isEmpty && index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24.0),

                    const Text(
                      "Didn't receive the code?",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF304A73),
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    TextButton(
                      onPressed: _remainingSeconds == 0 && !isLoading
                          ? _resendCode
                          : null,
                      child: Text(
                        _remainingSeconds > 0
                            ? '(00:${_remainingSeconds.toString().padLeft(2, '0')})'
                            : 'Resend Code',
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 223, 48, 156),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 60.0),

                    Center(
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _verifyCode,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}