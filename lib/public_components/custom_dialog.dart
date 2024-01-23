import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class CustomDialog extends StatefulBuilder {
  const CustomDialog({super.key, required super.builder});

  static Future<bool?> show(BuildContext context,
      {StateSetter? stateSetter,
      bool dismissOnTouchOutside = true,
      Widget? center,
      // Widget? top,
      IconData? icon,
      String? title,
      String? description,
      int dialogType = DialogType.info,
      String? btnOkText,
      String? btnCancelText,
      bool isDissmissable = true,
      Function()? btnCancelOnPress,
      Function()? btnOkOnPress}) async {
    return await showDialog<bool>(
        barrierDismissible: isDissmissable,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setter) {
            stateSetter = setter;
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async => isDissmissable,
              child: Dialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon != null
                          ? Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getBgColor(dialogType),
                              ),
                              child: Center(
                                child: Icon(
                                  icon,
                                  color: getTextColor(dialogType),
                                  size: 30,
                                ),
                              ),
                            )
                          : Space(height: 0),
                      // top ?? Space(0),
                      icon != null ? Space(height: 10) : Space(height: 0),
                      Text(
                        title ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      title != null ? Space(height: 10) : Space(height: 0),
                      Text(
                        description ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: kGrey),
                      ),
                      description != null
                          ? Space(height: 10)
                          : Space(height: 0),
                      center ??
                          Space(
                            height: 0,
                          ),
                      center != null ? Space(height: 10) : Space(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btnCancelText != null
                              ? Expanded(
                                  child: ScaleTap(
                                    onPressed: btnCancelOnPress,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            btnCancelText,
                                            style: const TextStyle(
                                                color: kPrimaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          btnCancelText != null && btnOkText != null
                              ? Space(
                                  width: 10.0,
                                )
                              : Space(
                                  width: 0.0,
                                ),
                          btnOkText != null
                              ? Expanded(
                                  child: ScaleTap(
                                  onPressed: btnOkOnPress,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: getBgColor(dialogType),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                          child: Text(
                                        btnOkText,
                                        style:
                                            TextStyle(color: getTextColor(dialogType)),
                                      )),
                                    ),
                                  ),
                                ))
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  static Color getTextColor(int dialogType) {
    if (dialogType == DialogType.success) {
      return kTextSuccess;
    } else if (dialogType == DialogType.danger) {
      return kTextDanger;
    } else if (dialogType == DialogType.warning) {
      return kTextWarning;
    } else {
      return kTextInfo;
    }
  }

  static Color getBgColor(int dialogType) {
    if (dialogType == DialogType.success) {
      return kBgSuccess;
    } else if (dialogType == DialogType.danger) {
      return kBgDanger;
    } else if (dialogType == DialogType.warning) {
      return kBgWarning;
    } else {
      return kBgInfo;
    }
  }
}
