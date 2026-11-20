import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().checkStreak();
    context.read<HomeCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeUserSuccessState) {
          user = state.user;
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: AppStyles.cairo400Size24.copyWith(
                            fontSize: 32,
                            color: AppColors.splashColor,
                          ),
                        ),
                        Text(
                          user?.name ?? 'Guest',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.almarai400Size24.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(height: size.height * 0.06),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(size.height * 0.03),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.daysGif,
                        width: size.width * 0.1,
                        height: size.width * 0.1,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        '${user?.currentStreak ?? 0} Days',
                        style: AppStyles.almarai400Size24.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is HomeUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
          );
        }
      },
    );
  }
}
