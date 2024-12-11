import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderForWeather>(context, listen: false)
        .fetchWeatherInProivider('malappuram');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<ProviderForWeather>(
          builder: (context, provider, child) {  
            if (provider.flagLoading) {  
              return Center(    
                  child: Center(
                child: Column(
                  children: [
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Lottie.asset('asset/Animation 1.json')),
                    Text('Fetching your location')
                  ],
                ),
              ));
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    width: 0.1,
                                    color: Colors.black.withOpacity(1))),
                            elevation: 2,
                            color: Colors.white,
                            child: TextField(
                              onSubmitted: (value) {
                                provider.fetchWeatherInProivider(value);
                              },
                              controller: searchcontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                hintText: 'Enter a location',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Card(
                            color: Colors.white,
                            elevation: 3,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.settings),
                            ),
                          ),
                        )
                      ],
                    ),
                    if (provider.getDatasOfweatherapp.isNotEmpty) ...[
                      const Gap(30),
                      Text(
                        '${provider.getDatasOfweatherapp.first.sys!.country}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Center(
                        child: Image(
                          image: AssetImage('asset/weather_2.jpg'),
                          height: 200,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Wind',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                '${provider.getDatasOfweatherapp.first.wind!.speed}km/h',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Column(
                            children: [
                              const Text(
                                'Humidity',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                '${provider.getDatasOfweatherapp.first.main!.humidity}%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Gap(30),
                      Text(
                        provider.getDatasOfweatherapp.first.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 27),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${double.parse(provider.getDatasOfweatherapp.first.main!.temp.toString()).toInt()}°',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 65),
                              ),
                              Text(
                                'Feels Like ${double.parse(provider.getDatasOfweatherapp.first.main!.temp.toString()).toInt()}°',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.white,
                            elevation: 3,
                            child: Container(
                              height: 100,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: const Image(
                                        image:
                                            AssetImage('asset/sunrise.webp')),
                                  )),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Center(
                                          child: Center(
                                            child: Text(
                                                '${DateTime.fromMillisecondsSinceEpoch(provider.getDatasOfweatherapp.first.sys!.sunrise!.toInt() * 1000, isUtc: true)}°',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 5)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.white,
                              elevation: 3,
                              child: Container(
                                height: 100,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: const Image(
                                          image:
                                              AssetImage('asset/sunset.jpeg')),
                                    )),
                                    Expanded(
                                        child: Container(
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Sun Set',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Center(
                                            child: Center(
                                              child: Text(
                                                  '${DateTime.fromMillisecondsSinceEpoch(provider.getDatasOfweatherapp.first.sys!.sunset!.toInt() * 1000, isUtc: true)}°',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 5)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      const Divider(),
                      const Gap(2),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.wind_power),
                                        Gap(3),
                                        Text('12km/12'),
                                        Gap(2),
                                        Text('Wind Speed'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.visibility),
                                        const Gap(2),
                                        Text(
                                            '${provider.getDatasOfweatherapp.first.visibility}km/12'),
                                        const Gap(2),
                                        const Text('Visibility'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.wind_power),
                                        const Gap(2),
                                        Text(
                                            '${provider.getDatasOfweatherapp.first.main!.humidity}%'),
                                        const Gap(2),
                                        const Text('Humidity'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ] else ...[
                      const Gap(30),
                      const Center(
                        child: Text(
                          'No weather data available. Please try again later.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 20),
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 15),
                          height: 50,
                          child: Row(
                            children: [
                              const Text('Lat :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const Gap(20),
                              Text(
                                provider.getDatasOfweatherapp.first.lat
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const Spacer(),
                              const Text('Lon :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const Gap(20),
                              Text(
                                provider.getDatasOfweatherapp.first.lon
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
