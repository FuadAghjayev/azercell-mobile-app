import 'package:azercell_mobile_app/models/card_amount_provider.dart';
import 'package:flutter/material.dart';

import '../../auth_db/customer_model.dart';
import '../../common_widget/custom_button.dart';
import '../../main.dart';
import '../transfer/transfer_screen.dart';
import 'package:provider/provider.dart';


class VisaCard extends StatefulWidget {
  const VisaCard({Key? key,}) : super(key: key);
  @override
  State<VisaCard> createState() => _VisaCardState();
}

class _VisaCardState extends State<VisaCard> {
  late CustomerModel cardHolderName;

  @override
  void initState() {
    cardHolderName = box.get('customerModel');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    var _provider = Provider.of<CardAmountProvider>(context,listen: false);
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      height: 380.0,
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
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
                color: Colors.black,
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
                          "4449 **** **** 6971",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Icon(
                          Icons.contactless,
                          size: 30,
                          color: Colors.white,
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
                      "${cardHolderName.name} ${cardHolderName.surname}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
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
                         '08/27',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                              color: Colors.white

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
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Text(
                            "${_provider.secondCardAmount} ₼",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/Visa_Brandmark_White_RGB_2021.png',
                          width: 60,
                          height: 45,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            CustomButton(
              onPressed: () async{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransferScreen(),
                  ),
                );
              },
              text: "Select",
            ),
          ],
        ),
      ),
    );
  }
}