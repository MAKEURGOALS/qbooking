import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qbooking/constant/image_constant.dart';
import 'package:qbooking/feature/booking/data/data_source/booking_remote_data_source.dart';
import '../../../../constant/colors_constant.dart';
import '../../data/model/response_find_many_booking_model.dart';
import '../widget/box_booking.dart';

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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data?.isEmpty ?? true) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(LottieConstant.waiting),
                        const Text('Waiting For Your Booking')
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return BoxBooking(
                          bookingData: snapshot.data?[index] ??
                              ResponseFindManyBookingModel(),
                        );
                      });
                }
              } else {
                return Text('Something go Wrong $snapshot');
              }
            } else {
              return Text('Something go Wrong $snapshot');
            }
          }),
    );
  }
}
