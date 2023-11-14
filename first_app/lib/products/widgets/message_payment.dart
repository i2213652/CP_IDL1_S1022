import 'package:flutter/material.dart';

class MessagePaymentWidget extends StatefulWidget {
  const MessagePaymentWidget({Key? key}) : super(key: key);

  @override
  MessagePaymentWidgetState createState() => MessagePaymentWidgetState();
}

class MessagePaymentWidgetState extends State<MessagePaymentWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    // Your widget code here
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text('Hemos recibido tu pedido.',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50.0),
          const Text('Vuelve pronto !',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(200, 40),
            ),
            child: const Text('OK'),
          ),
        ]));
  }
}
