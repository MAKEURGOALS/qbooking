import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/data/model/response_create_booking_model.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';


import '../../../homepage/presentation/widget/slide_image.dart';
import '../../data/model/response_find_many_booking_model.dart';
import '../screen/edit_booking_page.dart';

class BoxBooking extends StatefulWidget {
  const BoxBooking(
      {super.key, required this.bookingData});
  final ResponseFindManyBookingModel bookingData;




  @override
  State<BoxBooking> createState() => _BoxBookingState();
}

class _BoxBookingState extends State<BoxBooking> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  EditBookingPage(bookingData: widget.bookingData))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            child: Column(
              children: [
                SlideImage(images: widget.bookingData.roomId?.images ?? []),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.bookingData.roomName ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color:
                                    widget.bookingData.roomId?.isActiveStatus !=
                                            false
                                        ? Colors.green
                                        : Colors.red,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.bookingData.roomId?.isActiveStatus !=
                                        false
                                    ? 'available now'
                                    : 'Unavailable now',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: widget.bookingData.roomId
                                              ?.isActiveStatus !=
                                          false
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.bookingData.roomId?.typeRoom ?? "",
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Floor ${widget.bookingData.roomId?.floor}')
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.bookingData.roomId?.description ?? "",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          const Icon(Icons.star_border_sharp),
                          const Text("3.5")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
