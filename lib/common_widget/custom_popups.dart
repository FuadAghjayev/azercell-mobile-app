

import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('Please fill in all fields.'),
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

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('The transfer was successful'),
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