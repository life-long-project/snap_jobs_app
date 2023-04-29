
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../Chat_Feature/Presentation/UI/Screens/Chat_screen.dart';
// import '../../../../Jobs_feature/Presentation/UI/Screens/jobs_screen.dart';
// import '../../../../Profile_feature/Presentation/UI/Screens/profile_screen.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());

//   int currentIndex = 0;

//   List<BottomNavigationBarItem> bottomItems = [
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: 'jobs'),
//     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_balance), label: 'profile'),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.settings,
//       ),
//       label: 'Settings',
//     ),
//   ];

//   List<Widget> screens = [const JobsScreen(), const ChatScreen(), const Profile()];
//   void changeBottomNavBar(int index) {
//     currentIndex = index;
//     if (index == 1) {
//       emit(ChangeBottomNavBarState());
//       //navigate to page

//     }
//    // if (index == 2) {}
//     //  Offstage(
//     //     offstage: index != 0,
//     //     child:  TickerMode(
//     //       enabled: index == 0,
//     //       //child:  const MaterialApp(home: JobsScreen()),
//     //     ));
//   }
// }
