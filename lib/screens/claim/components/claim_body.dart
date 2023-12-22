import 'package:app_merchant_saler/public_components/custom_month_year_picker/month_year_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClaimBody extends StatefulWidget {
  const ClaimBody({super.key});

  @override
  State<ClaimBody> createState() => _ClaimBodyState();
}

class _ClaimBodyState extends State<ClaimBody> {
  DateTime? _selected;
  TextEditingController monthPicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: monthPicker,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_selected == null)
                const Text('No month year selected.')
              else
                Text(DateFormat().add_yM().format(_selected!)),
              TextButton(
                child: const Text('DEFAULT LOCALE'),
                onPressed: () => _onPressed(context: context),
              ),
              TextButton(
                child: const Text('BAHASA MALAYSIA'),
                onPressed: () => _onPressed(context: context, locale: 'ms'),
              ),
              TextButton(
                child: const Text('اللغة العربية'),
                onPressed: () => _onPressed(context: context, locale: 'ar'),
              ),
            ],
          )
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
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
