import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skygoal_task/models/college_data.dart';
import 'package:skygoal_task/pages/college/widgets/bed_widget.dart';
import 'package:skygoal_task/widgets/rating_showcase_widget.dart';

class HostelFacility extends StatefulWidget {
  final CollegeData collegeData;
  const HostelFacility({super.key, required this.collegeData});

  @override
  State<HostelFacility> createState() => _HostelFacilityState();
}

class _HostelFacilityState extends State<HostelFacility> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //* BED COUNT 
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BedWidget(isSelected: true, bedCount: 4),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BedWidget(isSelected: false, bedCount: 3),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BedWidget(isSelected: false, bedCount: 2),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BedWidget(isSelected: false, bedCount: 1),
                ),
              ],
            ),
            //* HOSTEL IMAGES 
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CarouselSlider(items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/hostel_1.jpeg')),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/hostel_2.jpeg')),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/hostel_3.jpeg')),
                
              ], options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 180,
                  initialPage: 1,
              )),
            ),
      
            //* HOSTEL DESCRIPTION
            Column(
              children: [
                //* TITLE & RATING 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Text('GHJK Engineering Hostel',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,)),
                    const RatingShowcaseWidget(rating: 4.2)
                  ],
                ),
                //* LOCATION, ADDRESS
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text('Lorem ipsum dolor sit amet, consectetur',style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),

                //* Description  
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.',
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),

                //* Facilities
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 8.0),
                      child: Text('Facilities',style: Theme.of(context).textTheme.titleMedium),
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance_sharp),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('College in 400mtrs'),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.bathtub_outlined),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Bathrooms : 2'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ) 
              ],
            ) 
          ],
        ),
      ),
    );
  }
}