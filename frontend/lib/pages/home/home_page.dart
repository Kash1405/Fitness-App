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
import 'package:sync_fit/pages/activity/activity_page.dart';
import 'package:sync_fit/pages/home/widgets/activity_cards.dart';
import 'package:sync_fit/pages/home/widgets/mini_cards.dart';
import 'package:sync_fit/pages/home/widgets/web_cards.dart';
import 'package:sync_fit/pages/settings/settings_screen.dart';
import 'package:sync_fit/pages/webview/webview.dart';
import 'package:sync_fit/utils/app_colors.dart';

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

// final heartrateProvider = FutureProvider<HeartBeat>((ref) async {
//   final database = ref.watch(databaseApiProvider);
//   return database.getHeartRateCardData();
// });

// final spo2Provider = FutureProvider((ref) async {
//   final database = ref.watch(databaseApiProvider);
//   return database.getSpo2CardData();
// });

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  HomePage({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const ActivityScreen(),
    const SettingsScreen(),
    const AccountPage(),
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
                icon: FaIcon(FontAwesomeIcons.boltLightning), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gear), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: ''),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final activityData = ref.watch(activityProvider);
    // final heartrateData = ref.watch(heartrateProvider);
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
                    const AutoSizeText(
                      'Welcome back, Abhigyan!',
                      style: TextStyle(
                        fontFamily: 'SF-Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
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
                        icon: const FaIcon(FontAwesomeIcons.faceGrin))
                  ],
                ),
                const SizedBox(height: 1),
                const AutoSizeText(
                  'Your Analytics',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 1),
                const AutoSizeText(
                  'Activity',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 30,
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
                  icon: FontAwesomeIcons.dumbbell,
                  title: 'Strength',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: '2000',
                  color: Colors.red.shade400,
                  secondaryColor: AppColors.paleBlue,
                  onTap: () {},
                ),
                MiniCard(
                  icon: FontAwesomeIcons.personSwimming,
                  title: 'Swimming',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: '3400',
                  color: AppColors.oceanBlue,
                  secondaryColor: Color.fromARGB(255, 2, 64, 114),
                  onTap: () {},
                ),
                MiniCard(
                  icon: FontAwesomeIcons.car,
                  title: 'Speed',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: '4500',
                  color: AppColors.yellow,
                  secondaryColor: Colors.black,
                  onTap: () {},
                ),
                MiniCard(
                  icon: FontAwesomeIcons.bed,
                  title: 'Sleep',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: '7h 30m',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () {},
                ),

                // heartrateData.when(
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
                MiniCard(
                    icon: FontAwesomeIcons.water,
                    title: 'SpO2',
                    time: DateFormat.jm().format(DateTime.now()),
                    content: '98%',
                    color: AppColors.oceanBlue,
                    secondaryColor: AppColors.paleBlue,
                    onTap: () {}),

                const SizedBox(height: 30),
                const AutoSizeText(
                  'Articles',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                WebCards(
                  onTap: () {},
                  title: 'How to get a good night\'s sleep',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
