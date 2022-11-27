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

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final activityProvider = FutureProvider<Activity>((ref) async {
  final database = ref.watch(databaseApiProvider);
  return database.getYellowCardData();
});

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
    const RunningScreen(),
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

class RunningScreen extends ConsumerWidget {
  const RunningScreen({
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
                  'Challenges: Running',
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
                  page: HomeScreen(),
                  icon: FontAwesomeIcons.running,
                  title: 'Easy - 3km',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () {},
                ),
                MiniCard(
                  page: HomeScreen(),
                  icon: FontAwesomeIcons.running,
                  title: 'Medium - 5km',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.yellow,
                  secondaryColor: Color.fromARGB(255, 175, 158, 5),
                  onTap: () {},
                ),

                MiniCard(
                  page: HomeScreen(),
                  icon: FontAwesomeIcons.running,
                  title: 'Hard - 10km',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.red,
                  secondaryColor: Color.fromARGB(255, 138, 36, 3),
                  onTap: () {},
                ),
                MiniCard(
                  page: HomeScreen(),
                  icon: FontAwesomeIcons.running,
                  title: 'Extreme Mode - 20km',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start Challenge',
                  color: Colors.purple,
                  secondaryColor: Color.fromARGB(255, 31, 5, 76),
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
