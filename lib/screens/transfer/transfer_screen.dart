import 'package:azercell_mobile_app/common_widget/custom_popups.dart';
import 'package:azercell_mobile_app/screens/cards_screens/master_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common_widget/custom_button.dart';
import '../../models/card_amount_provider.dart';
import 'package:provider/provider.dart';


class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cardAmountProvider = Provider.of<CardAmountProvider>(context);

    double firstCardAmount = cardAmountProvider.firstCardAmount;
    double secondCardAmount = cardAmountProvider.secondCardAmount;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child:Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "5522 **** **** 6679",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$firstCardAmount ₼",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_circle_down,
              size: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "4449 **** **** 6971",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      "$secondCardAmount ₼",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 25),
            CustomButton(
              onPressed: () async{
                double enteredNumber = double.parse(_numberController.text);
                if (firstCardAmount >= enteredNumber) {
                  cardAmountProvider.updateAmounts(
                    firstCardAmount - enteredNumber,
                    secondCardAmount + enteredNumber,
                  );

                  // firstCardAmount -= enteredNumber;
                  // secondCardAmount += enteredNumber;
                  showSuccessDialog(context);
                  await Future.delayed(Duration(seconds: 5));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MasterCard(),
                    ),
                  );
                } else{
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('The transfer was unsuccessful'),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0)),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

              },
              text: "Send",
            ),
          ],
        ),
      ),
    );
  }
}



