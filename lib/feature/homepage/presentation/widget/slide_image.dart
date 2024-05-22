import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../constant/api_path_constant.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({super.key, required this.images});
  final List<String> images;

  @override
  State<SlideImage> createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> with TickerProviderStateMixin {
  int currentIndex = 0;

  // Check if the URL is correct

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: widget.images.length,
        physics: const BouncingScrollPhysics(),
        controller: PageController(initialPage: 0, viewportFraction: 1.0),
        onPageChanged: (value) {
          currentIndex = value;
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
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
                        Text("Failed to load network image",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  imageUrl:
                      '${ApiPathConstant.baseURL}${ApiPathConstant.roomPicture}${widget.images[index]}',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              // Positioned(
              //   bottom: 15,
              //   left: 0,
              //   right: 0,
              //   child: Center(
              //     child: TabPageSelector(
              //       selectedColor: Colors.black,
              //       color: const Color.fromARGB(255, 255, 255, 255),
              //       controller: TabController(
              //         length: widget.images.length ,
              //         initialIndex: currentIndex,
              //         vsync: this,
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: 8,
              //   right: 8,
              //   child: Consumer<FavoriteRoomState>(
              //     builder: (context, state, child) {
              //       return IconButton(
              //         onPressed: () {
              //           state.saveFavorite(widget.roomData);
              //         },
              //         icon: Icon(
              //           state.isRoomFavorited(widget.roomData.id ?? "")
              //               ? Icons.favorite
              //               : Icons.favorite_border,
              //           size: 30,
              //         ),
              //         color: state.isRoomFavorited(widget.roomData.id ?? "")
              //             ? Colors.red
              //             : null,
              //       );
              //     },
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
