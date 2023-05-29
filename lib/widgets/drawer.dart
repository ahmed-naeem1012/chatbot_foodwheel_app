// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/screens/paymentdetails.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 0,
          ),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/premium-photo/cooking-recipe-ingredients-black-background_203461-176.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            accountName: Text('Food Wheels'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE0I9674pkeNR0p_pvlXMRMW_X9_HbcEre6Db8_vWkpTJO8AGinB0DRvDky3rQZP4gEcI&usqp=CAU')),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chatbot'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Confirmation!!',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                        'This is a Paid Feature. Do you wish to proceed with Chatbot?',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    actions: <Widget>[
                      TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Proceed',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreditCardPage()),
                          );
                          // Navigator.of(context).pop();
                          // Add navigation code to ChatbotScreen here
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Expanded(
            child: Container(), // Spacer at the bottom
          ),
        ],
      ),
    );
  }
}
