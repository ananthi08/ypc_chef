
import 'package:chef_frontend/common_widget/bottom_navbar.dart';
import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';

class Myvideospage extends StatefulWidget {
  static String route = '/chef/videos/1';
  const Myvideospage({super.key});
  @override
  State<Myvideospage> createState() => _MyvideospageState();
  
}

class _MyvideospageState extends State<Myvideospage> {
  @override
  Widget build(BuildContext context) {



 return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          
       child:   Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
          color:  Colors.blue.shade100,
          height: 130,
           child: Row(
            
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Firstpage(),
                      ),
                    );
                  },
                  
                ),
                
                Center(
                  
                  child: Container(
                    // color: Colors.blue,
                    width: 300,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                              
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: [        
                            Image.asset("assets/mxplayer.jpeg"),const SizedBox(height: 10,),
                           const Text('My Videos',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                              
                          ],
                              
                        ),
                  ),
                ),
                
                  
               
              ],
              
            ),

         ),
           
       ),
      
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: FloatingActionButton(
          
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.black87,
          foregroundColor: Colors.yellow,
          ),
       bottomNavigationBar:  const BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
       child: Bottomnavbar(),
),
      ),
    );
//     return const Scaffold(
// //  theme: new ThemeData(scaffoldBackgroundColor: const Color(#FFEFEF)),
// // backgroundColor: Color.fromARGB(248, 224, 0, 0),
 
//    body:SingleChildScrollView(
    
    
//      child: SafeArea(
    
     
//      ),
//    ),

//     );
   
  }
}