/*
 * @Author: Shaw
 * @Date: 2021-07-20 15:00:28
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-21 14:40:25
 */

import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '我的商城',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: const IndexPage());
  }
}
