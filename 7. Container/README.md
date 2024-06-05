# container

1. 컨테이너 변화 살펴보기
2. 컨테이너(Container) 크기 규칙

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/2a94262e-cfd1-4aec-9c8d-f4b3087a6353">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/94b3e73f-6159-42e7-b01d-1610c2f9ee81">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/b525e63e-8b8a-40c3-9962-8a4bc5db25e3">
</p>

- 별도의 크기 설정이 없다면, child를 가지는 Container의 크기는 child에 맞게 크기가 조정
- 위의 예로 Text를 child 추가했을 때 컨테이너의 크기는 Text의 크기만큼 변경
- children이 없는 Container는 부모가 크기에 제한이 있는 제약조건을 제공할 때 가능한 커지도록 시도
- children이 없는 Container는 부모가 크기에 제한이 없는(무한대) 제약조건을 제공할 때 가능한 작아지려고 시도

# margin
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/f23d3a28-b337-4cb2-942a-6d9bac01595f">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/17223b78-54d8-4988-8ece-d6e1c5e4d732">
</p>

## EdgeInsets.all
- EdgeInsets 클래스는 마진 또는 패딩에 대한 오프셋을 지정하는데 사용 네 면 모두에 오프셋을 만듦
```
margin: EdgeInsets.all(50)
```

## EdgeInsets.only
- 구체적인 마진은 only 생성자를 사용
-  ex) 왼쪽에 100픽셀의 마진을 만들고 싶다면 
```
EdgeInsets.only(left: 100.0)
```

## EdgeInsets.symmetric
- 수직(vertical) 및 수평(horizontal)으로 offset을 만들 때 사용
ex)```
EdgeInsets.symmetric(vertial: 20.0)
```

# BoxDecoration

## shape

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/64d69f65-7715-460d-8cfd-90b8a113d15f">
</p>

```
decoration: const BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
                )
```

## borderRadius

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/a4824491-b4f2-4d21-bce3-5363a9818e91">
</p>

```
borderRadius: BorderRadius.all(Radius.circular(30))
```

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/5941a9da-aa16-4c70-95d5-873bce9b8b1c">
</p>
 

```
borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(30)
          )
```
# Gradient

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/faa5f593-54d8-4298-bc9a-b2012549092b">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/4c05d82b-b0fc-443c-857c-417d0d8ff0f8">
</p>



```
class _gradient extends StatelessWidget {
  const _gradient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient',
      home: Scaffold(
          appBar: AppBar(title: const Text('Container Layout')),
          body: Container(
            margin: const EdgeInsets.all(50),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blueGrey, Colors.white])),
          )),
    );
  }
}
```

# DecorationImage, NetworkImage

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/940f0194-f46e-45e9-a2e6-58a7a47db40a">
</p>

```
class _image extends StatelessWidget {
  const _image({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      home: Scaffold(
          appBar: AppBar(title: const Text('Container Layout')),
          body: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://openclipart.org/image/800px/247485'),
                        fit: BoxFit.contain)),
              ))),
    );
  }
}
```
## BoxFit.contain
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/83d3b6e8-0628-4e2a-af81-4237c5b62ceb">
</p>

```
image: DecorationImage(fit: BoxFit.contain)
```

## BoxFit.cover
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/ee91dd7d-d1cb-4bfc-a610-64fda5fd7a98">
</p>

```
image: DecorationImage(fit: BoxFit.cover)
```

## BoxFit.fill
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/7f12ebe3-b6d5-446b-bf76-bdbb5c1b5b5c">
</p>

```
image: DecorationImage(fit: BoxFit.fill)
```

## ImageRepeat
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/6c87678e-a014-4223-ab25-0aa4b320a0a5">
</p>
```
image: DecorationImage(repeat: ImageRepeat.repeat)
```