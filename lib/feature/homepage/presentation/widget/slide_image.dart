import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/favorite/presentation/state/favorite_room_state.dart';
import '../../../../constant/api_path_constant.dart';
import '../../data/model/room_model_one_model.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({super.key, required this.roomData});
  final RoomModel roomData;

  @override
  State<SlideImage> createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> with TickerProviderStateMixin {
  int currentIndex = 0;

  // Check if the URL is correct

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
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
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
                      '${ApiPathConstant.baseURL}${ApiPathConstant.roomPicture}${widget.roomData.images?[index]}',
                  fit: BoxFit.cover,
                  width: double.infinity,
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
              Positioned(
                top: 8,
                right: 8,
                child: Consumer<FavoriteRoomState>(
                  builder: (context, state, child) {
                    return IconButton(
                      onPressed: () {
                        state.saveFavorite(widget.roomData);
                      },
                      icon: Icon(
                        state.isRoomFavorited(widget.roomData.id ?? "")
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 30,
                      ),
                      color: state.isRoomFavorited(widget.roomData.id ?? "")
                          ? Colors.red
                          : null,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
