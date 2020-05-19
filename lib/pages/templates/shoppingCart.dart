
import 'package:fisrtapp/pages/widgets/productColorSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
          decoration:
          BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFdad9d5),
                  Color(0xFFdcd9d2).withOpacity(.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.5],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0)
            ),
          height: 120.0,
         
          child:  
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ListTile(
                           leading: Image.asset('name'),
                           title: Text('data'),
                           subtitle: Text('price'),
                           trailing: Text('count'),
                         ),
                       ),
          
          
        ),
    );
    
      
    
  }
}