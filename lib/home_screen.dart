import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home_Screen_state.dart';
import 'package:flutter_application_1/home_screen_Cubit.dart';
import 'package:flutter_application_1/shared_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_PageMap extends StatelessWidget {
  const Home_PageMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // if(state is TakeNameState||state is InitialHomeScreenState);
          return Scaffold(
            key: HomeScreenCubit.get(context).scaffoldKey,
            appBar: AppBar(
              title: const Text('Smart car'),
            ),
            backgroundColor: Colors.black,
            body: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 10)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 10)),
                                  ),
                                  SizedBox(
                                    width: 320,
                                    height: 80,
                                    child: ListView.separated(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                         
                                          return parkingPlaces(context: context,
                                              nameOfPlace: 'F ${index+1}');
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(),
                                        itemCount: 3),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 20,
                                              child: Divider(
                                                color: Colors.white,
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 12),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 80,
                                    child: ListView.separated(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          
                                          return parkingPlaces(context: context,
                                              nameOfPlace: 'E ${index+1}');
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(),
                                        itemCount: 2),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      ParkingTexts(namePlace: 'E', size: 25),
                                      Container(
                                        width: 50,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 10)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 7),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 20,
                                              child: Divider(
                                                color: Colors.white,
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 12),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 80,
                                    child: ListView.separated(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return parkingPlaces(
                                            context: context,
                                              nameOfPlace: 'D ${index+1}');
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(),
                                        itemCount: 2),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      ParkingTexts(namePlace: 'D', size: 25),
                                      Container(
                                        width: 50,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 10)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 7),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 20,
                                              child: Divider(
                                                color: Colors.white,
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 12),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 80,
                                    child: ListView.separated(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return parkingPlaces(
                                            context: context,
                                              nameOfPlace: 'C ${index+1}');
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(),
                                        itemCount: 2),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      ParkingTexts(namePlace: 'C', size: 25),
                                      Container(
                                        width: 50,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 10)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 7),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 20,
                                              child: Divider(
                                                color: Colors.white,
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 12),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 80,
                                    child: ListView.separated(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return parkingPlaces(
                                            context: context,
                                              nameOfPlace: 'B ${index+1}');
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(),
                                        itemCount: 2),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      ParkingTexts(namePlace: 'B', size: 25),
                                      Container(
                                        width: 50,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 10)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: 7),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 170,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 44,
                                    ),
                                    ParkingTexts(namePlace: 'F'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: ListView.separated(
                                  reverse: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        parkingPlaces(
                                          context: context,
                                          nameOfPlace: 'A ${index+1}',
                                        ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: 8),
                              ),
                              Container(
                                width: 105,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.arrow_upward_rounded,
                                      color: Colors.white,
                                      size: 44,
                                    ),
                                    ParkingTexts(namePlace: 'A'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
