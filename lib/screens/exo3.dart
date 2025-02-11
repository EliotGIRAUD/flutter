import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile {
  String firstName;
  String lastName;
  int? age;
  double height;
  Gender gender;
  List<String> hobbies;
  String favoriteProgrammingLanguage;
  String secret;

  Profile({
    this.firstName = "",
    this.lastName = "",
    this.age,
    this.height = 0.0,
    this.gender = Gender.male,
    this.hobbies = const ["Vélo", "BZ", "chill"],
    this.favoriteProgrammingLanguage = "",
    this.secret = "",
  });
}

enum Gender {
  male,
  female,
  turtle,
}

class ImagePickerWidget extends StatefulWidget {
  final Function(XFile?) onImagePicked;

  const ImagePickerWidget({Key? key, required this.onImagePicked})
      : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  final int imageQuality = 85;
  final double maxWidth = 1920.0;
  final double maxHeight = 1080.0;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (pickedFile != null) {
        setState(() {
          _image = pickedFile;
        });

        widget.onImagePicked(_image);
      }
    } catch (e) {
      print('Erreur lors de la sélection de l\'image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt),
              label: Text('Appareil photo'),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo_library),
              label: Text('Galerie'),
            ),
          ],
        ),
        _image == null
            ? Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.image,
            size: 100,
            color: Colors.grey[400],
          ),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            File(_image!.path),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class Ex3Screen extends StatefulWidget {
  const Ex3Screen({Key? key}) : super(key: key);

  @override
  Ex3ScreenState createState() => Ex3ScreenState();
}

class Ex3ScreenState extends State<Ex3Screen> {
  Profile profile = Profile(firstName: "YourFirstName", lastName: "YourLastName");
  XFile? _image;
  bool _obscureTextSecret = true;
  bool _obscureText = true;
  String? _selectedActivity;

  void _updateImage(XFile? image) {
    setState(() {
      _image = image;
    });
  }

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePickerWidget(onImagePicked: _updateImage),
              SizedBox(height: 20),
              Text(profile.firstName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(profile.lastName, style: TextStyle(fontSize: 18)),
              Text(profile.age?.toString() ?? "Âge inconnu"),
              Text('Genre: ${profile.gender.toString().split('.').last}'),

              // Affichage de la phrase secrète masquée
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _obscureTextSecret ? '●' * profile.secret.length : profile.secret,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      _obscureTextSecret ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextSecret = !_obscureTextSecret;
                      });
                    },
                  ),
                ],
              ),
              TextField(
                onChanged: (value) => setState(() {
                  profile.firstName = value;
                }),
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
              TextField(
                onChanged: (value) => setState(() {
                  profile.lastName = value;
                }),
                decoration: InputDecoration(labelText: 'Nom de famille'),
              ),
              Slider(
                value: (profile.age ?? 0).toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                label: profile.age?.toString() ?? "0",
                onChanged: (double value) {
                  setState(() {
                    profile.age = value.toInt();
                  });
                },
              ),
              DropdownButton<Gender>(
                value: profile.gender,
                onChanged: (Gender? newValue) {
                  if (newValue != null) {
                    setState(() {
                      profile.gender = newValue;
                    });
                  }
                },
                items: Gender.values.map((Gender value) {
                  return DropdownMenuItem<Gender>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),
              TextField(
                onChanged: (value) => setState(() {
                  profile.secret = value;
                }),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Phrase secrète',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordView,
                  ),
                ),
              ),
              Column(
                children: profile.hobbies.map((hobby) {
                  return RadioListTile<String>(
                    title: Text(hobby),
                    value: hobby,
                    groupValue: _selectedActivity,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedActivity = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
