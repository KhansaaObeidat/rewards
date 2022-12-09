import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkInfoService {
//   Future<bool> isConnected() async {
//     late ConnectivityResult result;
//     try {
//       result = await Connectivity().checkConnectivity();
//     } on PlatformException catch (e) {
//       Exception('Couldn\'t check connectivity status error: $e');
//       return false;
//     }

//     if (result == ConnectivityResult.wifi ||
//         result == ConnectivityResult.mobile) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
class NetworkInfoService{
  Future<bool> isConnected( )async{
    final result= await InternetAddress.lookup('google.com');
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
      return true;
    }
    return false;
  }

}