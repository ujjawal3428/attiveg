import 'package:flutter/material.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 1; 

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
       switch (index) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const OfferPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesPage()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }

    // Add navigation logic here 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    spreadRadius: 10,
              ),
            ],
                  color: Colors.grey,
                  
                  image: const DecorationImage(
                    image: AssetImage('assets/bg1.jpg'), 
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                  
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/back.png', 
                            width: 30, 
                            height: 30,  
                          ),
                        ),
                      ),
                      const SizedBox(width: 18,),

                      Text('Notification', style: TextStyle(
                        
                        color: Colors.pink.shade600, fontFamily: 'DMSerifDisplay', fontSize: 25),
                      ),             
                    ],
              ),
              ),
              ),
              
             const  SizedBox(height: 20,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
                width: 60,
                height: 60,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Expanded(
                        child: Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                        style: TextStyle(
                           fontFamily: 'DMSerifDisplay',
                        ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                                   ),
                )
              ],  
             ),

             const  SizedBox(height: 10,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                 decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/notibell@4x.png')
                    ),
                    ),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',
                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),

             const  SizedBox(height: 10,),
            Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
               width: 50,
                               height: 50,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',
                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),

             const  SizedBox(height: 10,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
               width: 50,
                               height: 50,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',
                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),
             const  SizedBox(height: 10,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
               width: 50,
                               height: 50,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',


                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),
             const  SizedBox(height: 10,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
                              width: 50,
                               height: 50,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',
                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),
             const  SizedBox(height: 10,),
             Row(
              children: [
               Container(
                margin:const EdgeInsets.only(left: 10),
               width: 50,
                               height: 50,
                 decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/notibell@4x.png'))),
               
               ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                                
                  width: 350,
                  height: 85,
                   child: Column(
                     children: [
                      Text('Torem ipsum dolor sit amet, consectetur adipiscing elit.Torem ipsum dolor sit ametconsectetur adipiscing elit torem late.', 
                      style: TextStyle(
                         fontFamily: 'DMSerifDisplay',
                      ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('12:00 AM', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),),
                          SizedBox(width: 20,),
                          Text('•', style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.bold, color: Colors.pink),),
                          SizedBox(width: 10,),
                          Text('12 Aug 2024',style: TextStyle(
                             fontFamily: 'DMSerifDisplay',
                            color: Colors.pink),)
                        ],
                      )
                     ],
                   ),
                 ),
                )
              ],  
             ),


             //more content here
              ]
              )
      ),
 bottomNavigationBar: BottomNavigator(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onSwitchStores: () {  },
      ),
      ),
    );
  }

  }