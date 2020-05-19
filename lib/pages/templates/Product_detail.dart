import 'package:fisrtapp/models/shoppingCart.dart';
import 'package:fisrtapp/pages/widgets/productSizeSelector.dart';
import 'package:fisrtapp/pages/widgets/shopCartNotifications.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/productColorSelector.dart';
import '../widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetail extends StatefulWidget {
  final prod_detail_name;
  final prod_detail_picture;
  final prod_detail_description;
  final prod_detail_detail;
  final prod_detail_old_price;
  final prod_detail_price;

  ProductDetail(
      {this.prod_detail_name,
      this.prod_detail_picture,
      this.prod_detail_description,
      this.prod_detail_detail,
      this.prod_detail_old_price,
      this.prod_detail_price});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  DatabaseService _databaseService = DatabaseService();
  double rating = 4.0;
  int _counter = 0;
  List colors = [];
  List sizes = [];
  String size ;

  final String desc =
      "Maxwell sole construction delivers exceptional durability and is resistant to oil,"
      "fat, acid, petrol and alkali; air-cushioned honeycomb";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    selectedcolor.clear();
    selectedsize.clear();
    super.initState();
  }

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedcolor);
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1100)..init(context);
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f7),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                ShopCartNotification(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 73),
            child: Center(
              child: Image.asset(
                'assets/images/model.png',
                width: double.infinity,
                height: height * .7,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
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
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: ScreenUtil().setHeight(650),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(400),
                          ),
                          child: Text(
                            widget.prod_detail_name,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(54),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            CustomPaint(
                              painter: LinePainter(),
                              child: Text("\$" + widget.prod_detail_old_price,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(34),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(12),
                            ),
                            Text("\$" + widget.prod_detail_price,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(36),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(14),
                    ),
                    SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 22,
                      color: Colors.black,
                      borderColor: Colors.white,
                      spacing: 0.0,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(14),
                    ),
                    Text(
                      "Color",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(36),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ColorSelector(
                          colors: [
                            Color(0xFF201e1f),
                            Color(0xFF919191),
                            Color(0xFFe3d4bf),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            width: screenAwareSize(100.0, context),
                            height: screenAwareSize(30.0, context),
                            decoration: BoxDecoration(
                                color: Color(0xFF525663),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: _decrease,
                                    child: Container(
                                      height: double.infinity,
                                      child: Center(
                                        child: Text("-",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontFamily: "Montserrat-Bold")),
                                      ),
                                    ),
                                  ),
                                ),
                                divider(),
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    height: double.infinity,
                                    child: Center(
                                      child: Text(_counter.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontFamily: "Montserrat-Bold")),
                                    ),
                                  ),
                                ),
                                divider(),
                                Flexible(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: _increase,
                                    child: Container(
                                      height: double.infinity,
                                      child: Center(
                                        child: Text("+",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontFamily: "Montserrat-Bold")),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().setWidth(460),
                            ),
                            child: SizeSelector(sizes: [
                              "S",
                              "M",
                              "L",
                            ])),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(460),
                          ),
                          child: Text(
                            desc,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularButton(
                                color: Colors.white,
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            CircularButton(
                              color: Colors.black,
                              icon: Icon(Icons.shopping_cart,
                                  color: Colors.white),
                              onPressed: () {
                                if (selectedcolor.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "No color selected");
                                } else if (_counter <= 0) {
                                  Fluttertoast.showToast(
                                      msg: "Select 1 item at least");
                                } else if (selectedsize.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "No size selected");
                                } else {
                                  for (var color in selectedcolor) {
                                    setState(() {
                                      colors.add(color.toString());
                                    });
                                  }
                                  for (var s in selectedsize) {
                                    setState(() {
                                      size = s ;
                                      print(size);
                                    });
                                  }
                                  _databaseService.cartItems(ShopCart(
                                    image: widget.prod_detail_picture,
                                    price: widget.prod_detail_price,
                                    name: widget.prod_detail_name,
                                    count: _counter,
                                    color: colors,
                                    size: size,
                                  ));
                                  Fluttertoast.showToast(
                                      msg: 'Product added to cart');
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;

    canvas.drawLine(
        Offset(0, size.height - 4), Offset(size.width, 4), linePaint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}

double baseHeight = 640.0;
double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
