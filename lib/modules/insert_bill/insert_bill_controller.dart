import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBillController {
  final formKey = GlobalKey<FormState>();

  BillModel model = BillModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValue(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barCode: barcode,
    );
  }

  Future<void> saveBill() async {
    final instance = await SharedPreferences.getInstance();
    final bills = instance.getStringList("boletos") ?? <String>[];
    bills.add(model.toJson());
    await instance.setStringList("boletos", bills);
    return;
  }

  Future<void> registerBill() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBill();
    }
  }
}
