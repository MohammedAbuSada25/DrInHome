import 'package:drinhome/Model/TModel.dart';
import 'package:drinhome/Module/Details/detailsController.dart';
import 'package:drinhome/Widgets/Style/style.dart';
import 'package:drinhome/Widgets/buttonCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatelessWidget {
  TModel item;
  DetailsScreen({required this.item, super.key});

  final controller = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    String title = "اسم الدواء: ${item.title.toString()}";
    String usedForDiseases =
        " يستخدم لأمراض: ${item.usedForDiseases.toString()}";
    String symptomsUse =
        "الأعراض المصاحبة عند استخدام هذا الدواء ${item.symptomsUse.toString()}";
    String howToUse = " كيفية إستخدام هذا الدواء: ${item.use.toString()}";
    String components = " مكونات هذا الدواء هي: ${item.components.toString()}";

    return Scaffold(
      appBar: AppBar(
        leading: buttonAppBar(
            text: "عودة",
            function: () {
              Get.back();
            }),
        actions: [
          buttonAppBar(
              text: "مشاركة",
              function: () {
                Share.share(item.title.toString(),
                    subject: item.usedForDiseases.toString());
              }),
        ],
      ),
      body: GetBuilder(
        init: controller,
        builder: (control) => body(
          title: title,
          howToUse: howToUse,
          symptomsUse: symptomsUse,
          usedForDiseases: usedForDiseases,
          components: components,
        ),
      ),
    );
  }

  Widget body({
    required String title,
    required String usedForDiseases,
    required String howToUse,
    required String symptomsUse,
    required String components,
  }) =>
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    controller.speak(title);
                  },
                  child: Text(
                    title,
                    style: Style.textStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                imageNetwork(),
                TextButton(
                  onPressed: () {
                    controller.speak(usedForDiseases);
                  },
                  child: Text(
                    usedForDiseases,
                    style: Style.textStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.speak(howToUse);
                  },
                  child: Text(
                    howToUse,
                    style: Style.textStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.speak(symptomsUse);
                  },
                  child: Text(
                    symptomsUse,
                    style: Style.textStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.speak(components);
                  },
                  child: Text(
                    components,
                    style: Style.textStyle(fontSize: 12),
                  ),
                ),
                buttonShare(),
              ],
            ),
          ),
        ),
      );

  imageNetwork() => Image.network(
        item.image.toString(),
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
  buttonShare() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textButton(
              text: 'مشاركة على فسبوك', color: Colors.indigo, function: () {}),
          const SizedBox(
            width: 10,
          ),
          textButton(
            text: 'مشاركة على تويتر',
            color: Colors.blue,
            function: () {
              Share.share(item.title.toString(),
                  subject: item.usedForDiseases.toString());
            },
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              Share.share(item.title.toString(),
                  subject: item.usedForDiseases.toString());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      );

  buttonAppBar({required String text, required VoidCallback function}) =>
      TextButton(
        onPressed: function,
        child: Text(
          text,
          style: Style.textStyle(color: Colors.black),
        ),
      );
}
