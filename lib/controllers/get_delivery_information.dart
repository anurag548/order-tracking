import 'package:get_package_testing/models/delivery_status_info.dart';
import 'package:get_package_testing/services/shopping_cart.dart';
import 'package:http/http.dart';

class GetInfo {
  var dates = [];
  var details = [];
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
    print(dates.length);
    print(details[1].length);
    // details.forEach((element) {
    //   print(element[0].statusCode);
    // });
  }
}
