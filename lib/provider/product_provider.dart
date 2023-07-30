import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_chow/helper_function/error_function.dart';
import 'package:food_chow/models/product_model.dart';
import 'package:food_chow/models/response_class.dart';

import '../helper_function/constant.dart';

class ProductProvider extends ChangeNotifier{
  final dio = Dio();

  bool isLoadingForReadUser = false;
  List<ProductModel> users = [];

  Future<ResponseClass<List<ProductModel>>> readUser() async {
    const uri =
        'https://www.foodchow.com/api/FoodChowWD/AllRestaurantsWDOfferApp?Country=India&city=Surat&area=&longitude=&latitude=&deliveryMethod=&cuisineId=2,1&clientid=&startlimit=0&endlimit=1000&onoffflag';

    ResponseClass<List<ProductModel>> responseClass = ResponseClass(
      success: false,
      message: StringConstant.initialErrorMsg,
    );

    try {
      isLoadingForReadUser = true;
      notifyListeners();
      Response response = await dio.get(uri);
      debugPrint("readUser : responseCode : ${response.statusCode}");
       // debugPrint("readUser : response : ${response.data}");
      if (response.statusCode == 200) {
        responseClass.success = true;
        responseClass.message = response.data['message'];
        responseClass.data=response.data["data"];
        // final newData=jsonDecode(response.data["data"]);
        // final data1= newData[0][0];
        // print("new data ${newData[0][0]}");
        // final newdata1=data1.map((e)=>ProductModel.fromjson(e) );
        // print("newdata1 : ${newdata1.runtimeType}");
         responseClass.data = List.from(
           response.data.map(
            (json) => ProductModel.fromjson(json),
          ),
        );
        users = responseClass.data!;
        isLoadingForReadUser = false;
        notifyListeners();
        return responseClass;
      } else {
        responseClass.success = false;
        responseClass.message = errorMessage(response.statusCode);
        Fluttertoast.showToast(msg: responseClass.message);
        isLoadingForReadUser = false;
        users = [];
        notifyListeners();
        return responseClass;
      }
    } on DioException catch (e) {
      // debugPrint("Dio catchError : $e");
      Fluttertoast.showToast(msg: StringConstant.initialErrorMsg);
      isLoadingForReadUser = false;
      users = [];
      notifyListeners();
      return responseClass;
    } catch (e) {
      // debugPrint("catchError : $e");
      Fluttertoast.showToast(msg: StringConstant.initialErrorMsg);
      isLoadingForReadUser = false;
      users = [];
      notifyListeners();
      return responseClass;
    }
  }
}
