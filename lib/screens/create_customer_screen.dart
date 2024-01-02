import 'package:azercell_mobile_app/auth_db/customer_model.dart';
import 'package:azercell_mobile_app/common_widget/custom_button.dart';
import 'package:azercell_mobile_app/common_widget/custom_text_field.dart';
import 'package:azercell_mobile_app/screens/cards_screens/create_card_screen.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common_widget/custom_popups.dart';
import '../main.dart';

class CreateCustomerScreen extends StatefulWidget {
  const CreateCustomerScreen({Key? key}) : super(key: key);

  @override
  State<CreateCustomerScreen> createState() => _CreateCustomerScreenState();
}

class _CreateCustomerScreenState extends State<CreateCustomerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode surnameFocusNode = FocusNode();
  final FocusNode birthDateFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade100,
          Colors.orange.shade200,
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome! \nCreate a customer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              labelText: "Name",
              focusNode: nameFocusNode,
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
            ),
            CustomTextField(
              controller: _surnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              labelText: "Surname",
              focusNode: surnameFocusNode,
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
            ),
            DateTimePicker(
              initialValue: '',
              firstDate: DateTime(1900),
              lastDate: DateTime(2025),
              dateLabelText: 'Birth Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18
              ),
              onChanged: (val) {
                setState(() {
                  _birthDateController.text = val;
                });
              },
            ),

            CustomTextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              prefixText: "+994",
              labelText: "Gsm Number",
              focusNode: numberFocusNode,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(9),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 70, top: 5),
              child: CustomButton(
                onPressed: () {
                  if (_birthDateController.text.isNotEmpty &&
                      _numberController.text.isNotEmpty &&
                      _nameController.text.isNotEmpty &&
                      _surnameController.text.isNotEmpty) {
                    box.put(
                        "customerModel",
                        CustomerModel(
                            name: _nameController.text,
                            number: _numberController.text,
                            surname: _surnameController.text));
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => CreateCardScreen()),
                    );
                  } else
                    return showErrorDialog(context);
                },
                text: "Create Customer",
              ),
            )
          ],
        ),
      ),
    );
  }
}
