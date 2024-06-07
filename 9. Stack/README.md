# stack

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/39f885c4-69d6-4379-ae8d-87a6bcfd2937">
</p>

```
Container(
   width: sizeX,
   height: sizeY,
   child: Stack(
      // fit: StackFit.expand,
     children: createBox(5),
   ),
)

List<Widget> createBox(int numBox) {
  int i = 0;
  List<Widget> boxList = [];
  List colors = [
    Colors.amberAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.lightBlue
  ];

  while (i < numBox) {
    Container box = Container(
      color: colors[i % colors.length],
      width: 50 * (numBox.toDouble() - i),
      height: 50 * (numBox.toDouble() - i),
      alignment: Alignment.bottomRight,
      child: Text(i.toString()),
    );

    i++;
    boxList.add(box);
  }

  return boxList;
}
```

### Align 위젯
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/caf39d86-743d-4fe3-b3c4-97a2fd6e000d">
</p>
```
while (i < numBox) {
    Align box = Align(
        alignment: Alignment.bottomRight,
        child: Container(
          color: colors[i % colors.length],
          width: 50 * (numBox.toDouble() - i),
          height: 50 * (numBox.toDouble() - i),
          alignment: Alignment.topLeft,
          child: Text(i.toString()),
        ));

    i++;
    boxList.add(box);
}
```

### Positioned 위젯
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/48dc13b1-32ea-4ed0-83bd-be9c310f90f8">
</p>
```
while (i < numBox) {
    Positioned box = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i % colors.length],
          width: 50 * (numBox.toDouble() - i),
          height: 50 * (numBox.toDouble() - i),
          alignment: Alignment.topLeft,
          child: Text(i.toString()),
        ));

    i++;
    boxList.add(box);
}
```
