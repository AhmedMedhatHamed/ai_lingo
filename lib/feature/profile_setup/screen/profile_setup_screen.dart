import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String selectedLevel = 'Beginner';

  final Set<String> selectedInterests = <String>{};

  final List<Map<String, Object>> interests = [
    {'title': 'Travel', 'icon': Icons.flight},
    {'title': 'Business', 'icon': Icons.savings_outlined},
    {'title': 'Work', 'icon': Icons.business_center},
    {'title': 'Food', 'icon': Icons.restaurant},
    {'title': 'Culture', 'icon': Icons.flag},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 52,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 32,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 0, 26, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              const Center(
                child: Text(
                  'Complete Your Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    height: 1.2,
                    color: Color(0xFF1E293B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your level and interests to get a personalized experience.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF304A73),
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Language Level',
                style: TextStyle(
                  fontSize: 21,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildLevelOption('Beginner')),
                  const SizedBox(width: 18),
                  Expanded(child: _buildLevelOption('Intermediate')),
                ],
              ),
              const SizedBox(height: 34),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Interests ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '(Optional)',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 21),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 18,
                runSpacing: 14,
                children: interests.map((interest) {
                  final title = interest['title'] as String;
                  final icon = interest['icon'] as IconData;
                  final isSelected = selectedInterests.contains(title);

                  return _buildInterestOption(
                    title: title,
                    icon: icon,
                    isSelected: isSelected,
                  );
                }).toList(),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelOption(String level) {
    final isSelected = selectedLevel == level;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = level;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 62,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : const Color(0xFF888888),
            width: 1.5,
          ),
        ),
        child: Text(
          level,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFF1E293B),
          ),
        ),
      ),
    );
  }

  Widget _buildInterestOption({
    required String title,
    required IconData icon,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedInterests.remove(title);
          } else {
            selectedInterests.add(title);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: (MediaQuery.of(context).size.width - 88) / 2,
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : const Color(0xFF888888),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 9),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
