import 'package:drinhome/Module/Details/detailsScreen.dart';
import 'package:drinhome/Module/Home/List/ListController.dart';
import 'package:drinhome/Widgets/Style/style.dart';
import 'package:drinhome/Widgets/getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  final controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (control) => controller.isLoadingRequest
            ? EasyLoading.init()
            : _buildBody(),
      ),
    );
  }

  _buildBody() {
    // print(controller.listNews[2].sImage.toString());
    return GetXCustom.listMedicine.isEmpty ? _emptyData : _isData();
  }

  _emptyData() => const Center(
        child: Text('Empty Data'),
      );

  _isData() => ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: GetXCustom.listMedicine.length,
    itemBuilder: (BuildContext context, int index) {
      return buildItem(context, index);
    },

  );

  Widget buildItem(BuildContext ctx, int index) => InkWell(
        onTap: () {
          Get.to(DetailsScreen(item: GetXCustom.listMedicine[index]));
        },
        child: Card(
            margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      // 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
                      GetXCustom.listMedicine[index].image.toString(),
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        GetXCustom.listMedicine[index].title.toString(),
                        style: Style.textStyle(color: Colors.black,fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        GetXCustom.listMedicine[index].usedForDiseases.toString(),
                        style: Style.textStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      );
}
