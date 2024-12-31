import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    title: AppLocalizations.of(context)!.termsAndConditions,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.terms_welcome,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.blueGrey.shade300),
                  const SizedBox(height: 10),
                  buildSection(
                    title: AppLocalizations.of(context)!.terms_agreement_title,
                    content:
                        AppLocalizations.of(context)!.terms_agreement_content,
                    icon: Icons.gavel_outlined,
                  ),
                  buildSection(
                    title: AppLocalizations.of(context)!.terms_order_title,
                    content: AppLocalizations.of(context)!.terms_order_content,
                    icon: Icons.inventory_2_outlined,
                  ),
                  buildSection(
                    title: AppLocalizations.of(context)!.terms_payment_title,
                    content:
                        AppLocalizations.of(context)!.terms_payment_content,
                    icon: Icons.payment_outlined,
                  ),
                  buildSection(
                    title: AppLocalizations.of(context)!.terms_updates_title,
                    content:
                        AppLocalizations.of(context)!.terms_updates_content,
                    icon: Icons.update_outlined,
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.blueGrey.shade300),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.terms_contact,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueGrey.shade500, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.blueGrey.shade700,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
