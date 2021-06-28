import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/themes/aap_text_styles.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/Bill_info/bill_info_widget.dart';
import 'package:payflow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_list/bill_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _MyBillsPageState createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<ExtractPage> {
  final controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Row(
              children: [
                Text(
                  "Meus Extratos",
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BillListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
