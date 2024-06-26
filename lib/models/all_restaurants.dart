import 'package:flutter/material.dart';
import 'package:healthcare/models/restaurants.dart';
import 'restaurants.dart';

class AllRestaurants extends ChangeNotifier{

  //cardápio
  final List<Restaurant> _restaurantsData = [
    //Coco bambu
    Restaurant(
      name: "Coco Bambu",
      imagePath: "cocobambulogo.jpg",
      rating: "4.6",
      category: "Frutos do mar",
      description: "Com especialidade em frutos do mar, possui um variado cardápio de dar água na boca. Sempre com produtos frescos, da mais alta qualidade, o Coco Bambu do Brasília Shopping é parada obrigatória para quem não abre mão de comer bem.",
      location: "Brasília shopping",
      coments: "comida top",
    ),

    //Mangai
    Restaurant(
      name: "Mangai",
      imagePath: "mangailogo.jpg",
      rating: "4.7",
      category: "Comida nordestina",
      description: "A rede paraibana de restaurantes Mangai apresenta o melhor da cozinha típica nordestina brasileira. Na clássica unidade de Brasília, com vista panorâmica para o Lago Paranoá e a Ponte JK, você pode esperar um cardápio variado e delicioso.",
      location: "SCE Sul, s/n - Lote 2, Asa Sul",
      coments: "comida top",
    ),

    //Nau
    Restaurant(
      name: "NAU Frutos do Mar",
      imagePath: "naulogo.png",
      rating: "4.4",
      category: "Frutos do mar",
      description: "Pratos frescos e saborosos, que juntam ingredientes tradicionais brasileiros, fazem a rede ser referência na gastronomia de Brasília. Os salões aconchegantes e sofisticados têm vista para o Lago Paranoá e a Ponte JK.",
      location: "Setor de Clubes Esportivos Sul",
      coments: "comida top",
    ),

    //Villa Tevere
    Restaurant(
      name: "Villa Tevere",
      imagePath: "vilalogo.png",
      rating: "4.9",
      category: "Gastronomia italiana",
      description: "Um dos mais tradicionais restaurantes da capital federal, o Villa Tevere é referência em gastronomia italiana. A casa é dividida em 4 ambientes charmosos e aconchegantes. O cardápio também apresenta pratos com toques asiáticos e temperos brasileiros.",
      location: "Asa Sul Comércio Local Sul 115 Bloco A",
      coments: "comida top",
    ),

    //Toro Parrilla
    Restaurant(
      name: "Toro Parrilla",
      imagePath: "vilalogo.png",
      rating: "4.9",
      category: "Churrasco",
      description: "Para pessoas apaixonadas por um bom churrasco, a dica é o Toro Parrilla, referência em carnes em Brasília. Excelente restaurante argentino, a casa oferece releituras modernas para pratos tradicionais, sendo especializada em cortes como bife ancho, picanha e costela bovina.",
      location: "Toro, SHCS CLS 104 BL C Loja 29",
      coments: "comida top",
    ),

    //Toro Parrilla
    Restaurant(
      name: "Toro Parrilla",
      imagePath: "torologo.png",
      rating: "4.6",
      category: "Churrasco",
      description: "Para pessoas apaixonadas por um bom churrasco, a dica é o Toro Parrilla, referência em carnes em Brasília. Excelente restaurante argentino, a casa oferece releituras modernas para pratos tradicionais, sendo especializada em cortes como bife ancho, picanha e costela bovina.",
      location: "SHCS CLS 104 BL C Loja 29",
      coments: "comida top",
    ),

    //Feitiço das Artes
    Restaurant(
      name: "Feitiço das Artes",
      imagePath: "feiticologo.png",
      rating: "4.9",
      category: "Comida mineira",
      description: "O bar e restaurante Feitiço das Artes é um reduto super tradicional da capital federal. Para fãs de arte, cultura, drinques, gastronomia e muita música, o espaço é ideal para curtir momentos animados.",
      location: "CLN 306 Bl. B, Lj. 45",
      coments: "comida top",
    ),

    //Taypá
    Restaurant(
      name: "Taypá",
      imagePath: "taypalogo.png",
      rating: "4.2",
      category: "Comida Peruana",
      description: "Os sabores e aromas irresistíveis da culinária peruana ganham novas interpretações no moderno cardápio da casa. Divididos em área interna e varanda, os ambientes são aconchegantes e, é claro, ganham decoração temática, com objetos decorativos vindos do país vizinho.",
      location: "St. de Habitações Individuais Sul QI 17 BI.G, Lj.208",
      coments: "comida top",
    ),

    //Vasto
    Restaurant(
      name: "Vasto",
      imagePath: "vastologo.jpg",
      rating: "4.8",
      category: "Comida brasileira",
      description: "A arquitetura, inspirada em restaurantes tradicionais nova-iorquinos, traz um ambiente com atmosfera aconchegante.",
      location: "Brasilia shopping",
      coments: "comida top",
    ),

    //Universal
    Restaurant(
      name: "Universal",
      imagePath: "universallogo.png",
      rating: "4.3",
      category: "Comida brasileira",
      description: "O Restaurante Universal é uma atração à parte em Brasília. A casa gastronômica mais viva e diversificada da cidade foi fundada pela consagrada chef Mara Alcamim e é destino certo para quem deseja provar um menu supermoderno. Além disso, a decoração é muito divertida, inusitada e colorida, com inspiração nos clássicos pubs britânicos e em elementos de décadas passadas.",
      location: "Asa Sul Comércio Local Sul 210",
      coments: "comida top",
    ),

    //Saveur Bistrot
    Restaurant(
      name: "Saveur Bistrot",
      imagePath: "saveurlogo.png",
      rating: "4.5",
      category: "Comida brasileira",
      description: "O endereço da alta gastronomia em Brasília é o Saveur Bistrot. Composto de pratos autorais, o menu é assinado pelo chef Thiago Paraíso, que reinterpreta clássicos da cozinha brasileira com muita sofisticação. Destacado por uma cozinha de respeito ao produto e especializado em menu degustação, o lugar foi premiado 2 vezes como Melhor Bistrô de Brasília pela revista Encontro Gastrô, do Correio Braziliense.",
      location: "St. de Mansões Dom Bosco Conj. 10",
      coments: "comida top",
    ),
  ];

  List<Restaurant> get restaurantsData => _restaurantsData;
//   //coments
//   List<Food> _cart = [];

//   //gether methods
//   List<Food> get foodMenu => _foodMenu;
//   List<Food> get cart => _cart;

//   //Adicionar ao carrinho
//   void addToCart(Food foodItem, int quantity) {
//     for (int i = 0; i < quantity; i++) {
//       _cart.add(foodItem);
//     }
//     notifyListeners();
//   }

//   //Remover do carrinho
//   void removeFromCart(Food food){
//     _cart.remove(food);
//     notifyListeners();
//   }
}