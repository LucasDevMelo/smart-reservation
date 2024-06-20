import 'package:flutter/material.dart';
import 'package:healthcare/screens/appointment_screen.dart';

class HomeScreen extends StatelessWidget {
  List foods = [
    "Sushi",
    "Massas",
    "Churrasco",
    "Pizza",
    "Hambúrguer",
    "Vegetariano",
  ];

  List restaurantsNames = [
    "Coco Bambu",
    "Mangai",
    "NAU Frutos do Mar",
    "Villa Tevere",
    "Toro Parrilla",
    "Feitiço das Artes",
    "Taypá",
    "Vasto",
    "Universal",
    "Saveur Bistrot",
  ];

  List categoryRestaurant = [
    "Frutos do mar",
    "Comida nordestina",
    "Frutos do mar",
    "Gastronomia italiana",
    "Churrasco",
    "Comida mineira",
    "Comida Peruana",
    "Comida brasileira",
    "Comida brasileira",
    "Comida brasileira",
  ];

  List imgs = [
    "cocobambulogo.jpg",
    "mangailogo.jpg",
    "naulogo.png",
    "vilalogo.png",
    "torologo.png",
    "feiticologo.png",
    "taypalogo.png",
    "vastologo.jpg",
    "universallogo.png",
    "saveurlogo.png",
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Olá, User",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/avatar.png"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
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
                      margin:
                          const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6FA),
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
                            color: Colors.black54,
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
                  "Restaurantes populares",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentScreen(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(vertical: 15),
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
                            backgroundImage:
                                AssetImage("images/${imgs[index]}"),
                          ),
                          Text(
                            restaurantsNames[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            categoryRestaurant[index],
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.9",
                                style: TextStyle(
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
            ],
          ),
        ),
      
    );
  }
}
