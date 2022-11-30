import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sync_fit/api/database.dart';
import 'package:sync_fit/models/activity.dart';
import 'package:sync_fit/models/heartbeat.dart';
import 'package:sync_fit/pages/account/account_page.dart';
import 'package:sync_fit/pages/home/home_page.dart';
import 'package:sync_fit/pages/activity/widgets/activity_cards.dart';
import 'package:sync_fit/pages/activity/widgets/mini_cards.dart';
import 'package:sync_fit/pages/activity/widgets/web_cards.dart';
import 'package:sync_fit/pages/settings/settings_screen.dart';
import 'package:sync_fit/pages/webview/webview.dart';
import 'package:sync_fit/utils/app_colors.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:sync_fit/pages/activity/widgets/timer.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

// final activityProvider = FutureProvider<Activity>((ref) async {
//   final database = ref.watch(databaseApiProvider);
//   return database.getYellowCardData();
// });

// final sleepDataProvider = FutureProvider<Sleep>((ref) async {
//   final database = ref.watch(databaseApiProvider);
//   return database.getSleepCardData();
// });
class ActivityPage extends ConsumerWidget {
  static const routename = '/running';
  ActivityPage({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const SettingsScreen(),
    const AccountPage(),
    const LiftingScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = ref.watch(currIndexProvider);
    return Scaffold(
      body: _pages[currIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color.fromARGB(255, 66, 66, 66), width: 1.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: currIndex,
          onTap: (index) => ref.read(currIndexProvider.notifier).update(
                (state) => index,
              ),
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          showSelectedLabels: false,
          fixedColor: AppColors.syncGreen,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gear), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: ''),
          ],
        ),
      ),
    );
  }
}

class LiftingScreen extends ConsumerWidget {
  const LiftingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      DateFormat("EEEE, d MMM").format(DateTime.now()),
                      style: const TextStyle(
                        fontFamily: 'SF-Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          final router = GoRouter.of(context);
                          if (await Permission.camera.isDenied) {
                            await Permission.camera.request();
                          }
                          router.push(WebView.routename);
                        },
                        // icon: const FaIcon(FontAwesomeIcons.om))
                        icon: const FaIcon(FontAwesomeIcons.user))
                  ],
                ),
                const SizedBox(height: 8),
                const AutoSizeText(
                  'Easy Workout',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const AutoSizeText(
                  'Here are some easy exercises for you!',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                // activityData.when(
                //   data: (data) => ActivityCard(
                //     activity: data,
                //   ),
                //   loading: () => const SizedBox(),
                //   error: (error, stack) => const SizedBox(),
                // ),
                // const ActivityCard(),
                MiniCard(
                  // page: const HomeScreen(),
                  icon: FontAwesomeIcons.dumbbell,
                  title: '20x',
                  // time: DateFormat.jm().format(DateTime.now()),
                  content: 'Jumping Jacks',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () async {
                    // print("hello");

                    // final snackBar = SnackBar(
                    //   content: const Text('Yay! A SnackBar!'),
                    //   action: SnackBarAction(
                    //     label: 'Undo',
                    //     onPressed: () {
                    //       // Some code to undo the change.
                    //     },
                    //   ),
                    // );

                    // await _showNotificationWithChronometer();

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen(),
                    //   ),
                    //);
                  },
                ),
                MiniCard(
                  // page: const HomeScreen(),
                  icon: FontAwesomeIcons.dumbbell,
                  title: '20x',
                  // time: DateFormat.jm().format(DateTime.now()),
                  content: 'Russian Twists',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),

                MiniCard(
                  // page: const HomeScreen(),
                  icon: FontAwesomeIcons.dumbbell,
                  title: '20x',
                  // time: DateFormat.jm().format(DateTime.now()),
                  content: 'Sit-Ups',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () {},
                ),
                // MiniCard(
                //   // page: const HomeScreen(),
                //   icon: FontAwesomeIcons.dumbbell,
                //   title: 'Extreme Mode - 2.5hrs',
                //   time: DateFormat.jm().format(DateTime.now()),
                //   content: 'Start Challenge',
                //   color: AppColors.parrotGreen,
                //   secondaryColor: AppColors.paleGreen,
                //   onTap: () {},
                // ),

                //   data: (data) => MiniCard(
                //       icon: FontAwesomeIcons.solidHeart,
                //       title: 'Heart Rate',
                //       time: DateFormat.jm().format(DateTime.now()),
                //       content: '${(data.max + data.min) ~/ 2} bpm',
                //       color: AppColors.heartRed.withOpacity(0.4),
                //       secondaryColor: Colors.red.shade900,
                //       onTap: () {}),
                //   loading: () => const SizedBox(),
                //   error: (error, stack) => const SizedBox(),
                // ),

                const SizedBox(height: 30),
                Container(
                  width: 500.0,
                  padding: const EdgeInsets.only(top: 3.0, right: 0.0),
                  child: const AutoSizeText(
                    'Timer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro Display',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                // const AutoSizeText(
                //   'Timer',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontFamily: 'SF-Pro Display',
                //     fontSize: 30,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black,
                //   ),
                // ),
                Container(
                  width: 500.0,
                  padding: EdgeInsets.only(top: 3.0, right: 0.0),
                  child: CountDownTimer(
                    secondsRemaining: 1200,
                    whenTimeExpires: () {
                      // print("Done");

                      const snackBar = SnackBar(
                        content: Text('Hurray!! Workout completed :)'),
                        // action: SnackBarAction(
                        //   label: 'Undo',
                        //   onPressed: () {
                        //     // Some code to undo the change.
                        //   },
                        //),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // setState(() {
                      //   hasTimerStopped = true;
                      // });
                    },
                    countDownTimerStyle: const TextStyle(
                      // color: Color(0XFFf5a623),
                      // fontSize: 47.0,
                      fontFamily: 'SF-Pro Display',
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                      color: Colors.orange,
                      height: 0.0,
                    ),
                  ),
                )

                // const AutoSizeText(
                //   'Recipe of the day',
                //   style: TextStyle(
                //     fontFamily: 'SF-Pro Display',
                //     fontSize: 30,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
