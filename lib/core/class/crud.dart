import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/check_internet.dart';

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
Map<String, String> _myHeaders = {
  //'content-type':'application/json',
  //'accept':'application/json'
  'authorization': _basicAuth
};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          debugPrint(responseBody.toString());
          return Right(responseBody);
        } else {
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

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? requestName]) async {
    if (requestName == null) {
      requestName = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myHeaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(
        requestName,
        stream,
        length,
        filename: basename(image.path),
      );
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myRequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      return Left(StatusRequest.serverFailure);
    }
  }
}
