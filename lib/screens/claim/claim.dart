import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/flutter_month_picker.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/resources/claim/claim_resources.dart';
import 'package:app_merchant_saler/screens/claim/components/claim_body.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';

class Claim extends StatefulWidget {
  const Claim({super.key});

  @override
  State<Claim> createState() => _ClaimState();
}

class _ClaimState extends State<Claim> {
  DateTime? _selected;
  TextEditingController monthPicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ClaimResources.filterMonthYear(
        prefix: 'filter-by-year-and-month',
        body: {
          "year": _selected?.year.toString() ??
              "", // Use selected year if available
          "month": _selected != null
              ? _selected!.month.toString().padLeft(2, '0')
              : "", // Use selected month if available
        },
      ),
      builder: (context, redeem) {
        if (redeem.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: LoadingDialog(),
          );
        } else if (redeem.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Text('Error: ${redeem.error}'),
            ),
          );
        } else {
          List<dynamic> redeemedList = redeem.data ?? [];
          return Scaffold(
            appBar: _buildAppBar(context),
            body: CustomBackgroundScreen(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _buildFilter(context),
                    Space(
                      height: 20.0,
                    ),
                    ClaimBody(redeemedList: redeemedList),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfPage(
                            redeemedList: redeemedList,
                            filter: monthPicker.text,
                          ),
                        ),
                      );
                    },
                    backgroundColor: kPrimaryButtonColor,
                    label: const Text(
                      "Download Report",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Text(
        'Claim',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
  }) async {
    final selected = await showMonthPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
    );
    if (selected != null) {
      final formattedDate =
          "${selected.year}-${selected.month.toString().padLeft(2, '0')}";
      monthPicker.text = formattedDate;
      setState(() {
        _selected = selected;
      });
    }
  }

  Widget _buildFilter(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 200,
        child: TextFormField(
          readOnly: true,
          controller: monthPicker,
          onTap: () => _onPressed(context: context),
          decoration: InputDecoration(
            filled: true,
            fillColor: kWhiteColor,
            prefixIcon: const Icon(
              Icons.calendar_month,
              color: kPrimaryColor,
            ),
            suffixIcon: _selected != null
                ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _selected = null;
                        monthPicker.text =
                            ""; // Clear text when clearing selection
                      });
                    },
                  )
                : null,
            floatingLabelBehavior: _selected != null
                ? FloatingLabelBehavior.auto
                : FloatingLabelBehavior.never,
            labelText: _selected != null ? 'Filter' : 'Selected Filter',
            labelStyle: const TextStyle(color: kBlack, fontSize: 12),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
