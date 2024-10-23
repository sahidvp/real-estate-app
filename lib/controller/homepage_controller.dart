import 'package:get/get.dart';

class HomeBodyController extends GetxController {
  var selectedIndices = <int>[].obs;
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
      if (selectedIndices.contains(index)) {
      selectedIndices.remove(index); // Remove if already selected
    } else {
      selectedIndices.add(index); // Add if not selected
    }
  }
}
