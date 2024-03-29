import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/form_bloc/profile/store_profile_form_bloc.dart';
import 'package:app_merchant_saler/helpers/share_preferences_helper.dart';
import 'package:app_merchant_saler/models/merchant_seq_model.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  StoreProfileFormBloc? storeProfileFormBloc;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileResources.getProfile(prefix: 'users'),
      builder: (context, profile) {
        if (profile.hasData) {
          return BlocProvider(
            create: (context) => StoreProfileFormBloc(
                merchantSeqModel: MerchantSeqModel(
              merchantPic: profile.data['user']['merchant_pic'] ?? "",
              merchantContact: profile.data['user']['merchant_contact'] ?? "",
              merchantEmail: profile.data['user']['merchant_email'] ?? "",
              merchantAddress: profile.data['user']['merchant_address'] ?? "",
            )),
            child: Builder(
              builder: (context) {
                storeProfileFormBloc =
                    BlocProvider.of<StoreProfileFormBloc>(context);

                SharedPreferencesHelper.saveMerchantName(
                  profile.data['user']['merchant_name'] ?? "",
                );

                return FormBlocListener<StoreProfileFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    LoadingDialog.show(context);
                  },
                  onSubmissionFailed: (context, state) =>
                      LoadingDialog.hide(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    Fluttertoast.showToast(msg: state.successResponse!);
                    Navigator.of(context).pop();
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                    Fluttertoast.showToast(
                      msg: 'Server Error',
                      fontSize: 14,
                    );
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          toBeginningOfSentenceCase(profile.data['user']
                                  ['merchant_name']
                              .toString())!,
                          style: const TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextfield(
                                textFieldBloc: storeProfileFormBloc!.name,
                                labelText: 'Person Name',
                                hintText: 'Key-in Your Name Here',
                              ),
                              CustomTextfield(
                                keyboardType: TextInputType.phone,
                                textFieldBloc: storeProfileFormBloc!.phoneNum,
                                labelText: 'No. Phone',
                                hintText: 'Key-in Your Phone Number Here',
                              ),
                              CustomTextfield(
                                textFieldBloc: storeProfileFormBloc!.email,
                                labelText: 'Email',
                                hintText: 'Key-in Your Email Here',
                              ),
                              SizedBox(
                                height: 200,
                                child: CustomTextfield(
                                  expands: true,
                                  maxLines: null,
                                  textFieldBloc: storeProfileFormBloc!.address,
                                  labelText: 'Address',
                                  hintText: 'Key-in Your Address Here',
                                ),
                              ),
                              Space(
                                height: 10.0,
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: kGrey,
                              ),
                              Space(
                                height: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Set Your New PIN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Space(
                                    height: 10.0,
                                  ),
                                  CustomTextfield(
                                    textFieldBloc:
                                        storeProfileFormBloc!.tempPIN,
                                    labelText: 'Current PIN',
                                    hintText: 'Key-in Your Current PIN at here',
                                  ),
                                  CustomTextfield(
                                    textFieldBloc: storeProfileFormBloc!.newPIN,
                                    labelText: 'New PIN',
                                    hintText: 'Key-in Your New PIN at here',
                                  ),
                                ],
                              ),
                              Space(
                                height: 10.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  onPressed: () {
                                    storeProfileFormBloc?.submit();
                                  },
                                  label: const Text("Update",
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 16,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const LoadingDialog();
        }
      },
    );
  }
}
