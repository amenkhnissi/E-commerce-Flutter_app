import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';
import './Product_detail.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final DatabaseService _database = DatabaseService();
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _database.product,
      builder: (context, snapshot) {
        if (snapshot.hasData);
        var data = snapshot.data;
        return GridView.builder(
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) , 
          itemBuilder: (BuildContext context, int index){
            return Product(
              prod_name: data.documents[index]['product name'],
              prod_picture: data.documents[index]['Product image'],
              prod_description: '',
              prod_detail: data.documents[index]['Product detail'],
              prod_old_price: '',
              prod_price: data.documents[index]['Product price'],
              
            );

          });
      }
    );
  }
}


class Product extends StatelessWidget {

  final prod_name;
  final prod_picture;
  final prod_description;
  final prod_detail;
  final prod_old_price;
  final prod_price;
 

  Product({
    this.prod_name,
    this.prod_picture,
    this.prod_description,
    this.prod_detail,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 

                  ProductDetail(
                  prod_detail_name: prod_name,
                  prod_detail_picture: prod_picture,
                  prod_detail_description: prod_description,
                  prod_detail_detail: prod_detail,
                  prod_detail_old_price: prod_old_price,
                  prod_detail_price: prod_price,
                  
                  )

                  ));
                },
              child:GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.white60,
          leading: Text(prod_name),
          title:  Text('£ ' +prod_old_price.toString(),style: TextStyle(color:Colors.red),),
          subtitle: Text('£ ' +prod_price.toString(),style: TextStyle(color:Colors.black)),
          trailing: Icon(Icons.star),

        ),
        child:  
        Image.network(prod_picture, fit: BoxFit.cover,),
        )
              ),
    );
    
    
    
    
  }
}