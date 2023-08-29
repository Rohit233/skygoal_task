import 'package:flutter/material.dart';
import 'package:skygoal_task/models/college_data.dart';
import 'package:skygoal_task/pages/college/widgets/college_detail_card.dart';

import '../../utils/constants.dart';

class Colleges extends StatefulWidget {
  const Colleges({super.key});

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {


  List<CollegeData> listColleges = [
    CollegeData(
      name: "GHJK Engineering college", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.", 
      lat: 19.8762, lng: 75.3433, ratings: 4.4, views: 460, image: 'assets/images/college_1.png'),
    CollegeData(
      name: "Bachelor of Technology", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.", 
      lat: 19.8762, lng: 75.3433, ratings: 4.4, views: 460, image: 'assets/images/college_2.jpeg'),
      
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         SliverList(delegate: SliverChildListDelegate([
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Constants.primaryColorTheme,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              child: SafeArea(
                //* APP BAR 
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search for colleges,schools',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Colors.white)
                                )
                              ),
                            )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                            ),
                            child: IconButton(
                              color: Colors.black,
                              onPressed: (){}, icon: const Icon(Icons.mic)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
         ])),

        //* COLLEGE LIST 
         SliverList.builder(
          itemCount: listColleges.length,
          itemBuilder: (context,int index) {
            return CollegeDetailCard(collegeData: listColleges[index]);
         })
        ],
      )
      
    );
  }
}