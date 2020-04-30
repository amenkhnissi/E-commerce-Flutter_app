import 'package:flutter/material.dart';
import 'package:fisrtapp/Product_by_categorie.dart';


class ProductCategories extends StatefulWidget {
  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {

  var categories_list =[

    {
      "picture":"assets/images/bag.png",
      "name":"Bag"
    },
    {
      "picture":"assets/images/Costumn.png",
      "name":"Costumn"
      
    },
    {
      "picture":"assets/images/jeans.png",
      "name":"Jeans"
    },
    {
      "picture":"assets/images/shirt.png",
      "name":"Shirt"
    },
    {
      "picture":"assets/images/talon.png",
      "name":"Talon"
    },
    {
      "picture":"assets/images/suit.png",
      "name":"Suit"
    },
    {
      "picture":"assets/images/t-shirt.png",
      "name":"t-shirt"
    },
 
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories_list.length,
      itemBuilder: (BuildContext context,int index){
        return Categorie(
          categorie_picture:  categories_list[index]['picture'] ,
          categorie_name: categories_list[index]['name'],
        );


      }
    );
    }
}


class Categorie extends StatelessWidget {

  final categorie_picture;
  final categorie_name;

  Categorie({
    this.categorie_picture,
    this.categorie_name,
  });
  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Productbycategorie(
          prodcat: categorie_name,
        )));
      },
      child: Card(

      child: Image.asset(categorie_picture,),  

    ) ,

    );
   
       
    

  }
}