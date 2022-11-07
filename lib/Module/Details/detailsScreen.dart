import 'package:drinhome/Model/TModel.dart';
import 'package:drinhome/Widgets/Style/style.dart';
import 'package:drinhome/Widgets/buttonCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatelessWidget {
  TModel item;
  DetailsScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name medicine: ${item.title.toString()}",
                  style: Style.textStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                imageNetwork(),
                const SizedBox(height: 10),
                Text(
                  "Used For Diseases: ${item.usedForDiseases.toString()}",
                  style: Style.textStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "Symptoms of use: ${item.use.toString()}",
                  style: Style.textStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "How to use: ${item.use.toString()}",
                  style: Style.textStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "The components: ${item.components.toString()}",
                  style: Style.textStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                buttonShare(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
