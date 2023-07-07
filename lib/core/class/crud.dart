import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if(response.statusCode==200 || response.statusCode == 201){
          Map responseBody = jsonDecode(response.body);
          debugPrint(responseBody.toString());
          return Right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.internetFailure);
      }
    } catch (e) {
      debugPrint("$e");
      return const Left(StatusRequest.serverException);
    }
  }
}
