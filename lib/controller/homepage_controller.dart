import 'package:get/get.dart';

class HomeBodyController extends GetxController {
  var selectedIndex = 0.obs;
  var favoriteItems = <int, bool>{}.obs;

  void toggleFavorite(int itemId) {
    if (favoriteItems.containsKey(itemId)) {
      favoriteItems[itemId] = !favoriteItems[itemId]!;
    } else {
      favoriteItems[itemId] = true;
    }
  }

  bool isFavorite(int itemId) {
    return favoriteItems[itemId] ?? false;
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
