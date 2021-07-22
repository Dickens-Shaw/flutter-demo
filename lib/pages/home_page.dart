/*
 * @Author: Shaw
 * @Date: 2021-07-21 14:44:47
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-22 14:00:48
 */
import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  String homePageContent = '正在获取数据';
  @override
  void initState() {
    getHomePageContent().then((val) {
      print(val);
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('百姓生活+'),
        ),
        body: SingleChildScrollView(
          child: Text(homePageContent),
        ));
  }
}
