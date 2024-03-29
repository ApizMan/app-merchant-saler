import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:app_merchant_saler/screens/profile/components/profile_body.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const CustomBackgroundScreen(
        child: ProfileBody(
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () async {
                LoginResources.logout(prefix: 'logout').then(
                  (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                    (route) {
                      return false;
                    },
                  ),
                );
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.clear();
              },
              backgroundColor: kRedColor,
              label: const Text(
                "Logout",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Text(
        'Profile',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
