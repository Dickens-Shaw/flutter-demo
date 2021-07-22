/*
 * @Author: Shaw
 * @Date: 2021-07-21 14:44:47
 * @Description: 
 * @LastEditors: Shaw
 * @LastEditTime: 2021-07-22 10:27:42
 */
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '这里展示搜索结果';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商城首页'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '物品类型',
                helperText: '请输入你想查找的内容',
              ),
              autofocus: false,
            ),
            ElevatedButton(
              onPressed: _choiceAction,
              child: const Text('点击查找'),
            ),
            Text(
              showText,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 3,
            )
          ],
          // ignore: deprecated_member_use
        ),
      ),
    );
  }

  void _choiceAction() {
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(title: Text('不能为空')));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val['data'].toString();
        });
      });
    }
  }

  Future getHttp(String typeText) async {
    try {
      var data = {'name': typeText};
      Response response = await Dio().post(
          "http://192.168.0.11:3001/mock/37/updateUser",
          queryParameters: data);
      return response.data;
    } catch (e) {
      return;
    }
  }
}
