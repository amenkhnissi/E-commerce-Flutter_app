import 'package:flutter/material.dart';


class ProductDetail extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_description;
  final product_detail_detail;
  final product_detail_old_price;
  final product_detail_price;

  ProductDetail({
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_description,
    this.product_detail_detail,
    this.product_detail_old_price,
    this.product_detail_price
  });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  }
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Product Detail',style: TextStyle(fontWeight: FontWeight.w400)),
        actions: <Widget>[
          Icon(Icons.star_border,color: Colors.yellowAccent,),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 350.0,
            child: GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.white60,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(widget.product_detail_name),
        ),
        title: Text('£'+ widget.product_detail_old_price.toString(),style: TextStyle(color:Colors.red),),
        subtitle: Text('£'+ widget.product_detail_price .toString(),style: TextStyle(color:Colors.black),),
        trailing: Icon(Icons.star,color: Colors.yellowAccent,),

      ),
      child:  
      Image.network(widget.product_detail_picture, fit: BoxFit.cover,),
      )
          ),

          Row(
            children: <Widget>[
              Expanded (
                  child: MaterialButton(
                  color: Colors.redAccent,
                  onPressed: (){},
                  child: Text('Buy now'),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.shop,color:Colors.redAccent),
              )
            ],
          ),
          Container(
            height: 50.0,
            child: TabBar(controller: tabController,
            tabs: 
            [
              Icon(Icons.description,color: Colors.redAccent,),
              Icon(Icons.details,color: Colors.redAccent),
              Icon(Icons.rate_review,color: Colors.redAccent),
            ]
            ),
          ),
          Container(
            height: 300.0,
           
             child : TabBarView(
               controller: tabController,
               children: [

            Container(
              height: 200.0,
              color: Color.fromRGBO(250, 0, 0, 230.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.product_detail_description}',textAlign: TextAlign.justify,),
              ),
            ),

            Container(
              height: 200.0,
              color: Color.fromRGBO(250, 0, 0, 230.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
       
                Text('Material : '+'${widget.product_detail_detail}',textAlign: TextAlign.justify,),
              ),
            ),
           
            Container(
              height: 200.0,
              color: Colors.black,
            ),
           
          ]),
          ),


        ],
      ),  
    );
  }
}