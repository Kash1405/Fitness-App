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
import 'package:sync_fit/pages/activity/widgets/leaderboard.dart';
import 'package:sync_fit/pages/home/home_page.dart';
import 'package:sync_fit/pages/activity/widgets/activity_cards.dart';
import 'package:sync_fit/pages/activity/widgets/mini_cards.dart';
import 'package:sync_fit/pages/activity/widgets/web_cards.dart';
import 'package:sync_fit/pages/settings/settings_screen.dart';
import 'package:sync_fit/pages/webview/webview.dart';
import 'package:sync_fit/utils/app_colors.dart';
import 'package:sync_fit/pages/activity/data.dart';

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

class ActivityPage extends ConsumerWidget {
  static const routename = '/activity';
  ActivityPage({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const SettingsScreen(),
    const AccountPage(),
    const ActivityScreen(),
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
              icon: FaIcon(FontAwesomeIcons.house),
              label: '',
            ),
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

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = ref.watch(currIndexProvider);

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
                  'Competition',
                  style: TextStyle(
                    fontFamily: 'SF-Pro Display',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const AutoSizeText(
                  'Activities',
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
                  icon: FontAwesomeIcons.running,
                  title: 'Run',
                  time: DateFormat.jm().format(DateTime.now()),
                  content: 'Start running',
                  color: AppColors.parrotGreen,
                  secondaryColor: AppColors.paleGreen,
                  onTap: () {
                    context.goNamed('homepage');
                    print("Run");
                    print(currIndex);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const SettingsScreen(),
                    //   ),
                    // );
                    // const snackBar = SnackBar(content: Text('Tap'));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    // Navigator.pushNamed(context, "/home");

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SettingsScreen()));
                  },
                ),
                MiniCard(
                    icon: FontAwesomeIcons.hiking,
                    title: 'Hike',
                    time: DateFormat.jm().format(DateTime.now()),
                    content: 'Start hiking',
                    color: AppColors.oceanBlue,
                    secondaryColor: AppColors.paleBlue,
                    onTap: () {
                      print("Hike");
                      print(currIndex);
                    }),
                MiniCard(
                    icon: FontAwesomeIcons.dumbbell,
                    title: 'Exercise',
                    time: DateFormat.jm().format(DateTime.now()),
                    content: 'Start Exercising',
                    color: AppColors.heartRed.withOpacity(0.4),
                    secondaryColor: Colors.red.shade900,
                    onTap: () {
                      print("Exercise");
                      print(currIndex);
                    }),
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
                //const LeaderBoard(),
                Container(
                  // color: Colors.white,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.yellow,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Table(
                    // border: TableBorder.all(color: Colors.black),
                    children: const [
                      // ignore: prefer_const_literals_to_create_immutables
                      TableRow(children: [
                        // // Icon(FontAwesomeIcons.hiking),
                        // // ignore: deprecated_member_use
                        // TableCell(child: Row(children: [Icon(FontAwesomeIcons.hiking), Text('Cell 6'),],),),
                        Text(
                          "Ranking",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SF-Pro Display',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SF-Pro Display',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Calories Burnt',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SF-Pro Display',
                              // fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                      TableRow(children: [
                        Text('1'),
                        Text('Abhigyan'),
                        Text('2200'),
                      ]),
                      TableRow(children: [
                        Text('2'),
                        Text('Kritik'),
                        Text('2100'),
                      ]),
                      TableRow(children: [
                        // ignore: deprecated_member_use
                        // Container(
                        //   child: Row(
                        //     children: [
                        //     ${"Icon(FontAwesomeIcons.hiking)"},
                        //     Text('Hi'),
                        //   ])
                        // ),
                        // Text('Cell 5 ${Icon(FontAwesomeIcons.hiking)}'),
                        Text('3'),
                        Text('Raghav'),
                        Text('2000'),
                      ]),
                      TableRow(children: [
                        Text('4'),
                        Text('Muttasif'),
                        Text('1900'),
                      ]),
                      // TableRow(children: [
                      //   Text('5'),
                      //   Text('Cell 5'),
                      //   Text('Cell 6'),
                      // ]),
                      // TableRow(children: [
                      //   Text('6'),
                      //   Text('Cell 5'),
                      //   Text('Cell 6'),
                      // ]),
                    ],
                  ),
                ),
                WebCards(
                  onTap: () {},
                  title: 'How to get a good night\'s sleep',
                ),
                const SizedBox(height: 30),
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
