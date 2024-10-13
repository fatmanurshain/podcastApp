import 'package:get/get.dart';
import 'package:podcast_app/shared/constants/strings.dart';

class HomeController extends GetxController {
  var trendingItems = [].obs;

  void fetchTrendingItems() {
    trendingItems.assignAll([
      {
        'image': 'https://example.com/photo1.png',
        'title': AppStrings.musicTitle1,
        'subtitle': AppStrings.musicSubtitle1,
      },
      {
        'image': 'https://example.com/photo2.png',
        'title': AppStrings.musicTitle2,
        'subtitle': AppStrings.musicSubtitle2,
      },
      {
        'image': 'https://example.com/photo3.png',
        'title': AppStrings.musicTitle3,
        'subtitle': AppStrings.musicSubtitle3,
      },
      {
        'image': 'https://example.com/photo4.png',
        'title': AppStrings.musicTitle4,
        'subtitle': AppStrings.musicSubtitle4,
      },
    ]);
  }

  void updateItem(int index, Map<String, String> newItem) {
    trendingItems[index] = newItem;
  }
}
