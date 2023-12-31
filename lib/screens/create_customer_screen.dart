import 'package:azercell_mobile_app/common_widget/custom_text_field.dart';
import 'package:azercell_mobile_app/screens/debit_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.white30,Colors.lightGreenAccent
            ]
          )
       ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "Welcome! \nCreate a customer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic
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
                labelText: "SurName",
              focusNode: surnameFocusNode,
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
            ),
            CustomTextField(
              controller: _birthDateController,
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
                labelText: "Birth Date",
              focusNode: birthDateFocusNode,
              hintText: "dd/mm/yyyy",
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            CustomTextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              prefixText:  "+994",
              labelText: "Gsm Number",
              focusNode: numberFocusNode,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(9),
              ],
              ),
           const SizedBox(
             height: 50,
           ),
            MaterialButton(
              color:  Colors.white,
                minWidth: 220.0,
                height: 50,
                child: const Text(
                    "Create",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                splashColor: Colors.redAccent,
                elevation: 20,
                onPressed: (){
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) => DebitCardScreen()),
                  // );
            })
          ],
        ),
      ),
    );
  }
}
