import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../constants/images.dart';
import '../../controller/HomeController.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fond de l'arrière-plan
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black38,
                  BlendMode.darken,
                ),
                image: AssetImage(
                  '../../assets/images/cloud-in-blue-sky.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu de la page
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Barre de recherche
              Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) => controller.city = value,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) => controller.updateWeather(),
                      decoration: InputDecoration(
                        suffix: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Search'.toUpperCase(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Visibility(
                      visible: controller.hasError,
                      child: Text(
                        controller.errorMessage,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 235, 7, 7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Contenu principal
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: OverflowBox(
                      minWidth: 0.0,
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 0.0,
                      maxHeight: (MediaQuery.of(context).size.height / 4),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            height: double.infinity,
                            child: Card(
                              color: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 15, left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            '${controller.currentWeatherData.name}'
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            DateFormat()
                                                .add_MMMMEEEEd()
                                                .format(DateTime.now()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '${controller.currentWeatherData.weather![0].description}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 22,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            Text(
                                              'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 120,
                                              height: 120,
                                              child: LottieBuilder.asset(
                                                  Images.cloudyAnim),
                                            ),
                                            Container(
                                              child: Text(
                                                'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}