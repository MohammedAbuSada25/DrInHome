import 'package:drinhome/Helper/Dummy/dummy_data.dart';
import 'package:drinhome/Model/TModel.dart';
import 'package:drinhome/Widgets/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListController extends GetxController{

  ScrollController scrollController = ScrollController();
  bool isLoadingRequest = false;

  getData(){
    isLoadingRequest = true;
    update();
    GetXCustom.getData();
    isLoadingRequest = false;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}