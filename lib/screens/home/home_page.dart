import 'package:barcodeapp/services/barcode_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var barcode;
  var data;
  int? index;
  String title = "Scan product barcode and I give you information about it!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BarCodeService.getData(),
        builder: (context, AsyncSnapshot<List<dynamic>> snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator.adaptive();
          } else if (snap.hasError) {
            return const Center(child: Text("error"));
          } else {
            data = snap.data!;
            return Center(
              child: index != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Name: ${data[index]['productName']}"),
                        Text("Product Barcode: ${data[index]['barcode']}"),
                        Text("Product Type: ${data[index]['productType']}"),
                        Text("Product Prise: ${data[index]['cost']}"),
                      ],
                    )
                  : Text(title, textAlign: TextAlign.center),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          child: const Icon(Icons.document_scanner_outlined),
          onPressed: () async {
            try {
              index = null;
              setState(() {});
              barcode = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', 'Cancel', true, ScanMode.BARCODE);
              for (var i = 0; i < data.length; i++) {
                if (barcode == data[i]['barcode']) {
                  print(data[i]['barcode']);
                  index = i;
                  setState(() {});
                }
              }
            } on PlatformException {
              barcode = 'Error in geting platform version.';
            }
          },
        ),
      ),
    );
  }
}
