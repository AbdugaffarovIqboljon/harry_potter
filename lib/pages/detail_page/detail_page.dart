import 'package:flutter/material.dart';
import 'package:harry_potter_with_pagination/model/character_model.dart';

import 'detail_page_views/detail_page_app_bar.dart';
import 'detail_page_views/information_widget.dart';

class DetailPage extends StatelessWidget {
  final Character character;

  const DetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: DetailPageAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// #Header Image
                Container(
                  margin: const EdgeInsets.all(12),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  height: 270,
                  width: 280,
                  child: character.image.isNotEmpty
                      ? Image.network(
                          character.image,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.account_circle,
                          size: 200,
                          color: Colors.black54,
                        ),
                ),

                /// #Movie Title
                Text(
                  character.name,
                  style: const TextStyle(fontSize: 28),
                ),

                /// #Sub Card Information
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        InformationWidget(
                          character: character,
                          firstText: "Name : ",
                          secondText: character.name,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Date of Birth",
                          secondText: character.dateOfBirth.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Year of Birth:",
                          secondText: character.yearOfBirth.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Actor",
                          secondText: character.actor,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Gender:",
                          secondText: character.gender,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Patronus: ",
                          secondText: character.patronus,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Species:",
                          secondText: character.species,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "House:",
                          secondText: character.house,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Hair Color:",
                          secondText: character.hairColour,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Eye Color:",
                          secondText: character.eyeColour,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Ancestry:",
                          secondText: character.ancestry,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Alternate First : ",
                          secondText: character.alternateNames?.length == 1
                              ? character.alternateNames![0].toString()
                              : "",
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Alternate Second : ",
                          secondText: character.alternateNames?.length == 2
                              ? character.alternateNames![1].toString()
                              : "",
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Wand Wood : ",
                          secondText: character.wand.wood,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Wand Core : ",
                          secondText: character.wand.core,
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Wand Length : ",
                          secondText: character.wand.length.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Is Wizard : ",
                          secondText: character.wizard.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Is HogwartsStudent : ",
                          secondText: character.hogwartsStudent.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Is HogwartsStaff : ",
                          secondText: character.hogwartsStaff.toString(),
                        ),
                        InformationWidget(
                          character: character,
                          firstText: "Is Alive : ",
                          secondText: character.alive.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
