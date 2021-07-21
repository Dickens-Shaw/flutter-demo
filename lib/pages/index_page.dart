/*
 * @Author: Shaw
 * @Date: 2021-07-20 15:00:28
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-21 15:03:15
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "首页"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), label: "分类"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.cart), label: "购物车"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: "会员中心")
  ];

  final List tabList = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const MemberPage(),
  ];

  int currentIndex = 0;
  // ignore: prefer_typing_uninitialized_variables
  var currentPage;

  @override
  void initState() {
    currentPage = tabList[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabList[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
