import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/themes/aap_text_styles.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/Bill_info/bill_info_widget.dart';
import 'package:payflow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_list/bill_list_widget.dart';

class MyBillsPage extends StatefulWidget {
  const MyBillsPage({Key? key}) : super(key: key);

  @override
  _MyBillsPageState createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BillModel>>(
                  valueListenable: controller.billsNotifier,
                  builder: (_, bills, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BillInfoWidget(
                      size: bills.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Row(
              children: [
                Text(
                  "Meus Boletos",
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
