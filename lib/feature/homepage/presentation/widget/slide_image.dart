import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/favorite/presentation/state/favorite_room_state.dart';
import '../../../../constant/api_path_constant.dart';
import '../../../favorite/service/get_room_service.dart';
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
          setState(() {});
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
                child: IconButton(
                    onPressed: () {context.read<FavoriteRoomState>().saveFavorite(widget.roomData);},
                    icon: Icon(context.read<FavoriteRoomState>().isRoomFavorited(widget.roomData.id ?? "")
                       ? Icons.favorite 
                        : Icons.favorite_border),
                        color: context.read<FavoriteRoomState>().isRoomFavorited(widget.roomData.id ?? "") ? Colors.red : null,
                        iconSize: 30.0,
                        ),
              ),
            ],
          );
        },
      ),
    );
  }
}
