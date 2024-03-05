import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constant/api_path_constant.dart';
import '../../../constant/image_path_constant.dart';
import '../model/room_model_one_model.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({super.key, required this.roomData});
  final RoomModel roomData;

  @override
  State<SlideImage> createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> with TickerProviderStateMixin {
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
          currentIndex = value;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: '${ApiPathConstant.baseURL}${ImagePathConstant.room}${widget.roomData.images?[index]}',
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Center(
                  child: TabPageSelector(
                    selectedColor: Colors.black,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    controller: TabController(
                      length: widget.roomData.images?.length ?? 0,
                      initialIndex: currentIndex,
                      vsync: this,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

