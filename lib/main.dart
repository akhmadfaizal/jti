import 'dart:ui' as ui;
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:jti_app/constant/constant.dart';
import 'package:jti_app/icons/my_flutter_app_icons.dart';
import 'package:jti_app/pages/home_page.dart';
import 'package:jti_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JTI Application',
      initialRoute: '/LogInPage',
      routes: {
        '/LogInPage': (context) => const LogInPage(),
        '/MainPage': (context) => const MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'APP KEUANGAN',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(
                blueColour,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            Center(
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                child: const GradientIcon(
                  icon: MyFlutterApp.buttonNotifikasi,
                  size: 35.0,
                  gradient: LinearGradient(
                    colors: [Color(blueColourTwo), Color(blueColourThree)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size(0, 70.0),
            child: TabBar(
              unselectedLabelColor:
                  const Color(blueColourThree).withOpacity(0.15),
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(bottom: 20),
              tabs: [
                Tab(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        const Offset(24.0, 4.0),
                        const Offset(4.0, 24.0),
                        [
                          const Color(blueColourTwo),
                          const Color(blueColourThree),
                        ],
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          MyFlutterApp.buttonHomeTidakAktif,
                          size: 35.0,
                        ),
                        Text(
                          "HOME",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        const Offset(24.0, 4.0),
                        const Offset(4.0, 24.0),
                        [
                          const Color(blueColourTwo),
                          const Color(blueColourThree),
                        ],
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          MyFlutterApp.buttonTransaksiTidakAktif,
                          size: 35.0,
                        ),
                        Text(
                          "TRANSAKSI",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        const Offset(24.0, 4.0),
                        const Offset(4.0, 24.0),
                        [
                          const Color(blueColourTwo),
                          const Color(blueColourThree),
                        ],
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          MyFlutterApp.buttonLaporanTidakAktif,
                          size: 35.0,
                        ),
                        Text(
                          "LAPORAN",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        const Offset(24.0, 4.0),
                        const Offset(4.0, 24.0),
                        [
                          const Color(blueColourTwo),
                          const Color(blueColourThree),
                        ],
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          MyFlutterApp.buttonToolsTidakAktif,
                          size: 35.0,
                        ),
                        Text(
                          "TOOLS",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(children: [
          Center(
            child: HomePage(),
          ),
          Center(
            child: Text('Transaksi'),
          ),
          Center(
            child: Text('Laporan'),
          ),
          Center(
            child: Text('Tools'),
          ),
        ]),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  const GradientIcon(
      {required this.icon,
      required this.size,
      required this.gradient,
      Key? key})
      : super(key: key);

  final IconData? icon;
  final double? size;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size! * 1.2,
        height: size! * 1.2,
        child: DecoratedIcon(
          icon!,
          size: size,
          color: Colors.white,
          shadows: const [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(greyColour),
            ),
            BoxShadow(
              blurRadius: 12.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size!, size!);
        return gradient!.createShader(rect);
      },
    );
  }
}
