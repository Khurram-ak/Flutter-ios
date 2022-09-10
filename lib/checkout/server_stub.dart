import 'dart:convert';
import 'dart:io';
import 'package:quizjets/export_files.dart';
import 'package:dio/dio.dart';

/// Only for demo purposes!
/// Don't you dare do it in real apps!
class Serve {
  Future<String> createCheckout() async {
    //final auth = 'Basic ' + base64Encode(utf8.encode('$secretKey:'));
    final body = {
      'payment_method_types': ['card'],
      'line_items': [
        {
          'price': yearlyPriceId,
          'quantity': 1,
        }
      ],
      'mode': 'payment',
      'success_url': 'http://localhost:8080/#/success',
      'cancel_url': 'http://localhost:8080/#/cancel',
    };

    try {
      final result = await Dio().post(
        "https://api.stripe.com/v1/checkout/sessions",
        data: body,
        options: Options(
        //  headers: {HttpHeaders.authorizationHeader: auth},
          contentType: "application/x-www-form-urlencoded",
        ),

      );
      print('DIO RESPONSE ::: $result');
      return result.toString();
    } on DioError catch (e, s) {
      print(e.toString());
      print(s.toString());
      throw e;
    }
  }
}
