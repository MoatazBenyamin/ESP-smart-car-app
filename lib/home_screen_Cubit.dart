import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_Screen_state.dart';
import 'package:flutter_application_1/model/smart_car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(InitialHomeScreenState());
  static HomeScreenCubit get(context) => BlocProvider.of(context);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool popUpShow = false;
  String nameOfPlace = '';
  int counter = 1;
  bool didParkBefore = false;
  SmartCarModel smart_car_model =
      SmartCarModel(find: "",A2RedIr: 1, A3GreenIr: 2, A5BlueIr: 3,returnir: 0,nearestir: 0);
  String whereYouPark = '';
  List<bool> toPark = [];
  int saveWhereNum=0;
  void TakeName(name) {
    nameOfPlace = name;
    emit(TakeNameState());
  }

  Future<void> changeState(parkHere) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    // saveWhereNum=parkHere;
    switch (parkHere) {
      case 5:
      {
        await ref.update({'return':1});
        break;
      }
      case 6:
      {
        await ref.update({'nearest':1});
        break;
      }
      case 1:
        {
          
         
            print('change');
            await ref.update({'red':1});
            await ref.update({'find':"A2"});

          
          break;
        }
      case 4:
        {
          
         
            await ref.update({'blue':1});
            await ref.update({'find':"A5"});
         
          break;
        }
      case 2:
        {
        
            await ref.update({'green':1});
            await ref.update({'find':"A3"});
          
          
          break;
        }
    }

    emit(changeStates());
  }

  bool sendState(index) {
    this.toPark = [
      true,
      smart_car_model.red,
      smart_car_model.green,
      true,
      smart_car_model.blue,
    ];
    // emit(changeStates());
    return this.toPark[index];
  }

  Future<void> getData() async {
    final ref = await FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('/').get();
    if (snapshot.exists) {
      smart_car_model = await SmartCarModel.fromJson(Map<String, dynamic>.from(
          await snapshot.value! as Map<Object?, Object?>));
    } else {}
    smart_car_model.turnToFlag();
    
  
      if(smart_car_model.find=='A2'&&smart_car_model.red) 
      {
        saveWhereNum=1;
      whereYouPark = 'A2';
      didParkBefore = true;
      
      }
      else if(smart_car_model.find=='A2'&&smart_car_model.blue) 
      {
        saveWhereNum=2;
      whereYouPark = 'A3';
      didParkBefore = true;

      }
      else if(smart_car_model.find=='A2'&&smart_car_model.green) 
      {
        saveWhereNum=4;
      whereYouPark = 'A5';
      didParkBefore = true;
   
      }
    
    // if (smart_car_model.red) {
    //   saveWhereNum=1;
    //   whereYouPark = 'A2';
    //   didParkBefore = true;
    // } else if (smart_car_model.blue) {
    //   saveWhereNum=2;
    //   whereYouPark = 'A3';
    //   didParkBefore = true;
    // } else if (smart_car_model.green) {
    //   saveWhereNum=4;
    //   whereYouPark = 'A5';
    //   didParkBefore = true;
    // }
    emit(getDataState());
  }
  

  Future<void> autePark() async {
    
    emit(waitingForParkState());
    await Future.delayed(const Duration(seconds: 7));
    await getData();
    emit(conformaitionParkState());
  }

Future<void> rest()
async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
  await ref.update({'red':0});
  await ref.update({'nearest':0});
  await ref.update({'green':0});
  await ref.update({'blue':0});
  await ref.update({'return':0});
}

}
