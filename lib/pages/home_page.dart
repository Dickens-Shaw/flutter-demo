/*
 * @Author: Shaw
 * @Date: 2021-07-21 14:44:47
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-22 11:01:06
 */
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  String showText = '还没有数据';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('请求远程数据')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: _jike, child: const Text('请求数据'))
          ],
        ),
      ),
    );
  }

  void _jike() {
    print('极客');
    getHttp().then((val) {
      setState(() {
        showText = val['data'].toString();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = Dio();
      print(httpHeaders);
      dio.options.headers = httpHeaders;
      response =
          await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
