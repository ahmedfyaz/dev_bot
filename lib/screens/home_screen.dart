import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/code.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("DEV BOT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,fontFamily: 'SixtyFour',color: Colors.white),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.image_search_outlined,color: Colors.white),)
                ]
              ),
            ),),
            Expanded(child: ListView()),
            SizedBox(
              height: 100,
              width: size.width*0.9,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Type a message",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor
                          )
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.send,color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
