import 'package:flutter/material.dart';

class Ex2Screen extends StatelessWidget {
  const Ex2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('lib/assets/Matrix.png'),
                                  fit: BoxFit.cover,
                                )
                            ),
                          )
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 - 60,
                        bottom: -60,
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/MrSmith.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60,),
                  Center(
                    child: Text(
                      'Mr Smith',
                      style: TextStyle(
                        fontSize: 40,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0), // Ajoute un peu d'espace autour du texte
                      child: Text(
                        "Mr. Smith, l’ennemi juré de Neo, est un programme perfectionné avec un penchant pour le sarcasme et la domination mondiale. Expert en clones et discours intimidants, il rêve secrètement d’une vie sans humains… et sans bugs.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center, // Aligne le texte au centre horizontalement
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Modifier le profil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "À propos de moi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blueGrey),
                            SizedBox(width: 10),
                            Text("Inconnue, Matrice"),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.work, color: Colors.blueGrey),
                            SizedBox(width: 10),
                            Text("Agent dans la Matrice"),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.family_restroom, color: Colors.blueGrey),
                            SizedBox(width: 10),
                            Text("Célibataire"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "Amis",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 160,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues (),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/MrSmith.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),  // Arrondir les bords
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues (),  // Couleur de l'ombre
                                spreadRadius: 2,  // Propagation de l'ombre
                                blurRadius: 7,    // Flou de l'ombre
                                offset: Offset(0, 3),  // Décalage de l'ombre
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/soleil.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues (),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/venère.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues (),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/lunette.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues (),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/MrSmith.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              "Feed",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "À propos de moi",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    height: 70,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      image: const DecorationImage(
                                        image: AssetImage('lib/assets/MrSmith.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Icon(Icons.work, color: Colors.blueGrey),
                                  SizedBox(width: 10),
                                  Text("Agent dans la Matrice"),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }
}