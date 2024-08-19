import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getXController/NewsController.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(61),
        child: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(61),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width >= 768
                          ? 768
                          : MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.add_card,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '뉴스',
                            style: TextStyle(
                                fontSize: 17,
                                // height: 1.2,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Helvetica'),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: const Icon(
                                Icons.add_card,
                              ),
                            ),
                          )
                        ],
                      ))),
                  Container(
                    color: const Color.fromRGBO(221, 221, 221, 1),
                    height: 0.35,
                  ),
                ],
              )),
        ),
      ),
      body: Obx(() => _newsController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _newsController.articles.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1),
                          width: 1.0)),
                  child: Center(
                    child: Text(
                      _newsController.articles[index].title!,
                      style: const TextStyle(
                        color: Color.fromRGBO(76, 85, 102, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
