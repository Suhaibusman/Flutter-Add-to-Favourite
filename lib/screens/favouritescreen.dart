import 'package:addtofavourite/models/allitems.dart';
import 'package:addtofavourite/models/favitems.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: favitems.isEmpty? const Center(child: Text("There is no items in favourite list")) :
      
      ListView.separated(
         separatorBuilder: (context, index) {
          return const SizedBox(height: 5,);
        },
        itemCount: favitems.length,
        itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.grey,
          title: Text(favitems[index]["productname"]),
          subtitle: Text(favitems[index]["productprice"].toString()),
          trailing: IconButton(onPressed: (){
         setState(() {
              if (favitems[index]["isFav"] ==true) {
                favitems[index]["isFav"] =false;

                productitems[index]["isFav"] =false;
                favitems.remove(productitems[index]);
              
            } else {
              favitems[index]["isFav"] =true;
              // favitems.add(productitems[index]);
            }
          });
          }, icon:  Icon(
            
            Icons.favorite,
            color: favitems[index]["isFav"] ==true?Colors.red :Colors.white,)),
        );
      },),
    );
  }
}