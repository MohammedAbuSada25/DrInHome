import 'package:drinhome/Helper/Dummy/dummy_data.dart';
import 'package:drinhome/Model/TModel.dart';
import 'package:get/get.dart';

class GetXCustom extends GetxController{
  static List<TModel> listMedicine = [];

  static getData(){
    listMedicine = List<TModel>.from(
        dummy.map((element) => TModel.fromJson(element)));
  }

}