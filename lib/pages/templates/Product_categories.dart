import 'package:flutter/material.dart';
import './Product_by_categorie.dart';


class ProductCategories extends StatefulWidget {
  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {

  var categories_list =[

    {
      "picture":"assets/images/bags.jpg",
      "name":"Bags"
    },
    {
      "picture":"assets/images/jeans.jpg",
      "name":"Jeans"
    },
    {
      "picture":"assets/images/shirts.jpg",
      "name":"Shirts"
    },
    {
      "picture":"assets/images/talon.jpg",
      "name":"Heels"
    },
    {
      "picture":"assets/images/suit.jpg",
      "name":"Suits"
    },
    {
      "picture":"assets/images/t-shirts.jpg",
      "name":"T-shirts"
    },
 
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
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
      child: 
      Stack(children: <Widget>[

         Padding(
        padding: const EdgeInsets.only(top :4.0,right:4.0),
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(categorie_picture),fit: BoxFit.cover ),
            border: Border.all(color: Colors.black38,
            width: 1,
            ),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
      Positioned(
                left: 8,
                top: -4,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  color: Colors.transparent,
                  child: Text(
                    categorie_name,
                    style: TextStyle(color: Colors.red, fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                )),

      ],),
     
      

    );
   
       
    

  }
}