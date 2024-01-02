
import 'package:azercell_mobile_app/models/card_amount_provider.dart';
import 'package:azercell_mobile_app/screens/cards_screens/create_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../auth_db/customer_model.dart';
import '../../common_widget/custom_button.dart';
import '../../main.dart';
import 'visa_cards.dart';
import 'package:provider/provider.dart';

class MasterCard extends StatefulWidget {
  const MasterCard({Key? key,}) : super(key: key);

  @override
  State<MasterCard> createState() => _MasterCardState();
}

class _MasterCardState extends State<MasterCard> {
  late CustomerModel cardHolderName;
  late String expiryDate;

  @override
  void initState() {
    expiryDate = "12/24";
    super.initState();
    checkAndOpenBox();

  }

  Future<void> checkAndOpenBox() async {
    if (!box.isOpen) {
      await  Hive.openBox('customerModel');
    }
  }


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CardAmountProvider>(context,listen:false);
    final Size _size = MediaQuery.of(context).size;
    cardHolderName = box.get('customerModel');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Container(
              height: _size.height * 0.3,
              width: _size.width * 0.9,
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
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "5522 **** **** 6679",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.contactless,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Card Holder",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "${cardHolderName.name } ${cardHolderName.surname}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Expires",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          expiryDate,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Text(
                            "${provider.firstCardAmount} ₼",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ),

                        Image.asset(
                          'assets/images/mc_sym_debit_pos_70_3x.png',
                          width: 60,
                          height: 45,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          CustomButton(
            onPressed: () async{
              showModalBottomSheet(
                isDismissible: true,
                context: context,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) => VisaCard(),
              );
            },
            text: "Transfer",
          ),
          SizedBox(
            height: 20,
          ),

        CustomButton(
            onPressed: () async{
              await cardBox.clear();
             Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (context) =>  CreateCardScreen()),
             );
            },
            text: "Delete Card",
        ),

        ],
      ),
    );
  }

}
