// import '../model/room_model.dart';

// class RoomData {
//   static List<RoomModel> allRoom = [
//     RoomModel(
//         id: "1",
//         name: "IQURI",
//         subDescription: "Meeting room 204",
//         description:
//             "This room is equipped with all the necessary equipment for lectures, meetings and negotiations",
//         rate: 4.96,
//         floor: "floor2",
//         isAvailable: true,
//         images: ["assets/images/meeting.jpg"]),
//         RoomModel(
//           id: "2",
//         name: "IQURI",
//         subDescription: "Meeting room 205",
//         description:
//             "This room is equipped with all the necessary equipment for lectures, meetings and negotiations",
//         rate: 4.96,
//         floor: "floor2",
//         isAvailable: true,
//         images: ["assets/images/meeting2.jpg"]
//         ),
//         RoomModel(
//           id: "3",
//         name: "IQURI",
//         subDescription: "Meeting room 206",
//         description:
//             "This room is equipped with all the necessary equipment for lectures, meetings and negotiations",
//         rate: 4.96,
//         floor: "floor2",
//         isAvailable: false,
//         images: ["assets/images/meeting2.jpg"]
//         ),
//         RoomModel(
//           id: "4",
//         name: "IQURI",
//         subDescription: "Meeting room 207",
//         description:
//             "This room is equipped with all the necessary equipment for lectures, meetings and negotiations",
//         rate: 3.54,
//         floor: "floor2",
//         isAvailable: false,
//         images: ["assets/images/meeting2.jpg"]
//         ),
//         RoomModel(
//           id: "5",
//         name: "IQURI",
//         subDescription: "Meeting room 204",
//         description:
//             "This room is equipped with all the necessary equipment for lectures, meetings and negotiations",
//         rate: 3.96,
//         floor: "floor2",
//         isAvailable: true,
//         images: ["assets/images/meeting3.jpg"]
//         ),
//   ];

//   List<RoomModel> getAvailableRoom(){
//     final allRooms = allRoom;
//     final  List<RoomModel> availableRoom = [] ;
//     for (int i = 0; i < allRooms.length; i++){
//       if (allRooms[i].isAvailable == true){
//         availableRoom.addAll([allRooms[i]]);
//       }
//     }
//     return availableRoom;
//   }
// }
