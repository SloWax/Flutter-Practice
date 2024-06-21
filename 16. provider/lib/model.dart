const List<String> urls = [
  "https://cdn.pixabay.com/photo/2017/06/29/13/29/pug-2454270_1280.jpg",
  "https://cdn.pixabay.com/photo/2014/09/19/21/47/chihuahua-453063_1280.jpg",
  "https://cdn.pixabay.com/photo/2015/06/15/23/56/chihuahua-810789_1280.jpg",
  "https://cdn.pixabay.com/photo/2019/04/02/16/11/cat-4098058_1280.jpg"
];

class PhotoState {
  String url;
  bool selected;
  bool display;
  Set<String> tags = {};

  PhotoState(this.url, {this.selected = false, this.display = true});
}
