import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/data/model/response_find_many_booking_model.dart';

class BookingPicture extends StatefulWidget {
  const BookingPicture({Key? key, required this.roomData}) : super(key: key);
  final RoomId roomData;

  @override
  State<BookingPicture> createState() => _BookingPictureState();
}

class _BookingPictureState extends State<BookingPicture>
    with TickerProviderStateMixin {
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
              itemCount: widget.roomData.images?.length ?? 0,
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
                    child: Image.network(
                      widget.roomData.images?[index] ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        //Return a widget to display in case of an error
                        return const Center(
                            child: Text('Failed to load image'));
                      },
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
              length: widget.roomData.images?.length ?? 0,
              initialIndex: currentIndex,
              vsync: this,
            ),
          ),
        ],
      ),
    );
  }
}
