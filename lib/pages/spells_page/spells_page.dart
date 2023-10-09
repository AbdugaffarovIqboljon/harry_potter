import 'package:flutter/material.dart';
import 'package:harry_potter_with_pagination/model/spell.dart';
import 'package:lottie/lottie.dart';

import '../../core/apis.dart';
import '../../services/network.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({super.key});

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  List<Spell> spells = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await Network.methodGet(api: Apis.apiSpells);
    if (data != null) {
      spells = Network.parseSpell(data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something bad happened')),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        elevation: 2,
        title: const Text(
          "Spells used in Movie",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: Lottie.asset("assets/lottie/loading_animation_blue.json"),
            )
          : ListView.builder(
              itemCount: spells.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  borderOnForeground: true,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  surfaceTintColor: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    title: Text(
                      spells[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      spells[index].description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
