/*
 * @Author: Shaw
 * @Date: 2021-07-22 11:15:42
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-22 11:38:48
 */

import 'package:dio/dio.dart';
import '../config/service_url.dart';

Future getHomePageContent() async {
  try {
    print('开始获取首页数据...............');
    Response response;
    Dio dio = Dio();
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.get(servicePath['homePageContext'].toString());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>$e');
  }
}
