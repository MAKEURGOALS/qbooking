import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/model/room_model_one_model.dart';

class RoomImage extends StatefulWidget {
  const RoomImage({super.key, required this.roomData});
  final RoomModel roomData;

  @override
  State<RoomImage> createState() => _RoomImageState();
}

class _RoomImageState extends State<RoomImage> with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: PageView.builder(
        itemCount: widget.roomData.images?.length ?? 0,
        physics: const BouncingScrollPhysics(),
        controller: PageController(initialPage: 0, viewportFraction: 1.0),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          final imageUrl = widget.roomData.images?[index];
          if (imageUrl == null) {
            return const Center(
              child: Text('No image available'),
            );
          }

          return Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50.0,
                        ),
                        Text(
                          "Failed to load network image",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
