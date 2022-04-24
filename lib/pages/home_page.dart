import 'dart:io';

import 'package:blur/blur.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:jti_app/constant/constant.dart';
import 'package:jti_app/icons/my_flutter_app_icons.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state: $state');
    // super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;
    final isBackground = state == AppLifecycleState.paused;
    if (isBackground) {
      print('This is bacground');
    }
  }

  double rightPosition = -285;
  bool isOpen = false;
  double opacityOutlet = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(blueColourThree),
      body: SizedBox(
        height: 200,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Blur(
                colorOpacity: opacityOutlet,
                blur: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Nama Outlet',
                        style: TextStyle(
                            color: Color(blueColourThree),
                            fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 16.0, 48.0, 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              listRateMoneyOutlet(
                                iconData: MyFlutterApp.iconRupiah,
                                text: 'IDR',
                                money: 10000,
                              ),
                              listRateMoneyOutlet(
                                iconData: MyFlutterApp.iconDollar,
                                text: 'USD',
                                money: 0,
                              ),
                              listRateMoneyOutlet(
                                iconData: MyFlutterApp.iconEuro,
                                text: 'EUR',
                                money: 2200,
                              ),
                              listRateMoneyOutlet(
                                iconData: MyFlutterApp.iconRupiah,
                                text: 'SGD',
                                money: 6000,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: 0,
                right: rightPosition,
                child: Container(
                  height: 200,
                  width: 330,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(-2, 0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    )
                  ]),
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: const Color(blueColourFour),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isOpen == false) {
                                  rightPosition = 0;
                                  isOpen = !isOpen;
                                  opacityOutlet = 0.5;
                                } else {
                                  rightPosition = -280;
                                  isOpen = !isOpen;
                                  opacityOutlet = 0;
                                }
                              });
                            },
                            icon: getIconCondition(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 16.0, bottom: 16.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      iconButtonOnSlide(
                                        iconData: MyFlutterApp.buttonInputMasuk,
                                        text: 'MASUK',
                                      ),
                                      iconButtonOnSlide(
                                        iconData:
                                            MyFlutterApp.buttonInputKeluar,
                                        text: 'KELUAR',
                                      ),
                                      iconButtonOnSlide(
                                        iconData:
                                            MyFlutterApp.buttonInputPindah,
                                        text: 'PINDAH',
                                      ),
                                      iconButtonOnSlide(
                                        iconData:
                                            MyFlutterApp.buttonInputMutasi,
                                        text: 'MUTASI',
                                      ),
                                      iconButtonOnSlide(
                                        iconData: MyFlutterApp.buttonInputKurs,
                                        text: 'KURS',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  'Jumlah Barang',
                                                  style: TextStyle(
                                                    color: Color(greyColourTwo),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: DottedLine(
                                                    dashColor:
                                                        Color(blueColourFour),
                                                  ),
                                                ),
                                                Text(
                                                  '16',
                                                  style: TextStyle(
                                                    color: Color(greyColourTwo),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            listTotalExchangeRate(
                                                text: 'Total IDR',
                                                money: 2000,
                                                currencyName: 'IDR'),
                                            listTotalExchangeRate(
                                                text: 'Total USD',
                                                money: 2000,
                                                currencyName: 'USD'),
                                            listTotalExchangeRate(
                                                text: 'Total EUR',
                                                money: 2000,
                                                currencyName: 'EUR'),
                                            listTotalExchangeRate(
                                                text: 'Total SGD',
                                                money: 2000,
                                                currencyName: 'SGD'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listRateMoneyOutlet({IconData? iconData, String? text, int? money}) =>
      Row(
        children: [
          Icon(
            iconData!,
            color: const Color(blueColourThree),
            size: 15,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text!,
            style: const TextStyle(
                color: Color(greyColourTwo), fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: DottedLine(
              dashColor: Color(blueColourFour),
            ),
          ),
          Text(
            money.toString(),
            style: const TextStyle(
              color: Color(blueColourThree),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );

  Widget getIconCondition() {
    if (isOpen == false) {
      return const Icon(
        MyFlutterApp.buttonOpenSlide,
        color: Color(blueColourThree),
      );
    } else {
      return const Icon(
        MyFlutterApp.buttonCloseSlide,
        color: Color(blueColourThree),
      );
    }
  }

  Widget iconButtonOnSlide({IconData? iconData, String? text}) {
    return ShaderMask(
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
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData!,
                    size: 30,
                  ),
                  Text(
                    text!,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget listTotalExchangeRate(
          {String? text, int? money, String? currencyName}) =>
      Row(
        children: [
          Text(
            text!,
            style: const TextStyle(
              color: Color(blueColourThree),
              fontSize: 10,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: DottedLine(
              dashColor: Color(blueColourFour),
            ),
          ),
          Text(
            '${getCurrency(currenyName: currencyName)} ${money.toString()}',
            style: const TextStyle(
              color: Color(blueColourThree),
              fontSize: 10,
            ),
          ),
        ],
      );

  String getCurrency({String? currenyName}) {
    var format = NumberFormat.simpleCurrency(
        locale: Platform.localeName, name: currenyName);
    return format.currencySymbol;
  }
}
