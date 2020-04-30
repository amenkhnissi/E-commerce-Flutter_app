
import 'package:flutter/material.dart';


class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('Shopping Cart'),
        actions: <Widget>[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.attach_money),
         ),
         Padding(
           padding: const EdgeInsets.only(top:20.0,right:20.0),
           child: Text('Total'),
         ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index){
            return Cart();

          }),
      ),
      bottomNavigationBar: Row(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.favorite_border,color:Colors.red),
          ),
          Expanded(child: MaterialButton(onPressed: (){},child: Text('Checkout'),color: Colors.red,)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.favorite,color:Colors.red),
          ),
          
         
        ],
      ),
     
    );
  }
}



class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
             color: Color.fromRGBO(250, 0, 0,150),
             borderRadius: BorderRadius.circular(20.0)

          ),
          height: 120.0,
         
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                leading: Image.asset('assets/images/talon.png',fit: BoxFit.fitHeight,height: 200.0,),
                title: Text('Article Name'),
                subtitle: Text('\$ Price'),
                trailing: Icon(Icons.delete),
              ),
          ),
          
        ),
    );
    
      
    
  }
}