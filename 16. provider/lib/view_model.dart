import 'package:flutter/material.dart';
import 'package:providergallery/model.dart';

class AppState with ChangeNotifier {
  bool isTaggingMod = false;
  List<PhotoState> photoStates = List.of(urls.map((url) => PhotoState(url)));
  Set<String> tags = {"all", "dog", "cat"};

  void toggleTagging(url) {
    isTaggingMod = !isTaggingMod;
    for (var element in photoStates) {
      if (isTaggingMod && element.url == url) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    }
    notifyListeners();
  }

  void selectTag(String tag) {
    if (isTaggingMod) {
      if (tag != "all") {
        for (var element in photoStates) {
          if (element.selected) {
            element.tags.add(tag);
          }
        }
        toggleTagging(null);
      }
    } else {
      for (var element in photoStates) {
        element.display = tag == "all" ? true : element.tags.contains(tag);
      }
    }
    notifyListeners();
  }

  void onPhotoSelect(String url, bool selected) {
    for (var element in photoStates) {
      if (element.url == url) {
        element.selected = selected;
      }
    }
    notifyListeners();
  }
}
