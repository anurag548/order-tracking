import 'package:flutter/material.dart';
import 'package:get_package_testing/controllers/get_delivery_information.dart';
import 'package:get_package_testing/models/delivery_status_info.dart';

import '../services/shopping_cart.dart';
//import 'package:get_package_testing/controllers/shopping_cart.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  var dates = [];
  var details = [];
  void initState() {
    getStatus();
    super.initState();
  }

  getStatus() async {
    var response = await BaseUrl().get(
        'https://raw.githubusercontent.com/pravesh-razor/Own-API-s/main/trackdelhivery.json');
    var deldate = DeliveryInfo.fromJson(response);
    Map delInfo = deldate.data;
    // print(delInfo['2022-05-03'][2].statusText);
    delInfo.forEach((k, v) {
      dates.add(k);
      details.add(v);
      // print(value['2022-05-03'].statusCode);
      // print(value)
    });
    print(dates);
    print(details[0][0].statusLocation);
    // details.forEach((element) {
    //   print(element[0].statusCode);
    // });
    dates = dates.reversed.toList();
    details = details.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // child: ElevatedButton(
            //   child: Text('Test List'),
            //   onPressed: null,
            // ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  // var statusLocation;
                  // for (var i = 0; i < details.length; i++) {
                  //   for (var j = 0; j < details[i].length; j++) {
                  //     statusLocation = details[i][j].statusText;
                  //     print(statusLocation);
                  //   }
                  // }
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(dates[index]),
                      // Text(statusLocation)
                      ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          // addSemanticIndexes: true,
                          itemCount: details[index].length,
                          itemBuilder: ((context, ind) {
                            return Column(
                              children: [
                                Text(details[index][ind].statusTime),
                                Text(details[index][ind].statusText),
                                Text(details[index][ind].statusLocation),
                              ],
                            );
                            // var test;
                            // for (int i = 0; i < details[index].length; i++) {
                            //   test = details[index][i].statusTime;
                            //   print(test);
                            //   return Text(test);
                            // }
                            // return Text(test);
                          })),
                    ],
                  );
                })));
  }
}

// class GetInfo {
  
//   getStatus() async {
//     var response = await BaseUrl().get(
//         'https://raw.githubusercontent.com/pravesh-razor/Own-API-s/main/trackdelhivery.json');
//     var deldate = DeliveryInfo.fromJson(response);
//     Map delInfo = deldate.data;
//     // print(delInfo['2022-05-03'][2].statusText);
//     delInfo.forEach((k, v) {
//       dates.add(k);
//       details.add(v);
//       // print(value['2022-05-03'].statusCode);
//       // print(value)
//     });
//     print(dates.length);
//     print(details.length);
//     // details.forEach((element) {
//     //   print(element[0].statusCode);
//     // });
//   }
// }
