import 'package:flutter/material.dart';
import 'package:fisrtapp/Product_detail.dart';


class Productbycategorie extends StatefulWidget {

  final prodcat;
 Productbycategorie({
   this.prodcat
 });
  @override
  _ProductbycategorieState createState() => _ProductbycategorieState();
}

class _ProductbycategorieState extends State<Productbycategorie> {
    
  var product_list = [

     {

      "name":"leather coat",
      "picture":"https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=726&q=80",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":120,
      "price":90,
      "categorie":"Jeans",

    },

    {

      "name":"Pink dress",
      "picture":"https://images.unsplash.com/photo-1563293958-0b31aeb0cecb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=354&q=80",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":100,
      "price":80,
      "categorie":"Jeans"

    },
    {

      "name":"Pink dress",
      "picture":"https://images.unsplash.com/photo-1563293958-0b31aeb0cecb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=354&q=80",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":100,
      "price":80,
      "categorie":"Talon"

    },
    {

      "name":"leather coat",
      "picture":"https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=726&q=80",
      "description":"New Collection",
      "detail":"Coton",
      "old_price":120,
      "price":90,
      "categorie":"Talon",

    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) , 
      itemBuilder: (BuildContext context, int index){


       if (widget.prodcat == product_list[index]['categorie']){
          
        
           return Prodbycategorie(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_description: product_list[index]['description'],
          prod_detail: product_list[index]['detail'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
          
        );
        
        

        
        }else {

         return Text('');
        
        }

       

      });
  }
}


class Prodbycategorie extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_description;
  final prod_detail;
  final prod_old_price;
  final prod_price;
  final prod_categorie;

  Prodbycategorie({
    this.prod_name,
    this.prod_picture,
    this.prod_description,
    this.prod_detail,
    this.prod_old_price,
    this.prod_price,
    this.prod_categorie,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        product_detail_name: prod_name,
                        product_detail_picture: prod_picture,
                        product_detail_description: prod_description,
                        product_detail_detail: prod_detail,
                        product_detail_old_price: prod_old_price,
                        product_detail_price: prod_price,
                      )));
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.white60,
            leading: Text(prod_name),
            title: Text(
              '£' + prod_old_price.toString(),
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text('£' + prod_price.toString(),
                style: TextStyle(color: Colors.black)),
          ),
          child: Image.network(
            prod_picture,
            fit: BoxFit.cover,
          ),
        )),
    );
   
  }
}
