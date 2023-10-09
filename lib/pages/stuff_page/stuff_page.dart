import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_with_pagination/core/apis.dart';
import 'package:lottie/lottie.dart';

import '../../model/character_model.dart';
import '../../services/network.dart';
import '../detail_page/detail_page.dart';

class StuffsPage extends StatefulWidget {
  const StuffsPage({Key? key}) : super(key: key);

  @override
  State<StuffsPage> createState() => _StuffsPageState();
}

class _StuffsPageState extends State<StuffsPage> {
  List<Character> harryModels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await Network.methodGet(api: Apis.apiStuffs);
    if (data != null) {
      harryModels = Network.parseStuffs(data);
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
        elevation: 1,
        title: const Text(
          "Hogwart Stuffs",
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
          : harryModels.isNotEmpty
              ? GridView.builder(
                  itemCount: harryModels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                  ),
                  itemBuilder: (context, index) {
                    final harryModel = harryModels[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(character: harryModel),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        color: Colors.brown.withOpacity(0.15),
                        child: GridTile(
                          header: SizedBox(
                            child: harryModel.image.isNotEmpty
                                ? ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      harryModel.image,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(
                                    child: Icon(
                                      CupertinoIcons.person_alt_circle,
                                      size: 180,
                                    ),
                                  ),
                          ),
                          footer: Center(
                            child: Text(
                              harryModels[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: const SizedBox(),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No data available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
    );
  }
}
