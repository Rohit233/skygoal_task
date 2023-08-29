import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skygoal_task/models/college_data.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

class AboutCollege extends StatefulWidget {
  final CollegeData collegeData;
  const AboutCollege({super.key, required this.collegeData});

  @override
  State<AboutCollege> createState() => _AboutCollegeState();
}

class _AboutCollegeState extends State<AboutCollege> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description',style: Theme.of(context).textTheme.titleMedium,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(widget.collegeData.description,style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Colors.grey
                  ),),
                ),
              ],
            ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location',style: Theme.of(context).textTheme.titleMedium,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
             
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                        child: FlutterMap(
                          options: MapOptions(
                            maxZoom: 25,
                            minZoom: 2,
                            zoom: 8.0,
                            center: LatLng(widget.collegeData.lat, widget.collegeData.lng)
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                           ),
                           MarkerLayer(
                            markers: [
                              Marker(point: LatLng(widget.collegeData.lat, widget.collegeData.lng), builder: (context) {
                                return const Icon(Icons.location_on);
                              })
                            ],
                           )
                          ],
                          
                          ),
                      ),
                    )
                  ),
                ],
            ),
             ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Student Review',style: Theme.of(context).textTheme.titleMedium,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0),
                              child: Image.asset('assets/images/student_1.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Image.asset('assets/images/student_2.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Image.asset('assets/images/student_3.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Image.asset('assets/images/student_4.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: HexColor('#E7E6E6'),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(child: Text('12+')) ,
                              ),
                            )

                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(8, 8),
                                blurRadius: 16,
                                spreadRadius: 0,
                                color: Color.fromRGBO(158, 158, 158, 0.10),
                              ),
                              BoxShadow(
                                offset: Offset(-8, -8),
                                blurRadius: 16,
                                spreadRadius: 0,
                                color: Color.fromRGBO(158, 158, 158, 0.10),
                              ),
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Aruna sai',style: Theme.of(context).textTheme.titleMedium,),
                              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec sed lorem nunc varius rutrum eget dolor, quis. Nulla sit magna suscipit tellus malesuada in facilisis a.',
                                 style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: RatingBar.builder(
                              itemCount: 5,
                              itemSize: 17,
                              allowHalfRating: true,
                              initialRating: 4,
                              ignoreGestures: true,
                              unratedColor: Colors.grey.shade200,
                              itemBuilder: (context, index) {
                                return const Icon(Icons.star,color: Colors.yellow,);
                            }, onRatingUpdate: (rating){}),
                          ),
                        )
                      ],
                    )
                  ),
                ],
                         ),
             ),
          
          
          ],
        ),
      ),
    );
  }
}