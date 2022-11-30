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

var initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

Future<void> _showNotificationWithChronometer() async {
  final AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    icon: "ic_launcher",
    priority: Priority.high,
    when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
    usesChronometer: true,
  );
  final NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      id++, 'plain title', 'plain body', notificationDetails,
      payload: 'item x');
}

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

class LiftingScreen2 extends ConsumerWidget {
  const LiftingScreen2({
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
                  'Challenges: Workout',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const AutoSizeText(
                  'Challenge Robot',
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
                  title: 'Easy - 20mins',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
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

                    await _showNotificationWithChronometer();

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
                  title: 'Medium - 50mins',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.yellow,
                  secondaryColor: const Color.fromARGB(255, 175, 158, 5),
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
                  title: 'Hard - 1.5hrs',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.red,
                  secondaryColor: const Color.fromARGB(255, 138, 36, 3),
                  onTap: () {},
                ),
                MiniCard(
                  // page: const HomeScreen(),
                  icon: FontAwesomeIcons.dumbbell,
                  title: 'Extreme Mode - 2.5hrs',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.purple,
                  secondaryColor: const Color.fromARGB(255, 31, 5, 76),
                  onTap: () {},
                ),

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
                const AutoSizeText(
                  'Leaderboard',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

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
}
