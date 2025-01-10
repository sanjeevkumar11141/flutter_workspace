import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(

    home: Scaffold(
      body: ListViewDemo(),
    ),
  ));
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return  ListView(
    //     children: [
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //       FlutterLogo(size: 100,),
    //     ],
    //
    // );

    return MYList();
  }


  Widget MYList (){
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index ) =>
          ListTile(title: Text("Item $index"))
      ),
    );
  }
}