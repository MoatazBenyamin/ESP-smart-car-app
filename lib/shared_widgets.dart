import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home_screen_Cubit.dart';

// class parkingPlaces extends StatelessWidget {
//   String ?nameOfPlace;
//    parkingPlaces({super.key,required nameOfPlace,});
//   @override
//   Widget build(BuildContext context) {
//     print(nameOfPlace);
//     return MaterialButton(
//           onPressed: () {
//             if(HomeScreenCubit.get(context).popUpShow)
//             {
//               print('enterd1');
//               HomeScreenCubit.get(context).popUpShow=false;
//               Navigator.pop(context);
//             }
//             else{
//               print('enterd');
//             HomeScreenCubit.get(context).
//             scaffoldKey.
//             currentState?.
//             showBottomSheet(
//               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(50.0),
//                                 ),
//                               ),
//               (context) {
//               // print(nameOfPlace);
//               return Container
//               (
//                 height: 600,
//                 width: 400,
//                 child: Center(
//                   child: Text
//                   (
//                     "$nameOfPlace",
//                     style: TextStyle
//                     (
//                       color: Colors.black,
//                      fontSize: 40 ,
//                      fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               );
//             },).closed.then((onValue)
//             {
//               HomeScreenCubit.get(context).popUpShow=false;
//             });
//           HomeScreenCubit.get(context).popUpShow=true;
//           }
//           },
//           child: Container
//           (
//             child: Image.asset('assets/on.png'),
//           ),
//         );
//         }
//         }
Widget ParkingTexts({
  String namePlace = "",
  double size = 60,
}) =>
    Text(
      '$namePlace',
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    );

Widget parkingPlaces({
  context,
  required nameOfPlace,
  bool flag = true,
  bool tlyeeth = true,
  bool case2 = false,
  index,
}) =>
    Row(
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Text(nameOfPlace,style: TextStyle(color: Colors.white),),
              MaterialButton(

                  padding: EdgeInsets.only(top: 0),
                  onPressed: () {
                  
                    if (HomeScreenCubit.get(context).popUpShow ) {
                    
              
                      HomeScreenCubit.get(context).popUpShow = false;
                      Navigator.pop(context);
                    } else {
                       
              
                      HomeScreenCubit.get(context)
                          .scaffoldKey
                          .currentState
                          ?.showBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50.0),
                              ),
                            ),
                            (context) {
                              // print(nameOfPlace);
                              return Container(
                                height: 350,
                                width: 400,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(40.0),
                                        child: 
                                        HomeScreenCubit.get(context).didParkBefore?
                                        const Text(
                                          "Your car is Parked in ",
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ):
                                        !tlyeeth?
                                        const Text(
                                          "your car will park in :",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ):
                                        const Text(
                                          "You can't park here :",
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        
                                      ),
                                      !HomeScreenCubit.get(context).didParkBefore?
                                      Text(
                                        "${nameOfPlace}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ):
                                      Text(
                                        HomeScreenCubit.get(context).whereYouPark,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          if (case2) {
                                            if(!HomeScreenCubit.get(context).toPark[index])
                                           { 
              
                                                
                                                HomeScreenCubit.get(context).changeState(index);
                                                
                                                
                                                HomeScreenCubit.get(context).popUpShow =
                                                false;
                                            Navigator.pop(context);
                                          }
                                            
                                          }
                                        },
                                        child: 
                                        !tlyeeth&&!HomeScreenCubit.get(context).didParkBefore?
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.amber),
                                          child: Center(
                                              child: Text(
                                            "confirm",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ): Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white60),
                                          child: Center(
                                              child: Text(
                                            "occupied",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                          .closed
                          .then((onValue) {
                            HomeScreenCubit.get(context).popUpShow = false;
                          });
                      HomeScreenCubit.get(context).popUpShow = true;
                    }
                  },
                  child: tlyeeth
                      ? Container(
                          width: 40,
                          height: 70,
                          child: Image.asset('assets/off.png'),
                        )
                      : Container(
                          width: 40,
                          height: 70,
                          child: Image.asset('assets/on.png'),
                        )),
            ],
          ),
        ),
        flag
            ? Container(
                width: 10,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.grey)),
              )
            : SizedBox()
      ],
    );

class parkingComponent extends StatelessWidget {
  String? name;
  parkingComponent({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: ParkingArrows(
                width: 40,
                height: 180,
                dir: Axis.vertical,
                divider: false,
                num: 8,
                icon: Icons.arrow_upward,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParkingArrows(
              width: 300,
              height: 40,
              dir: Axis.horizontal,
              divider: true,
              num: 12,
              icon: Icons.arrow_back,
            ),
            ParkingArrows(
              width: 300,
              height: 40,
              dir: Axis.horizontal,
              divider: true,
              num: 12,
              icon: Icons.arrow_forward,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 30,
                      ),
                      ParkingTexts(namePlace: '$name', size: 20),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  // width: 280,
                  height: 100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return parkingPlaces(
                            context: context,
                            nameOfPlace: '$name ${index + 1}');
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 5,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ],
        ),
        ParkingArrows(
          dir: Axis.vertical,
          icon: Icons.arrow_upward,
          num: 8,
          divider: false,
          width: 38,
          height: 180,
        )
      ],
    );
  }
}

Widget ParkingArrows(
        {int num = 0,
        IconData? icon,
        bool divider = true,
        Axis dir = Axis.horizontal,
        double height = 0,
        double width = double.infinity}) =>
    SizedBox(
      width: width,
      height: height,
      child: ListView.separated(
          reverse: true,
          scrollDirection: dir,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
          
            if (index == 0) HomeScreenCubit.get(context).counter = 1;
            if (index != HomeScreenCubit.get(context).counter * 3) {
              if (divider) {
             
                return const SizedBox(
                  width: 20,
                  child: Divider(
                    color: Colors.white,
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: const Text(
                    "|",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }
            } else {
              HomeScreenCubit.get(context).counter++;
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              );
            }
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
          itemCount: num),
    );
