import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/cubit/home_state.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/home/widgets/history_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ConversationHistoryScreen extends StatefulWidget {
  const ConversationHistoryScreen({super.key});

  @override
  State<ConversationHistoryScreen> createState() =>
      _ConversationHistoryScreenState();
}

class _ConversationHistoryScreenState extends State<ConversationHistoryScreen> {
  IconData? getScenarioIcon(String icon) {
    switch (icon) {
      case 'coffee':
        return Icons.coffee;
      case 'airplanemode_active':
        return Icons.airplanemode_active;
      case 'work_outline':
        return Icons.work_outline;
      case 'store_outlined':
        return Icons.store_outlined;
      case 'health_and_safety':
        return Icons.health_and_safety;
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getUser();
  }

  UserModel? user;
  List<HistoryModel> history = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  AppStrings.conversationHistory,
                  style: AppStyles.almaraiBoldSize32,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              BlocConsumer<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  if (state is HomeUserSuccessState) {
                    user = state.user;
                    history = user?.history ?? [];
                  }

                  return SizedBox(
                    height: size.height * 0.75,
                    child: history.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) {
                              final historyItem = history[index];
                              return HistoryCardItem(
                                icon:
                                    getScenarioIcon(historyItem.icon) ??
                                    Icons.chat,
                                iconColor: AppColors.secondaryColor,
                                title: historyItem.title,
                                time: DateFormat(
                                  'dd MMM yyyy, hh:mm a',
                                ).format(historyItem.createdAt.toDate()),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: size.height * 0.01);
                            },
                            itemCount: history.length,
                          )
                        : Center(
                            child: Text(
                              'No History Yet',
                              style: AppStyles.inter400Size11.copyWith(
                                fontSize: 20,
                                fontWeight: .w600,
                                color: AppColors.splashColor,
                              ),
                            ),
                          ),
                  );
                },
                listener: (context, state) {
                  if (state is HomeUserErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.message),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
