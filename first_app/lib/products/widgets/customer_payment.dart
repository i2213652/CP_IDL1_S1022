import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_app/products/common_components/modal_view.dart';
import 'message_payment.dart';

class CustomerPaymentWidget extends StatefulWidget {
  const CustomerPaymentWidget({Key? key}) : super(key: key);

  @override
  CustomerPaymentWidgetState createState() => CustomerPaymentWidgetState();
}

class CustomerPaymentWidgetState extends State<CustomerPaymentWidget> {
  String selectedOption = 'Efectivo';
  TextEditingController textEditingController = TextEditingController();

  File? _imageFile;

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    // Your widget code here
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Datos de compra',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: <String>['Efectivo', 'Crédito', 'Contraentrega']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Text(
            'Nombre',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textEditingController,
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Teléfono',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textEditingController,
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Obtener mi dirección',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Foto de la fachada',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _takePicture,
                child: Text('Tomar Foto'),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: _imageFile == null
                    ? const Center(child: Text('No Image'))
                    : Image.file(_imageFile!, fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ModalView(formWidget: MessagePaymentWidget());
                },
              );
            },
            child: Text('COMPRAR'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(200, 40),
            ),
          ),
        ],
      ),
    );
  }
}
