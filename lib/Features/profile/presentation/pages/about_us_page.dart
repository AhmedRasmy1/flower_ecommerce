import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: AppLocalizations.of(context)!.about_us_title,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/splashLogo.png'),
                  backgroundColor: Colors.pink.shade50,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.about_us_welcome,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              buildSection(
                context,
                title: AppLocalizations.of(context)!.about_us_mission_title,
                icon: Icons.emoji_nature,
                content: AppLocalizations.of(context)!.about_us_mission_content,
              ),
              const Divider(),
              buildSection(
                context,
                title: AppLocalizations.of(context)!.about_us_vision_title,
                icon: Icons.visibility,
                content: AppLocalizations.of(context)!.about_us_vision_content,
              ),
              const Divider(),
              buildSection(
                context,
                title: AppLocalizations.of(context)!.about_us_contact_title,
                icon: Icons.contact_mail,
                content: AppLocalizations.of(context)!.about_us_contact_content,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.pink.shade300, size: 28),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
