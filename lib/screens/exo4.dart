import 'package:flutter/material.dart';

class Question {
  String question;
  bool isTrue;
  String explanation;
  String path;

  Question({
    required this.question,
    required this.isTrue,
    required this.explanation,
    required this.path
  });
}

List<Question> questions = [
  Question(
      question:"Un poisson peut cligner des yeux.",
      isTrue:false,
      explanation:"Les poissons n'ont pas de paupières, ils ne peuvent donc pas cligner des yeux. Leur environnement aquatique maintient leurs yeux constamment humides.",
      path:"./assets/cligne.jpg"
  ),
  Question(
      question:"Les poissons rouges ont une mémoire de seulement 3 secondes.",
      isTrue:false,
      explanation:"Contrairement à la croyance populaire, les poissons rouges ont une mémoire qui peut durer plusieurs mois ! Ils peuvent même être entraînés à reconnaître des formes et des sons.",
      path:"./assets/memoire.jpg"
  ),
  Question(
      question:"Certains poissons peuvent produire de l'électricité.",
      isTrue:true,
      explanation:"Des poissons comme l'anguille électrique génèrent de l'électricité pour se défendre et chasser. Ils peuvent produire des décharges allant jusqu'à 600 volts !",
      path:"./assets/poissonelectrique.jpg"
  ),
  Question(
      question:"Les requins doivent constamment nager pour ne pas couler.",
      isTrue:true,
      explanation:"Certains requins, comme le grand requin blanc, doivent nager en permanence pour faire circuler l’eau dans leurs branchies et ainsi respirer.",
      path:"./assets/requin.jpg"
  ),
  Question(
      question:"Tous les poissons pondent des œufs.",
      isTrue:false,
      explanation:"Certains poissons, comme le guppy, sont ovovivipares : ils donnent naissance à des petits déjà formés plutôt que de pondre des œufs.",
      path:"./assets/esturgeon.jpg"
  ),
  Question(
      question:"Les poissons peuvent dormir.",
      isTrue:true,
      explanation:"Bien qu'ils ne ferment pas les yeux, les poissons entrent dans un état de repos où leur activité cérébrale ralentit.",
      path:"./assets/dodo.jpg"
  ),
  Question(
      question:"Il existe un poisson capable de survivre hors de l'eau pendant plusieurs jours.",
      isTrue:true,
      explanation:"Le poisson-perroquet et certains poissons-chats peuvent survivre hors de l'eau en absorbant l'oxygène de l'air.",
      path:"./assets/volant.jpg"
  ),
  Question(
      question:"Le poisson-clown change de sexe au cours de sa vie.",
      isTrue:true,
      explanation:"Dans un groupe de poissons-clowns, le plus grand devient une femelle s’il n’y en a pas. Une adaptation fascinante à leur environnement !",
      path:"./assets/clown.jpg"
  ),
  Question(
      question:"Les poissons peuvent ressentir la douleur.",
      isTrue:true,
      explanation:"Des études ont montré que les poissons ont des récepteurs de la douleur et peuvent réagir à des stimuli nocifs.",
      path:"./assets/douleur.jpg"
  ),
  Question(
      question:"Le plus petit poisson du monde mesure moins d’un centimètre.",
      isTrue:true,
      explanation:"Le Paedocypris, un poisson découvert en Asie du Sud-Est, mesure environ 7,9 mm à l’âge adulte, ce qui en fait le plus petit vertébré connu.",
      path:"./assets/petit.jpg"
  ),
  Question(
      question:"Certains poissons peuvent marcher sur la terre ferme.",
      isTrue:true,
      explanation:"Le poisson amphibie appelé 'mudskipper' est capable de se déplacer sur la terre ferme en utilisant ses nageoires.",
      path:"./assets/pattes.jpg"
  )
];

class Ex4Screen extends StatefulWidget {
  @override
  _Ex4ScreenState createState() => _Ex4ScreenState();
}
