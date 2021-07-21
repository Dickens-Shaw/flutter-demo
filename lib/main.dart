/*
 * @Author: Shaw
 * @Date: 2021-07-20 15:00:28
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-20 18:18:07
 */

import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: '我的商城',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
