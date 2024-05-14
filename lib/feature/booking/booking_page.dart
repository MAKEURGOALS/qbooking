import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/data_source/booking_remote_data_source.dart';
import '../../constant/colors_constant.dart';
import 'model/response_find_many_booking_model.dart';
import 'presentation/widget/box_booking.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Booking ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3),
            child: Container(
              color: ColorsConstants.borderAppbarColor,
              height: 1,
            )),
      ),
      body: FutureBuilder(
          future: BookingRemoteDataSource().fetchBooking(),
          builder: (context, snapshot) {
            debugPrint("Current : $snapshot");
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return BoxBooking(
                      bookingData:  snapshot.data?[index]?? ResponseFindManyBookingModel() );
                });
          }),
    );
  }
}
