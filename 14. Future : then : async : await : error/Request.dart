import 'dart:async';

void main() {
  mockFileIO('1');

  searchName();

  mockFileIO('2');
}

void mockFileIO(String count) {
  print('FILE IO: 시작$count');
  print('FILE IO: 파일 출력$count');
  print('FILE IO: 종료$count');
}

void searchName() async {
  try {
    var response = await mockHttpRequest();
    var query = await mockDBQuery(response, isError: true);
    print('디비 쿼리: $query');
  } catch (error) {
    print(error);
  }
}

Future<String> mockHttpRequest({bool isError = false}) {
  print('HTTP리퀘스트: 시작');
  if (isError) {
    return Future.error('http timeout');
  } else {
    return Future.delayed(Duration(seconds: 3), () {
      print('HTTP리퀘스트: response => 철수');
      print('HTTP리퀘스트: 종료');

      return '철수';
    });
  }
}

Future<String> mockDBQuery(String searchString, {bool isError = false}) {
  print('디비 쿼리 $searchString: 시작');
  if (isError) {
    return Future.error('Not found');
  } else {
    return Future.delayed(
        Duration(seconds: 2), () => ('result => ID:1, name: $searchString'));
  }
}
