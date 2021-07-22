import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('百姓生活+'),
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList =
                  (data['data'] as List).cast(); // 顶部轮播组件数
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                ],
              );
            } else {
              return const Center(
                child: Text('加载中'),
              );
            }
          },
        ));
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({Key? key, required this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 333.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['image']}",
              fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: const SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
