import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/card_provider.dart';
import 'package:to_do_app/dipslay_task_screen.dart';

class CardScreen extends StatefulWidget {
  static const String routeId="/card_screen";
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> with TickerProviderStateMixin{
  List appColors=[Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
  int cardIndex=0;
  ScrollController scrollController;

  var currentColor=Color.fromRGBO(231, 129, 109, 1.0);
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  void initState(){
    super.initState();
    scrollController = new ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    final cardProvider= Provider.of<CardList>(context);
    final loadedCard= cardProvider.cards;
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: currentColor,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right:16.0 ),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body:  new Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:16.0),
                      child: Icon(Icons.account_circle,
                        size:45.0,
                        color:Colors.white,),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child: Text("Hello, Jane",
                        style: TextStyle(
                          fontSize: 25,
                        ),),
                    ),
                    Text("Looks like feel good.",
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                    Text("You have 3 task to do today ",
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                  child: Text("Today:",
                    style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 350.0,
                  child: ListView.builder(
                    physics:NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,position){
                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: FlatButton(
                              onPressed: (){
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayTask(loadedCard[position].icon)));
                                });
                              },
                              child: Container(
                                width: 250.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(loadedCard[position].icon, color: appColors[position]),
                                          Icon(Icons.more_vert,color:Colors.grey),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                                            child: Text("${loadedCard[position].cardTitle}"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                                            child:Text("${loadedCard[position].taskRemaining} Tasks"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                                            child: LinearProgressIndicator(value: loadedCard[position].taskCompletion,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                        ),
                        onHorizontalDragEnd: (details){
                          animationController =AnimationController(vsync:this,duration: Duration(microseconds: 500) );
                          curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
                          animationController.addListener((){
                            setState(() {
                              currentColor = colorTween.evaluate(curvedAnimation);
                            });
                          });
                          if (details.velocity.pixelsPerSecond.dx > 0){
                            if(cardIndex>0){
                              cardIndex--;
                              colorTween = ColorTween(begin:currentColor, end:appColors[cardIndex]);
                            }
                          }
                          else{
                            if(cardIndex<1){
                              cardIndex++;
                              colorTween= ColorTween(begin: currentColor, end: appColors[cardIndex]);
                            }
                          }
                          setState(() {
                            scrollController.animateTo((cardIndex)*256.0,
                                duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                          });
                          colorTween.animate(curvedAnimation);
                          animationController.forward();
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
