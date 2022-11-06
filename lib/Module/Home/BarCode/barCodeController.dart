import 'package:drinhome/Model/TModel.dart';
import 'package:drinhome/Widgets/getx.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarCodeController extends GetxController {
  bool isLoadingRequest = false;
  bool visible = false;
  String scanBarcodeString = '';
  TModel item = TModel();

  scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if(Get.routing.current == "/home")return;
    if (barcodeScanRes != "-1") {
      visible = true;
      scanBarcodeString = barcodeScanRes;
      compareWithData();
      update();
    }
  }

  compareWithData() {
    GetXCustom.listMedicine.forEach((element) {
      if (element.barCode == scanBarcodeString) {
        item = element;
      }
    });
  }
}
