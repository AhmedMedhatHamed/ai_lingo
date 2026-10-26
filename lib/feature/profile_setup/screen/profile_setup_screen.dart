import 'package:flutter/material.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final Set<String> selectedInterests = <String>{};

  final List<Map<String, Object>> interests = [
    {'title': 'Travel', 'icon': Icons.flight},
    {'title': 'Business', 'icon': Icons.attach_money},
    {'title': 'Work', 'icon': Icons.business_center},
    {'title': 'Food', 'icon': Icons.restaurant},
    {'title': 'Culture', 'icon': Icons.flag_outlined},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              IconButton(onPressed:()=>Navigator.pop(context) , icon: const Icon(Icons.arrow_back)),
              
              const SizedBox(height: 12.0),
              const Text(
                  'Complete Your Profile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Color(0xFF1E293B)
                    , fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Choose your level and interests to get a personalized experience.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF304A73)),
              ),
              const SizedBox(height: 35),
              const Text(
                'Language Level',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF304A73),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                                          'Interests ',

                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19.0, color: Color(0xFF304A73)),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                       '(Optional)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Color(0xFF304A73)),
                    ),
                  ),
                   const SizedBox(height: 14),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: interests.map((interest) {
                  final title = interest['title'] as String;
                  final icon = interest['icon'] as IconData;
                  final isSelected =
                      selectedInterests.contains(title);

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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : const Color(0xFFD5DCE8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icon,
                            size: 20,
                            color: isSelected
                                ? Colors.white
                                : AppColors.splashColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.splashColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
                  
                ],
              ),
              // Add your profile setup form fields here
            ],
          ),
        ),
      ),
    );
  }
}
