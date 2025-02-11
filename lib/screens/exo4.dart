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
    required this.path,
  });
}

List<Question> questions = [
  Question(
      question:"Un poisson peut cligner des yeux.",
      isTrue:false,
      explanation:"Les poissons n'ont pas de paupières, ils ne peuvent donc pas cligner des yeux. Leur environnement aquatique maintient leurs yeux constamment humides.",
      path:"lib/assets/cligne.jpg"
  ),
  Question(
      question:"Les poissons rouges ont une mémoire de seulement 3 secondes.",
      isTrue:false,
      explanation:"Contrairement à la croyance populaire, les poissons rouges ont une mémoire qui peut durer plusieurs mois ! Ils peuvent même être entraînés à reconnaître des formes et des sons.",
      path:"lib/assets/memoire.jpg"
  ),
  Question(
      question:"Certains poissons peuvent produire de l'électricité.",
      isTrue:true,
      explanation:"Des poissons comme l'anguille électrique génèrent de l'électricité pour se défendre et chasser. Ils peuvent produire des décharges allant jusqu'à 600 volts !",
      path:"lib/assets/poissonelectrique.jpg"
  ),
  Question(
      question:"Les requins doivent constamment nager pour ne pas couler.",
      isTrue:true,
      explanation:"Certains requins, comme le grand requin blanc, doivent nager en permanence pour faire circuler l’eau dans leurs branchies et ainsi respirer.",
      path:"lib/assets/requin.jpg"
  ),
  Question(
      question:"Tous les poissons pondent des œufs.",
      isTrue:false,
      explanation:"Certains poissons, comme le guppy, sont ovovivipares : ils donnent naissance à des petits déjà formés plutôt que de pondre des œufs.",
      path:"lib/assets/esturgeon.jpg"
  ),
  Question(
      question:"Les poissons peuvent dormir.",
      isTrue:true,
      explanation:"Bien qu'ils ne ferment pas les yeux, les poissons entrent dans un état de repos où leur activité cérébrale ralentit.",
      path:"lib/assets/dodo.jpg"
  ),
  Question(
      question:"Il existe un poisson capable de survivre hors de l'eau pendant plusieurs jours.",
      isTrue:true,
      explanation:"Le poisson-perroquet et certains poissons-chats peuvent survivre hors de l'eau en absorbant l'oxygène de l'air.",
      path:"lib/assets/volant.jpg"
  ),
  Question(
      question:"Le poisson-clown change de sexe au cours de sa vie.",
      isTrue:true,
      explanation:"Dans un groupe de poissons-clowns, le plus grand devient une femelle s’il n’y en a pas. Une adaptation fascinante à leur environnement !",
      path:"lib/assets/clown.jpg"
  ),
  Question(
      question:"Les poissons peuvent ressentir la douleur.",
      isTrue:true,
      explanation:"Des études ont montré que les poissons ont des récepteurs de la douleur et peuvent réagir à des stimuli nocifs.",
      path:"lib/assets/douleur.jpg"
  ),
  Question(
      question:"Le plus petit poisson du monde mesure moins d’un centimètre.",
      isTrue:true,
      explanation:"Le Paedocypris, un poisson découvert en Asie du Sud-Est, mesure environ 7,9 mm à l’âge adulte, ce qui en fait le plus petit vertébré connu.",
      path:"lib/assets/petit.jpg"
  ),
  Question(
      question:"Certains poissons peuvent marcher sur la terre ferme.",
      isTrue:true,
      explanation:"Le poisson amphibie appelé 'mudskipper' est capable de se déplacer sur la terre ferme en utilisant ses nageoires.",
      path:"lib/assets/pattes.jpg"
  )
];

AlertDialog customAlertDialog(BuildContext context, Question question) {
  return AlertDialog(
    title: const Text("Explication :"),
    content: Text(question.explanation),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Fermer"),
      ),
    ],
  );
}

Future<void> showCustomDialog({required Widget dialog, required BuildContext context, bool barrierDismissible = true}) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext buildContext) {
      return dialog;
    },
  );
}

class Ex4Screen extends StatefulWidget {
  @override
  _Ex4ScreenState createState() => _Ex4ScreenState();
}

class _Ex4ScreenState extends State<Ex4Screen> {
  int currentQuestionIndex = 0;
  int counter = 0;

  void answerQuestion(bool answer) {
    if (answer == questions[currentQuestionIndex].isTrue) {
      counter++;
    }
    setState(() {
      showCustomDialog(
        dialog: customAlertDialog(context, questions[currentQuestionIndex]),
        context: context,
      );
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text("Résultat")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Score : $counter / ${questions.length}", style: const TextStyle(fontSize: 24)),
              Text(counter > 5 ? "Jamais vue un cerveau aussi gros !" : "T'es mauvais Jack !"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    counter = 0;
                  });
                },
                child: const Text("Rejouer"),
              ),
            ],
          ),
        ),
      );
    }

    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz sur les poissons")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: 440,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.white, width: 3),
                image: DecorationImage(
                  image: AssetImage(currentQuestion.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                currentQuestion.question,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => answerQuestion(true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Vrai", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => answerQuestion(false),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Faux", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
