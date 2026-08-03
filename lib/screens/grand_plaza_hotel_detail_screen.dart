import 'package:coderaxo_project_1/screens/select_dates_checkin_screen.dart';
import 'package:coderaxo_project_1/screens/select_dates_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ar_room_tour_screen.dart';

class GrandPlazaHotelDetailScreen extends StatefulWidget {
  const GrandPlazaHotelDetailScreen({super.key});

  @override
  State<GrandPlazaHotelDetailScreen> createState() => _GrandPlazaHotelDetailScreenState();
}

class _GrandPlazaHotelDetailScreenState extends State<GrandPlazaHotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/hoteladagio.png',height: 341,width: double.infinity,fit: BoxFit.cover,),
              Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back,size: 23,color: Colors.black,),
                      ),
                      Spacer(),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.share_rounded,size: 23,color: Colors.black,),
                      ),
                      const SizedBox(width: 6,),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_border_sharp,size: 23,color: Colors.black,),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios,size: 24,color: Colors.white,),
                    Icon(Icons.arrow_forward_ios,size: 24,color: Colors.white,),
                  ],
                ),
              ),
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                        color: Color(0xFF2FC1BE),
                        shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                    Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 2,),

                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Grand Plaza Hotel',style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                              ),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  Text('Superb',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF20A9A6)
                                  ),),
                                  SizedBox(width: 6,),
                                  Text('120 reviews',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF616161)
                                  ),),
                                  SizedBox(width: 6,),
                                  Row(
                                    children: [
                                      Icon(Icons.near_me_outlined,size: 15,color: Color(0xFF616161),),
                                      SizedBox(width: 4,),
                                      Text('London',style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF616161)
                                      ),)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 62,
                          decoration: BoxDecoration(
                              color: Color(0xFF2FC1BE).withOpacity(0.16),
                              borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                              color: Color(0xFF2FC1BE)
                            )
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star,size: 17,color: Color(0xFFF59E0B),),
                                SizedBox(width: 4,),
                                Text('4.8',style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=> SelectDatesCheckInScreen(),id: null);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Solid background blocks the shadow from leaking inside!
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.10),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2FC1BE).withOpacity(0.16), // Your semi-transparent tint
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(color: const Color(0xFF2FC1BE)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF2FC1BE),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.calendar_today, size: 27, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Tue, 13 Dec',style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),),
                                    SizedBox(height: 3,),
                                    Text('Check-in',style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                        SizedBox(width: 4,),
                        Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Get.to(()=> SelectDatesCheckOutScreen(),id: null);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Solid background blocks the shadow from leaking inside!
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2FC1BE).withOpacity(0.16), // Your semi-transparent tint
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(color: const Color(0xFF2FC1BE)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF2FC1BE),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.calendar_today, size: 27, color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text('Fri, 16 Dec',style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),),
                                      SizedBox(height: 3,),
                                      Text('Check-out',style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white, // Solid background blocks the shadow from leaking inside!
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2FC1BE).withOpacity(0.16), // Your semi-transparent tint
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: const Color(0xFF2FC1BE)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 32.88,
                                  height: 32.88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF2FC1BE),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.auto_awesome_outlined, size: 23, color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Text('Experience in AR',style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),)
                              ],
                            ),
                            SizedBox(height: 6,),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Take a virtual 360° tour of rooms',style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),),
                            ),
                            SizedBox(height: 10,),
                            TextButton(onPressed: (){
                              Get.to(()=> ArRoomTourScreen(),id: null);
                            }, style: TextButton.styleFrom(
                              fixedSize: Size(284, 35),
                              backgroundColor: Color(0xFF2FC1BE)
                            ),child: Center(
                              child: Text(
                                'Start Tour',style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                              ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Amenities',style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                    ),
                    SizedBox(height: 16,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFF2FC1BE).withOpacity(0.16),
                                border: Border.all(
                                  color: Color(0xFF2FC1BE),
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Icon(Icons.wifi_outlined,size: 26.76,color: Color(0xFF1B8785),),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text('Free Wifi',style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF787879)
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2FC1BE).withOpacity(0.16),
                                  border: Border.all(
                                    color: Color(0xFF2FC1BE),
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Icon(Icons.coffee_outlined,size: 26.76,color: Color(0xFF1B8785),),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text('Breakfast',style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF787879)
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2FC1BE).withOpacity(0.16),
                                  border: Border.all(
                                    color: Color(0xFF2FC1BE),
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Icon(Icons.restaurant,size: 26.76,color: Color(0xFF1B8785),),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text('Restaurant',style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF787879)
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2FC1BE).withOpacity(0.16),
                                  border: Border.all(
                                    color: Color(0xFF2FC1BE),
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Text('P',style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 28.59,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1B8785)
                                ),),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text('Parking',style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF787879)
                            ),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('About',style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                    ),
                    SizedBox(height: 12,),
                    Text('Experience luxury at its finest in the heart of London. Our hotel offers world-class service, elegant rooms, and breathtaking views of the city. Perfect for both business and leisure travelers.',style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF787879)
                    ),),
                    SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Select Room',style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 8, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xFF2FC1BE)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. Image
                          SizedBox(
                            width: 106,
                            height: 95,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: Image.asset(
                                'assets/images/hotelroompic1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Standard Room',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '25 m² • 1 King Bed',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF787879),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: '\$180',style: TextStyle(
                                              fontFamily: GoogleFonts.inter().fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Color(0xFF2FC1BE)
                                          )
                                          ),TextSpan(
                                              text:'/night',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.inter().fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Color(0xFF8F8D8D)
                                              )
                                          )
                                        ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 6),

                          // 3. Match Badge
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFF4ECD76),
                              ),
                              child: Text(
                                '99% Match',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 8, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xFF2FC1BE)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. Image
                          SizedBox(
                            width: 106,
                            height: 95,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: Image.asset(
                                'assets/images/deluxesuite.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deluxe Suite',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '25 m² • 1 King Bed',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF787879),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: '\$350',style: TextStyle(
                                              fontFamily: GoogleFonts.inter().fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Color(0xFF2FC1BE)
                                          )
                                          ),TextSpan(
                                              text:'/night',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.inter().fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Color(0xFF8F8D8D)
                                              )
                                          )
                                        ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 8, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xFF2FC1BE)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. Image
                          SizedBox(
                            width: 106,
                            height: 95,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: Image.asset(
                                'assets/images/familyroom.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deluxe Suite',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '35 m²     •      2 Queens Bed',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF787879),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: '\$300',style: TextStyle(
                                            fontFamily: GoogleFonts.inter().fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Color(0xFF2FC1BE)
                                        )
                                        ),TextSpan(
                                          text:'/night',
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.inter().fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Color(0xFF8F8D8D)
                                          )
                                        )
                                      ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reviews',style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.black
                        ),),
                        Text('See All',style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xFF2FC1BE)
                        ),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF2FC1BE)
                        )
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:47,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFF2FC1BE).withOpacity(0.32),
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text('AH',style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Alex Hales',style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF000000)
                                ),),
                                SizedBox(height: 6,),
                                Text('2 days ago',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0xFF787879)
                                ),),
                                SizedBox(height: 8,),
                                Text('Absolutely amazing experience! The staff was incredibly friendly and the rooms were spotless.',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF787879)
                                ),)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,size: 12,color: Color(0xFFF59E0B),),
                              SizedBox(width: 4,),
                              Text('5.0',style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color(0xFF2FC1BE)
                          )
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:47,
                            height: 46,
                            decoration: BoxDecoration(
                                color: Color(0xFF2FC1BE).withOpacity(0.32),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text('AH',style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Alex Hales',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xFF000000)
                                ),),
                                SizedBox(height: 6,),
                                Text('2 days ago',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0xFF787879)
                                ),),
                                SizedBox(height: 8,),
                                Text('Absolutely amazing experience! The staff was incredibly friendly and the rooms were spotless.',style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF787879)
                                ),)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,size: 12,color: Color(0xFFF59E0B),),
                              SizedBox(width: 4,),
                              Text('5.0',style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
