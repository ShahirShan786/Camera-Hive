
import 'package:flutter/material.dart';
import 'package:myapp/camaraScreen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(" Camara App"),

        
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          
        ),
        child: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Camarascreen(),));
          }, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,),
      ),
    ));
  }
}