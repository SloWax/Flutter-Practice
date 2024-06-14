# 비동기처리

## Future / then

```
void main() {
  mockFileIO();

  var response = mockHttpRequest();
  response.then((result) {
    print('HTTP리퀘스트: response => $result');
    print('HTTP리퀘스트: 종료');

    var query = mockDBQuery(result);
    query.then((result) {
      print('디비 쿼리: $result');
      print('디비 쿼리: 종료');
    });
  });
}

void mockFileIO() {
  print('FILE IO: 시작');
  print('FILE IO: 파일 출력');
  print('FILE IO: 종료');
}

Future<String> mockHttpRequest() {
  print('HTTP리퀘스트: 시작');
  return Future.delayed(Duration(seconds: 3), () => ('철수'));
}

Future<String> mockDBQuery(String searchString) {
  print('디비 쿼리 $searchString: 시작');
  return Future.delayed(
      Duration(seconds: 2), () => ('result => ID:1, name: $searchString'));
}
```

DebugConsol
<p align="left">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/39c00ff3-0eaf-47a1-a3a2-1001a2cd50cd">
</p>

## async / await

```
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
  var response = await mockHttpRequest('1');
  var query = await mockDBQuery(response);
  print('디비 쿼리: $query');
}

Future<String> mockHttpRequest(String id) {
  print('HTTP리퀘스트: 시작');

  return Future.delayed(Duration(seconds: 3), () {
    print('HTTP리퀘스트: response => 철수');
    print('HTTP리퀘스트: 종료');

    return '철수';
  });
}

Future<String> mockDBQuery(String searchString) {
  print('디비 쿼리 $searchString: 시작');
  return Future.delayed(
      Duration(seconds: 2), () => ('result => ID:1, name: $searchString'));
}
```

DebugConsol
<p align="left">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/ca913593-37e4-4497-8f60-fa9e6a16f408">
</p>

## Error

```
void searchName() async {
  try {
    var response = await mockHttpRequest();
    var query = await mockDBQuery(response, isError: true);
    print('디비 쿼리: $query');
  } catch (error) {
    print(error);
  }
}
```

DebugConsol
<p align="left">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/fd41b46c-24d7-4fc2-b789-dcb76c58d7f4">
</p>