import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement_demo/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItemList
                            .contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text("Item " + index.toString()),
                      trailing:
                      value.selectedItemList.contains(index)
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                    );
                  },
                );
              }),
        ),
      ]),
    );
  }

}
