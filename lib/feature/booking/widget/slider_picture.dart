import 'package:flutter/material.dart';

class SliderPicture extends StatefulWidget {
  const SliderPicture({Key? key}) : super(key: key);

  @override
  State<SliderPicture> createState() => _SliderPictureState();
}

class _SliderPictureState extends State<SliderPicture>
    with TickerProviderStateMixin {
  final List<String> myPicture = [
    'assets/images/meeting.jpg',
    'assets/images/meeting2.jpg',
    'assets/images/meeting3.jpg',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: myPicture.length,
              physics: const BouncingScrollPhysics(),
              controller: PageController(initialPage: 0, viewportFraction: 1.0),
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      myPicture[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          TabPageSelector(
            selectedColor: Colors.black,
            color: Colors.grey,
            controller: TabController(
              length: myPicture.length,
              initialIndex: currentIndex,
              vsync: this,
            ),
          ),
        ],
      ),
    );
  }
}
