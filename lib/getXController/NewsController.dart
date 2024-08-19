import 'package:get/get.dart';
import '../models/article.dart';
import '../service/newsService.dart';

class NewsController extends GetxController {
  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  void fetchArticle() async {
    isLoading(true);

    try {
      isLoading(true);
      var articleTemp = await NewsWebService.fetchNews();
      if (articleTemp != null) {
        articles(articleTemp);
      }
    } finally {
      isLoading(false);
    }
  }
}