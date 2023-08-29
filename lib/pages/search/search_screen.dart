import 'package:flutter/material.dart';
import 'package:skygoal_task/models/top_card_data.dart';
import 'package:skygoal_task/pages/search/widgets/top_card.dart';

import '../../utils/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* APP BAR 
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Constants.primaryColorTheme,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Find your own way',style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('search in 600 colleges around!',style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                              color: Colors.white
                            ),)
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,color: Colors.white,))
                      ],
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

            //* TOP COLLEGES, SCHOOLS AND EXAMS
            TopCard(topCardData: TopCardData(
              title: 'Top Colleges', 
              description: 'Search through thousands of accredited colleges and universities online to find the right one for you.  Apply in 3 min, and connect with your future.',
              imageString: 'assets/images/search_clg.jpg', count: "126+ colleges"),),

            TopCard(topCardData: TopCardData(
              title: 'Top Schools', 
              description: 'Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.',
              imageString: 'assets/images/search_school.jpg', count: "100+ Schools"),),

            TopCard(topCardData: TopCardData(
              title: 'Exams', 
              description: 'Find an end to end information about the exams that are happening in India',
              imageString: 'assets/images/search_exam.jpg', count: "100+ exams"),)  
          ],
        ),
      ),
    );
  }
}