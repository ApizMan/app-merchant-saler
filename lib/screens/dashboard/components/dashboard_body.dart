import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final double sizeCard = 150.0;

  List<String> date = [
    "12-11-2023",
    "21-11-2023",
    "30-11-2023",
    "12-12-2023",
    "22-12-2023",
  ];

  List<String> code = [
    "CS1234",
    "CS1234",
    "CS1234",
    "CS1234",
    "CS1234",
  ];

  List<String> type = [
    "JHEPA",
    "Zakat",
    "JHEPA",
    "Zakat",
    "JHEPA",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildHeader(context),
        Space(height: 20.0),
        _buildCard(context),
        Space(height: 20.0),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Claim()));
              });
            },
            label: const Text(
              "Claim",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Space(height: 20.0),
        Expanded(
          child: _buildTable(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset('assets/images/logo.png'),
        ),
        const Expanded(
          child: Text(
            "CAFE",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: CustomCard(
                  data: const Text(
                    "Total Scan Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  value: const Text(
                    "3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  height: sizeCard,
                  color: kWhiteColor,
                ),
              ),
              Space(
                width: 10.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Space(
                width: 10.0,
              ),
              Expanded(
                child: CustomCard(
                  data: const Text(
                    "Total Coupon Value Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  value: const Text(
                    "RM 15",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  height: sizeCard,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
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
              ...List.generate(
                5,
                (index) {
                  return TableRow(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    children: _tableBody(context, index),
                  );
                },
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

  List<Widget> _tableBody(BuildContext context, int index) {
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
              date[index],
              textAlign: TextAlign.center,
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
              code[index],
              textAlign: TextAlign.center,
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
              type[index],
              textAlign: TextAlign.center,
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
              "RM $index",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ];
  }
}
