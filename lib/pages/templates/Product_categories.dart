import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';


class ProductCategories extends StatefulWidget {
  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  final DatabaseService _database = DatabaseService();

  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: _database.category,
      builder: (context, snapshot) {
        if(snapshot.hasData);
        var data = snapshot.data;
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.documents.length,
            itemBuilder: (BuildContext context,int index){
              return Categorie(
                categorie_picture:  data.documents[index]['category image'] ,
                categorie_name: data.documents[index]['category name'],
              );


            }
         
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
      
      },
      child: 
      Stack(children: <Widget>[

         Padding(
        padding: const EdgeInsets.only(top :8.0,right:4.0,left:4.0),
        child: Container(
          width: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(categorie_picture),fit: BoxFit.cover ),
            border: Border.all(color: Colors.black38,
            width: 1,
            ),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
      Positioned(
                left: 8,
                top: -3,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5, left: 10, right: 10,),
                  color: Colors.transparent,
                  child: Text(
                    categorie_name.toString().toUpperCase(),
                    style: TextStyle(color: Colors.red, fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                )),

      ],),
     
      

    );
   
       
    

  }
}