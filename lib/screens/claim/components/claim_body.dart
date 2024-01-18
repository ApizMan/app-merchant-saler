import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:flutter/material.dart';

class ClaimBody extends StatefulWidget {
  final List<dynamic> redeemedList;
  const ClaimBody({
    Key? key,
    required this.redeemedList,
  }) : super(key: key);

  @override
  State<ClaimBody> createState() => _ClaimBodyState();
}

class _ClaimBodyState extends State<ClaimBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _buildTable(context, widget.redeemedList),
    );
  }

  Widget _buildTable(BuildContext context, List<dynamic> redeemedList) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
              redeemedItem['cm_usage_date'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
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
              redeemedItem['cm_coupon_code'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
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
              style: const TextStyle(fontSize: 14),
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
              "RM ${double.parse(redeemedItem['cs_value']).toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ];
  }
}
