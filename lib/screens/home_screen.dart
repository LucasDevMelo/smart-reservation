import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healthcare/models/all_restaurants.dart';
import 'package:healthcare/screens/appointment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToRestaurantDetails(int index, bool isPopular) {
    final allrestaurants = context.read<AllRestaurants>();
    final restaurantsData = allrestaurants.restaurantsData;
    final popularRestaurants = restaurantsData.take(5).toList();

    if (isPopular && index < popularRestaurants.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentScreen(
            restaurant: popularRestaurants[index],
          ),
        ),
      );
    } else if (!isPopular && index < restaurantsData.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentScreen(
            restaurant: restaurantsData[index],
          ),
        ),
      );
    }
  }


  List foods = [
    "Sushi",
    "Massas",
    "Churrasco",
    "Pizza",
    "Hambúrguer",
    "Vegetariano",
  ];

  @override
  Widget build(BuildContext context) {
    final allrestaurants = context.read<AllRestaurants>();
    final restaurantsData = allrestaurants.restaurantsData;
    final popularRestaurants = restaurantsData.take(5).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Restaurantes'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "O que sua fome pede hoje?",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB300),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              foods[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Restaurantes mais populares",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularRestaurants.length,
                      itemBuilder: (context, index) {
                        if (index >= popularRestaurants.length) return Container();
                        return InkWell(
                          onTap: () => navigateToRestaurantDetails(index, true),
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage("images/${popularRestaurants[index].imagePath}"),
                                ),
                                Text(
                                  popularRestaurants[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  popularRestaurants[index].category,
                                  style: const TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      "${popularRestaurants[index].rating}",
                                      style: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Todos restaurantes",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: restaurantsData.length,
                    itemBuilder: (context, index) {
                      int reverseIndex = restaurantsData.length - 1 - index;
                      if (index >= restaurantsData.length) return Container();
                      return GestureDetector(
                        onTap: () => navigateToRestaurantDetails(reverseIndex, false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage("images/${restaurantsData[reverseIndex].imagePath}"),
                              ),

                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurantsData[reverseIndex].name,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width - 210,
                                    ),
                                    child: Text(
                                      restaurantsData[reverseIndex].location,
                                      style: TextStyle(color: Colors.grey[700]),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
