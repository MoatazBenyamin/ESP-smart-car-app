import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_Screen_state.dart';
import 'package:flutter_application_1/home_screen_Cubit.dart';
import 'package:flutter_application_1/shared_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenCubit()..getData(),
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is conformaitionParkState||state is getDataState||state is changeStates){
            return Stack(
              children: [
                Scaffold(
                  floatingActionButton: FloatingActionButton
                  (
                
                    onPressed: () {
                
                      if (HomeScreenCubit.get(context).popUpShow ) {
                    
                
                      HomeScreenCubit.get(context).popUpShow = false;
                      Navigator.pop(context);
                    } 
                    else
                    {
                      HomeScreenCubit.get(context)
                          .scaffoldKey
                          .currentState
                          ?.showBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50.0),
                              ),
                            ),
                            (context) 
                            {
                              return Container
                              (
                                height: 250,
                                width: 400,
                                child:  Padding(
                                  padding: EdgeInsets.all(35.0),
                                  child: 
                                  !HomeScreenCubit.get(context).didParkBefore?
                                  Column
                                  (
                                    children: 
                                    [
                                      Text("we will find nearest place",
                                      style: TextStyle(
                                        color: Colors.amber,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                      ),
                                      Text(" for your car",
                                      style: TextStyle(
                                        color: Colors.amber,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                      ),
                                      MaterialButton
                                      (
                                        onPressed: () async {

                                          await HomeScreenCubit.get(context).changeState(6);
                                          HomeScreenCubit.get(context).autePark();
                                          HomeScreenCubit.get(context).popUpShow = false;
                                          
                                          
                                        },
                                        child:Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container
                                          (
                                            height: 50,
                                            width: 100,
                                            child: Center(child: Text("park",style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),)),
                                            decoration: BoxDecoration
                                            (
                                              borderRadius: BorderRadius.circular(25),
                                              color: const Color.fromARGB(255, 9, 100, 175)
                                            ),
                                          ),
                                        ) ,
                                        
                                      )
                                    ],
                                    ):
                                  Column
                                  (
                                    children: 
                                    [
                                      Text("Your car will come back",
                                      style: TextStyle(
                                        color: Colors.amber,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                      ),
                                      Text(" for you",
                                      style: TextStyle(
                                        color: Colors.amber,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                      ),
                                      MaterialButton
                                      (
                                        onPressed: () {
                                          HomeScreenCubit.get(context).didParkBefore=false;
                                          HomeScreenCubit.get(context).changeState(5);
                                           HomeScreenCubit.get(context).popUpShow =
                                                false;
                                            Navigator.pop(context);
                                        },
                                        child:Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container
                                          (
                                            height: 50,
                                            width: 100,
                                            child: Center(child: Text("return",style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),)),
                                            decoration: BoxDecoration
                                            (
                                              borderRadius: BorderRadius.circular(25),
                                              color: const Color.fromARGB(255, 9, 100, 175)
                                            ),
                                          ),
                                        ) ,
                                        
                                      )
                                    ],
                                    ),
                                ),
                              );
                            }).closed
                          .then((onValue) {
                            HomeScreenCubit.get(context).popUpShow = false;
                          });
                      HomeScreenCubit.get(context).popUpShow = true;;
                    }
                    },
                    
                    tooltip:!HomeScreenCubit.get(context).didParkBefore?
                     'park your car':'return your car',
                    child: 
                    !HomeScreenCubit.get(context).didParkBefore?
                    const Icon(Icons.local_parking):const Icon(Icons.car_rental_outlined)
                  ),
                  key: HomeScreenCubit.get(context).scaffoldKey,
                  backgroundColor: Colors.black,
                  // appBar: AppBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          
                          children: [
                
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset("assets/exit.png",)),
                                ParkingArrows(
                                  width: 40,
                                  height: 140,
                                  dir: Axis.vertical,
                                  divider: false,
                                  num: 8,
                                  icon: Icons.arrow_upward,
                                ),
                              ],
                            ),
                            Container
                            (
                              width: 5,
                              height: 180,
                              decoration: BoxDecoration
                              (
                
                                border: Border.all(width: 5,color: Colors.grey),
                              ),
                            ),
                            Column(
                              children: [
                                Container
                            (
                              width: 340,
                              height: 60,
                              decoration: BoxDecoration
                              (
                
                                border: Border.all(width: 50,color: Colors.grey),
                              ),
                            ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    // width: 280,
                                    height: 100,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                           bool flag=true;
                                              if(index==4)
                                              flag=false;
                                          return parkingPlaces(
                                              context: context,
                                              nameOfPlace: 'D ${index + 1}',
                                              flag: flag);
                                        },
                                        separatorBuilder: (context, index) => SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        parkingComponent(name: 'D'),
                        parkingComponent(name: 'B'),
                        parkingComponent(name: 'C'),
                        
                         Row(
                           children: [
                              Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( right:2),
                                child: ParkingArrows
                                                  (
                                                    width: 34,
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
                               children: [
                                          ParkingArrows
                                               (
                                                 width: 300,
                                                 height: 40,
                                                 dir: Axis.horizontal,
                                                 divider: true,
                                                 num: 12,
                                                 icon: Icons.arrow_back,
                                               ),
                                   ParkingArrows
                                               (
                                                 width: 300,
                                                 height: 40,
                                                 dir: Axis.horizontal,
                                                 divider: true,
                                                 num: 12,
                                                 icon: Icons.arrow_forward,
                                               ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                        Container(
                                            width: 45,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 10)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                const Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                ParkingTexts(namePlace: 'A', size: 20),
                                              ],
                                            ),
                                          ),
                                     Align(
                                       
                                       alignment: Alignment.bottomRight,
                                       child: SizedBox(
                                         // width: 280,
                                         height: 100,
                                         child: ListView.separated(
                                             shrinkWrap: true,
                                             scrollDirection: Axis.horizontal,
                                             physics: NeverScrollableScrollPhysics(),
                                             itemBuilder: (context, index) {
                                               bool flag=true;
                                               if(index==4)
                                               flag=false;
                                               return parkingPlaces(
                                                index: index,
                                                   context: context,
                                                   nameOfPlace: 'A ${index + 1}'
                                                   ,flag: flag,
                                                   case2: true,
                                                   tlyeeth: HomeScreenCubit.get(context).sendState(index),
                                                   );
                                             },
                                             separatorBuilder: (context, index) => SizedBox(
                                                   width: 5,
                                                 ),
                                             itemCount: 5),
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ],
                         ),
                        Stack(
                          children: [
                            
                            Image.asset('assets/Enter.png'),
                            Positioned(
                            left: 100,
                            bottom: 0,
                              child: MaterialButton(onPressed: () {
                                HomeScreenCubit.get(context).rest();
                              },
                                                         child:  Container(
                                            width: 150,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.amber),
                                            child: Center(
                                                child: Text(
                                              "Reset",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          )
                              ),
                            )
                          ],
                        ),
                        
                        
                
                       
                      // const Positioned(left: 0,bottom: 0, child: IconButton(style: ButtonStyle(backgroundColor:Co),color: Colors.white,iconSize: 40,tooltip: 'Refresh',onPressed: (){}, icon:Icon(Icons.refresh)))
                      ],
                    ),
                  ),
                ),
               Positioned(
                      left: 15,
                      bottom: 15,
                      child: FloatingActionButton
                      (
                        
                        onPressed: ()
                        {
                          HomeScreenCubit.get(context).getData();
                        },
                        child: Icon(Icons.refresh_outlined),
                      ),
                    )
              ],
            );
          }
          else
          {
            print(state);
            return Scaffold(
              body: Center(
              
                    child:Container(
                      width: 480,
                      height: 1000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                                    Text('please wait....',
                                    style: TextStyle(
                                        color: Colors.amber,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:10.0,left: 20,right: 10),
                                      child: const Text('Searching for place to park your car',
                                      style: TextStyle(
                                          color: Colors.amber,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:25.0),
                                      child: LoadingAnimationWidget.staggeredDotsWave( // LoadingAnimationwidget that call the 
                                                              color: Colors.green,                          // staggereddotwave animation
                                                              size: 80,
                                                            ),
                                    ),
                          ],
                        ),
                    ), 
                    
                  ),
            );
          }
          },
          
        ));
  }
}
