import 'package:flutter/material.dart';
import './Product_detail.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [

    {

      "name":"Pink dress",
      "picture":"assets/images/pic4.jpg",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":100,
      "price":80

    },
    {

      "name":"leather coat",
      "picture":"assets/images/pic5.jpg",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":120,
      "price":90

    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) , 
      itemBuilder: (BuildContext context, int index){
        return Product(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_description: product_list[index]['description'],
          prod_detail: product_list[index]['detail'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
          
        );

      });
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
                  product_detail_name: prod_name,
                  product_detail_picture: prod_picture,
                  product_detail_description: prod_description,
                  product_detail_detail: prod_detail,
                  product_detail_old_price: prod_old_price,
                  product_detail_price: prod_price,
                  
                  )

                  ));
                },
              child:GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.white60,
          leading: Text(prod_name),
          title: Text('£'+prod_old_price.toString(),style: TextStyle(color:Colors.red),),
          subtitle: Text('£'+prod_price.toString(),style: TextStyle(color:Colors.black)),

        ),
        child:  
        Image.asset(prod_picture, fit: BoxFit.cover,),
        )
              ),
    );
    
    
    
    
  }
}