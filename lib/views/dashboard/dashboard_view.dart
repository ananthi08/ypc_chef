
import 'package:chef_frontend/common_widget/bottom_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:svg_flutter/svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// // import 'package:flutter_svg/flutter_svg.dart';
// void main (){
//   runApp( const MaterialApp(
//     debugShowCheckedModeBanner:false,
    
//     home: Dashboardview(),
    
//   ));
// }

class Dashboardview extends StatefulWidget {
  static String route = '/chef/dashboard';
  const Dashboardview({super.key});

  @override
  State<Dashboardview> createState() => _DashboardviewState();
  
}

class _DashboardviewState extends State<Dashboardview> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
//  theme: new ThemeData(scaffoldBackgroundColor: const Color(#FFEFEF)),
backgroundColor: Color.fromARGB(248, 246, 246, 246),
 
   body:SingleChildScrollView(
    
    
     child: SafeArea(
      
       child: Padding(
         padding:  EdgeInsets.all(25.0),
         child: Column(
          
          children: [
        
         const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         
            Text('Dashboard',
             style: TextStyle(color: Colors.black,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              ),
              ),
          
          Icon(Icons.account_circle_rounded,
          color: Colors.black,
           size: 50.0,
        
          )
         ],
         ),
         const SizedBox(height: 50),

   
          Container(
        child: Center(
           child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/mxplayer.jpeg"),const SizedBox(height: 1,),
                 const Text('My Videos',style:TextStyle(fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                 const  Text('23 Videos'),


                ],

              ),
              
             const SizedBox(width: 150),
            
           
             const Expanded(
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        ),
                      ],
                      ),
                )
              ),
            
            ],
          ),
        ),
      ],
    ),
  ),
),
         const SizedBox(height: 30),
          Container(
        child: Center(
           child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/receipes1.jpeg"),const SizedBox(height: 1,),
                const  Text('My Recipes',style:TextStyle(fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                  const Text('34 Recipes'),


                ],

              ),
              
             const SizedBox(width: 150),
            
           
             const Expanded(
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        ),
                      ],
                      ),
                )
              ),
            
            ],
          ),
        ),
      ],
    ),
  ),
),
         const SizedBox(height: 30),
          Container(
        child: Center(
           child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/peoples.jpeg"),const SizedBox(height: 1,),
                 const Text('My customers',style:TextStyle(fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                   Text('23 peoples'),


                ],

              ),
              
             const SizedBox(width: 130),
            
           
             const Expanded(
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        ),
                      ],
                      ),
                )
              ),
            
            ],
          ),
        ),
      ],
    ),
  ),
),
         const SizedBox(height: 30),
         




          Container(
        child: Center(
           child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/calendar.jpeg"),const SizedBox(height: 1,),
                const  Text('View Schedule',style:TextStyle(fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                  const Text('23 Payment'),


                ],

              ),
              
             const SizedBox(width: 130),
            
           
             const Expanded(
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        ),
                      ],
                      ),
                )
              ),
            
            ],
          ),
        ),
      ],
    ),
  ),
),
         const SizedBox(height: 30),
         















   
          Container(
        child: Center(
           child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/payment.jpg"),const SizedBox(height: 1,),
                  const Text('Payment',style:TextStyle(fontWeight: FontWeight.bold)),const SizedBox(height: 8,),
                   Text('23 Payment'),


                ],

              ),
              
              SizedBox(width: 140),
            
           
              const Expanded(
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        ),
                      ],
                      ),
                )
              ),
            
            ],
          ),
        ),
      ],
    ),
  ),
),

         
          ],
          ),
       ),
     ),
   ),
       bottomNavigationBar: const Bottomnavbar(backgroundColor:Colors.red),

    );
   
  }
}