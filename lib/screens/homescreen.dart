import 'package:addtofavourite/models/allitems.dart';
import 'package:addtofavourite/models/favitems.dart';
import 'package:addtofavourite/screens/favouritescreen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All items"), centerTitle: true,),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5,);
        },
        itemCount: productitems.length,
        itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.grey,
          title: Text(productitems[index]["productname"]),
          subtitle: Text(productitems[index]["productprice"].toString()),
          trailing: IconButton(onPressed: (){
          setState(() {
              if (productitems[index]["isFav"] ==true) {
                productitems[index]["isFav"] =false;
                favitems.remove(productitems[index]);
              
            } else {
              productitems[index]["isFav"] =true;
              favitems.add(productitems[index]);
            }
          });
          }, icon:  Icon(
            
            Icons.favorite,
            color: productitems[index]["isFav"] ==true?Colors.red :Colors.white,)),
        );
      },),
  floatingActionButton: FloatingActionButton(onPressed: () async{
   await Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouriteScreen(),));
  } , child: const Icon(Icons.home),),
    );
  }
}