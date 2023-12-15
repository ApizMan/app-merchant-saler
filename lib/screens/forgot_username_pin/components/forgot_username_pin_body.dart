import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:flutter/material.dart';

class ForgotUsernamePinBody extends StatefulWidget {
  const ForgotUsernamePinBody({super.key});

  @override
  State<ForgotUsernamePinBody> createState() => _ForgotUsernamePinBodyState();
}

class _ForgotUsernamePinBodyState extends State<ForgotUsernamePinBody> {
  TextEditingController merchantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: 30.0),
          CustomTextfield(
            controller: merchantController,
            labelText: 'Merchant ID',
            hintText: 'Key-in Your Merchant ID at here',
          ),
          Space(height: 20.0),
          CustomTextfield(
            controller: merchantController,
            labelText: 'Merchant Phone No.',
            hintText: '+6012345678',
          ),
          Space(height: 50.0),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: const Text("Reset",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Space(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(252, 249, 240, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Icon(
                  Icons.error_outline,
                  color: Colors.yellow,
                ),
              ),
              Space(
                width: 10.0,
              ),
              const Text(
                'You will receive new PIN via registered email',
                style: TextStyle(
                  color: kRedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
