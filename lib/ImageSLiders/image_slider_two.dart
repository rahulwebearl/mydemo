import 'package:flutter/material.dart';
import 'package:card_slider/card_slider.dart';

class Card_slider_page extends StatefulWidget {
  const Card_slider_page({super.key});

  @override
  State<Card_slider_page> createState() => _Card_slider_pageState();
}

class _Card_slider_pageState extends State<Card_slider_page> {
  @override
  Widget build(BuildContext context) {
    // List<Color> valuesDataColors = [
    //   Colors.purple,
    //   Colors.yellow,
    //   Colors.green,
    //   Colors.red,
    //   Colors.grey,
    //   Colors.blue,
    // ];

    // List<Widget> valuesWidget = [];
    // for (int i = 0; i < valuesDataColors.length; i++) {
    //   valuesWidget.add(Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(12.0),
    //         color: valuesDataColors[i],
    //       ),
    //       child: Align(
    //         alignment: Alignment.center,
    //         child: Text(
    //           i.toString(),
    //           style: const TextStyle(
    //             fontSize: 28,
    //           ),
    //         ),
    //       )));
    // }

    List<Widget> valuesWidget = [];

    List<String> valuesUrl = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Shaqi_jrvej.jpg/1200px-Shaqi_jrvej.jpg',
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKeNXBTBw-79ERDcB335zIN_U0HBq5cMsXmjMf28APJckidqTficSWy-EdpqSFS1eOZRE'
    ];

    for (int i = 0; i < valuesUrl.length; i++) {
      valuesWidget.add(
        Image.network(valuesUrl[i]),
      );
    }

    // return Scaffold(
    //   backgroundColor: const Color(0xFF1560BD),
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     title: const Text(
    //       "Cards",
    //       style: TextStyle(
    //           fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: CardSlider(
    //     cards: valuesWidget,
    //     bottomOffset: .0003,
    //     cardHeight: 0.75,
    //     containerHeight: MediaQuery.of(context).size.height - 100,
    //     itemDotOffset: -0.05,
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Gallery",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF33a000)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF33a000),
          ),
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: CardSlider(
        cards: valuesWidget,
        bottomOffset: .0008,
        itemDotWidth: 14,
        itemDotOffset: 0.15,
        itemDot: (itemDotWidth) {
          return Container(
              margin: const EdgeInsets.all(5),
              width: 8 + itemDotWidth,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF33a000),
              ));
        },
      ),
    );
  }
}
