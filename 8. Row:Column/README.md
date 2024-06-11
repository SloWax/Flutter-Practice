# Row/Column

1. Row와 Column의 정렬
2. child 순서 바꾸기

## mainAxisAlignment / crossAxisAlignment
### start
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/4cd0f183-19e7-4368-9fa1-6b18716075fe">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/021bf91e-77c6-4bcd-a9f5-21a09373ea96">
</p>

```
Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```

### center
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/a932438b-f51f-402a-8b45-a63f1650f36c">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/419aaeff-287b-41bb-8bbf-9c0cf873fc1e">
</p>

```
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```

### end
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/3edbf1cf-c3d7-4725-8fa8-82086cf689e0">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/cd9b9517-2193-4337-af1a-01ed4593980c">
</p>

```
Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
)
```

### spaceEvenly
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/5a8d6954-77d8-40ce-9c71-ba813555156e">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/15764f46-b5a8-44a7-be90-6a593d5ab200">
</p>

* child 사이의 공간이 고르게 추가

```
Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```

### spaceBetween
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/d3a37250-0115-4b2d-8879-ed48649e28cc">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/0b572ebf-0f20-4237-984b-a666078381c8">
</p>

* 첫번째, 마지막 외 child에 균일한 여백

```
Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```

### spaceAround
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/67ab5d3b-c5af-434a-9cd7-c071e6f3df40">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/aff82f25-368e-405a-9f47-ac48cfddf81b">
</p>

* 첫번째, 마지막 child 전후에 다른 child 사이에 할당된 공간의 절반만 부여

```
Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```
## VerticalDirection / textDirection
### up
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/36823a93-7485-4bd3-b4c5-34659b4867e5">
</p>

```
Column(
	verticalDirection: VerticalDirection.up,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
)
```

### rtl
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/fa7c01d9-2b88-46ed-9c5d-01d6b9bdca2e">
</p>

```
Row(
   textDirection: TextDirection.rtl,
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   crossAxisAlignment: CrossAxisAlignment.center,
)
```