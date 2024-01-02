

import 'package:azercell_mobile_app/screens/cards_screens/master_card.dart';
import 'package:azercell_mobile_app/screens/create_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../common_widget/custom_button.dart';
import '../../main.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({Key? key}) : super(key: key);

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 100, 0, 0),
            child: Text("Create a Debit Card",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black45
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              height: _size.height * 0.3,
              width: _size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
                color: Colors.white60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async{
                      await cardBox.put("cardBox", "cardCreate");
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MasterCard()),
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_rounded,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Get a Card",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Delete Account" ,
            onPressed: () async{
              await Hive.deleteFromDisk();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CreateCustomerScreen()),
              );
            },
          ),
        ],


      ),
    );
  }

}
