// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore, unnecessary_null_comparison, prefer_const_constructors, unused_local_variable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning2/companete/custom_icon_button.dart';
import 'package:e_leaning2/companete/indicator.dart';
import 'package:e_leaning2/course/course.dart';
import 'package:e_leaning2/radius_and_padding_utility/padding_utiliy.dart';
import 'package:e_leaning2/screens/home_screen/widgets/course_card.dart';
import 'package:e_leaning2/screens/home_screen/widgets/custom_card.dart';
import 'package:e_leaning2/screens/home_screen/widgets/search_bar.dart';
import 'package:e_leaning2/screens/home_screen/widgets/welcome_and_notification.dart';
import 'package:e_leaning2/service/auth.dart';
import 'package:e_leaning2/service/service.dart';

import 'package:e_leaning2/user_info/get_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../image_and_icon_path/icon_path.dart';
import '../../radius_and_padding_utility/radius_utility.dart';
import '../log_in_screen/log_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Service _service = Service();
  final AuthService _authService = AuthService();
  Future<List<Course>>? employeeList;
  List<Course>? retrievedEmployeeList;
  String? currentEmail;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _initRetrieval().then((result) {
      setState(() {});
    });
    _initCurrentEmail();
  }

  Future<void> _initRetrieval() async {
    employeeList = _service.retrieveEmployees();
    retrievedEmployeeList = await _service.retrieveEmployees();
  }

  Future<void> _initCurrentEmail() async {
    currentEmail = FirebaseAuth.instance.currentUser?.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    UserGetData userget = UserGetData();
    userget.dataGet();

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: SVGIcon.drawer.value(),
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingUtiliy.horizontalPadding,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              WelcomeAndNotification(
                title: userget.userData.userName ?? "Kullanıcı adi Yok",
              ),
              const SizedBox(
                height: 16,
              ),
              const SearchBar(),
              const SizedBox(
                height: 16,
              ),
              const CustomCard(),
              const SizedBox(
                height: 16,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: CoursesListWidget(
                  employeeList: employeeList,
                  retrievedEmployeeList: retrievedEmployeeList,
                  currentEmail: currentEmail ?? "Email not found",
                  courseInProgress: true,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: CoursesListWidget(
                  courseInProgress: false,
                  employeeList: employeeList,
                  retrievedEmployeeList: retrievedEmployeeList,
                  currentEmail: currentEmail ?? "Email not found",
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          CustomListTile(
            onTap: (() {
              _authService.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LogInScreen())));
            }),
            // onTap: _authService.signOut().then((value) => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const LogInScreen()))),
            title: "Exit",
            icon: Icon(Icons.exit_to_app_outlined),
            colors: Colors.lightBlueAccent,
          ),
        ]),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.colors,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final Icon icon;
  final Color colors;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        trailing: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: RadiusUtility.defaultRaidus,
              color: colors,
            ),
            child: icon),
        title: Text(title));
  }
}

class CoursesListWidget extends StatefulWidget {
  const CoursesListWidget({
    Key? key,
    required this.employeeList,
    required this.retrievedEmployeeList,
    required this.currentEmail,
    required this.courseInProgress,
  }) : super(key: key);

  final Future<List<Course>>? employeeList;
  final List<Course>? retrievedEmployeeList;
  final String currentEmail;
  final bool courseInProgress;

  @override
  State<CoursesListWidget> createState() => _CoursesListWidgetState();
}

class _CoursesListWidgetState extends State<CoursesListWidget> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Course').snapshots();
  @override
  Widget build(BuildContext context) {
    int number = 0, control = 0;
    return StreamBuilder<QuerySnapshot>(
        // future: widget.employeeList,
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Indicator();
          }
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.courseInProgress
                      ? "Course in progress"
                      : "Available courses",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // _isHasUser(index);
                    // ignore: prefer_typing_uninitialized_variables
                    var isHasUser; // kullanı bu kursu satın aldımı kontrol
                    isHasUser = _isHasUser(index, isHasUser);
                    if (widget.courseInProgress) {
                      if (isHasUser) {
                        number = number + 1;
                        return CourseCard(
                          isHas: isHasUser,
                          course: widget.retrievedEmployeeList![index],
                        );
                      } else if (number == 0) {
                        control = control + 1;
                        if (control == 1) {
                          return Container(
                              width: 355,
                              height: 82,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: ColorsSelection.borderColor.value()),
                                color: Colors.white,
                                borderRadius: RadiusUtility.defaultRaidus,
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                "Buy a course and start now",
                                style: Theme.of(context).textTheme.bodyText1,
                              )));
                        } else {
                          return SizedBox.shrink();
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      if (!isHasUser) {
                        return CourseCard(
                          isHas: isHasUser,
                          course: widget.retrievedEmployeeList![index],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: widget.retrievedEmployeeList!.length),
            ],
          );
        });
  }

  _isHasUser(int index, isHasUser) {
    if (widget.retrievedEmployeeList != null) {}

    for (var element in widget.retrievedEmployeeList![index].users!) {
      isHasUser = widget.currentEmail == element.toString();
    }
    return isHasUser;
  }
}
