import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/profile/cubit/auth_cubit.dart';
import 'package:ai_lingo/feature/profile/widgets/profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthState>(
        listener:  (context, state) {
          if (state is ChangeNameSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Name changed successfully'),
                backgroundColor: Colors.green,
              ),
            );
            nameController.clear();
            emailController.clear();
            Navigator.pop(context);
          }

          if (state is ChangePasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(automaticallyImplyLeading: true),
                        SliverToBoxAdapter(
                          child: ProfileImage(),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 60.0)),
                        SliverToBoxAdapter(
                          child: CustomTextField(
                            controller: nameController,
                            text: 'Name',
                            prefixIcon: Icons.person,
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 30.0)),
                        SliverToBoxAdapter(
                          child: CustomTextField(
                            controller: emailController,
                            text: 'Email Address',
                            prefixIcon: Icons.email_rounded,
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 100.0)),
                        SliverToBoxAdapter(
                          child:
                              state is ChangeNameLoading?
                            CupertinoActivityIndicator(
                              color: AppColors.primaryColor,
                            ):
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: CustomButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  context.read<AuthCubit>().changeName(
                                    nameController.text,
                                  );
                                }
                              },
                              text: 'Confirm',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },

      ),
    );
  }
}

