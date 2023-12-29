import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/custom_month_year_picker/month_year_picker.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClaimBody extends StatefulWidget {
  const ClaimBody({Key? key}) : super(key: key);

  @override
  State<ClaimBody> createState() => _ClaimBodyState();
}

class _ClaimBodyState extends State<ClaimBody> {
  DateTime? _selected;
  TextEditingController monthPicker = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateMonthYearText();
  }

  void _updateMonthYearText() {
    String monthYear = _selected != null
        ? DateFormat().add_yM().format(_selected!)
        : 'Selected Filter';
    monthPicker.text = monthYear;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _buildFilter(context),
          Space(
            height: 20.0,
          ),
          FutureBuilder(
            future: DashboardResources.merchantRedeemed(
              prefix: 'merchant-redeemed',
            ),
            builder: (context, redeem) {
              if (redeem.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              } else if (redeem.hasError) {
                return Text('Error: ${redeem.error}');
              } else {
                List<dynamic> redeemedList = redeem.data['merchant_redeemed'];
                return _buildTable(context, redeemedList);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
        _updateMonthYearText();
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
                        _updateMonthYearText();
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

  Widget _buildTable(BuildContext context, List<dynamic> redeemedList) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Table(
            border: TableBorder.all(color: kWhiteColor),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: kGrey.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                children: _topTable(context),
              ),
              for (var redeemedItem in redeemedList)
                TableRow(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  children: _tableBody(context, redeemedItem),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _topTable(BuildContext context) {
    return [
      const TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Date",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Code",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Type",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Value",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
  }

  List<Widget> _tableBody(
      BuildContext context, Map<String, dynamic> redeemedItem) {
    return [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(
              height: 10.0,
            ),
            Text(
              redeemedItem['usage_date'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(
              height: 10.0,
            ),
            Text(
              redeemedItem['couponcode'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(
              height: 10.0,
            ),
            Text(
              redeemedItem['cs_name'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(
              height: 10.0,
            ),
            Text(
              "RM ${redeemedItem['cs_value']}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ];
  }
}
