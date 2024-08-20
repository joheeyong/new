import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nnews/service/newsService.dart';

import 'constants/constants.dart';
import 'getXController/NewsController.dart';

class MyStatefulDialog extends StatefulWidget {
  @override
  State<MyStatefulDialog> createState() => _MyStatefulDialogState();
}

class _MyStatefulDialogState extends State<MyStatefulDialog> {
  final NewsController _newsController = Get.put(NewsController());
  int? selectedRadio = 0;

  List<String> naCode = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'cz',
    'de',
    'eg',
    'fr',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'lt',
    'jp',
    'kr',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
  ];
  List<String> naName = [
    '아랍에미리트',
    '아르헨티나',
    '오스트리아',
    '호주',
    '벨기에',
    '불가리아',
    '브라질',
    '캐나다',
    '스위스',
    '중국',
    '체코',
    '독일',
    '이집트',
    '프랑스',
    '그리스',
    '홍콩',
    '헝가리',
    '인도네시아',
    '아일랜드',
    '이스라엘',
    '리투아니아',
    '일본',
    '대한민국',
    '라트비아',
    '모로코',
    '멕시코',
    '말레이시아',
    '나이지리아',
    '네덜란드',
    '노르웨이'
  ];

  @override
  Widget build(BuildContext context) {
    print(naCode.length);
    print(naName.length);
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(child:
              ListView.builder(
                  itemCount: naCode.length,
                  itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Radio<int>(
                  value: index,
                  groupValue: selectedRadio,
                  onChanged: (int? value) {
                    Constants.country=naCode[index];
                    print("Constants.country: "+Constants.country);
                    final NewsController _newsController = Get.put(NewsController());
                    _newsController.fetchArticle();
                    setState(() => selectedRadio = value);
                    Navigator.pop(context);
                  },
                ),
                Text(naName[index])
              ],
            );
          }))
        ]),
      ),
    );

    //
    // return AlertDialog(
    //   content: Container(
    //       height: 600,
    //       width: double.infinity,
    //       child: ListView.builder(itemBuilder: (BuildContext context, int index){
    //     return Row(children: [
    //       Radio<int>(
    //         value: index,
    //         groupValue: selectedRadio,
    //         onChanged: (int? value) {
    //           setState(() => selectedRadio = value);
    //         },
    //       ),
    //       Text(naName[index])
    //     ],);
    //   })),
    // );
  }
}
