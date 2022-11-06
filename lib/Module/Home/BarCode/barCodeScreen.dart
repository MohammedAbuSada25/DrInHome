import 'package:drinhome/Module/Details/detailsScreen.dart';
import 'package:drinhome/Module/Home/BarCode/barCodeController.dart';
import 'package:drinhome/Widgets/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BarCodeScreen extends StatelessWidget {
  // const BarCodeScreen({Key? key}) : super(key: key);

  final controller = Get.put(
    BarCodeController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (control) =>
          controller.isLoadingRequest ? EasyLoading.init() : _buildBody(),
    );
  }

  _buildBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start camera and scan the barcode such as",
            style: Style.textStyle(fontSize: 20),
          ),
          Image.asset("assets/images/barcode.jpg"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              visibleItems(
                Text(
                  controller.scanBarcodeString,
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              visibleItems(
                IconButton(onPressed: () {
                  Get.to(DetailsScreen(item: controller.item));
                }, icon: const Icon(Icons.arrow_back)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => controller.scanBarcode(),
                child: const Text(
                  'Start barcode scan',
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ],
      );

  visibleItems(Widget widget) => Visibility(
        visible: controller.visible,
        child: widget,
      );
}
