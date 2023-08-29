import 'package:flutter/material.dart';
import 'package:skygoal_task/models/college_data.dart';
import 'package:skygoal_task/pages/college/widgets/about_college.dart';
import 'package:skygoal_task/pages/college/widgets/hostel_facility.dart';

import '../../utils/constants.dart';

class CollegeDetails extends StatefulWidget {
  final CollegeData collegeData;
  const CollegeDetails({super.key, required this.collegeData});

  @override
  State<CollegeDetails> createState() => _CollegeDetailsState();
}

class _CollegeDetailsState extends State<CollegeDetails> {
  ScrollController scrollController = ScrollController();
  bool showTitleOfFlexibleAppBar = false;
  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.offset >= MediaQuery.sizeOf(context).height * 0.2) {
        setState(() {
          showTitleOfFlexibleAppBar = true;
        });
      }
      else {
        setState(() {
          showTitleOfFlexibleAppBar = false;
        });
      }
    
    });
    super.initState();
  }

  List<Tab> getTabs() {
    return const [
        Tab(
          child: Text('About college'),

        ),
        Tab(
          child: Text('Hostel facility'),
          
        ),
        Tab(
          child: Text('Q & A'),
          
        ),
        Tab(
          child: Text('Events'),
          
        ),

    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: getTabs().length,
        child: Stack(
          children: [
            NestedScrollView(
              controller: scrollController,
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        title: showTitleOfFlexibleAppBar ? Text(widget.collegeData.name,style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                          color: Colors.white
                        ),) : null,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Constants.primaryColorTheme,
                        expandedHeight: 520,
                        flexibleSpace: SafeArea(
                      child: FlexibleSpaceBar(
                        background: Container(
                          color: Colors.white,
                          child: Column(
                          children: [

                            //* App BAR 
                            Container(
                              padding: const EdgeInsets.all(12),
                              color: Constants.primaryColorTheme,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                    }, icon: const Icon(Icons.arrow_back)),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                    }, icon: const Icon(Icons.bookmark_outline)),
                                  ),
                                ],
                              ),
                            ),

                            //* COLLEGE IMAGE 
                            Image.asset(widget.collegeData.image,fit: BoxFit.fill,height: 220, width: MediaQuery.sizeOf(context).width,),
                            
                            //* COLLEGE NAME,DESCRIPTION,RATING 
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width * 0.80,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          //* COLLEGE NAME 
                                          child: Text(widget.collegeData.name,style: Theme.of(context).textTheme.titleLarge,),
                                        ),
                                        //* COLLEGE DESCRIPTION 
                                        Text(widget.collegeData.description,maxLines: 4,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium,)
                                      ],
                                    ),
                                  ),
                                  //* RATINGS 
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Column(
                                      children: [
                                        Text(widget.collegeData.ratings.toString(),style: const TextStyle(
                                          color: Colors.white
                                        ),),
                                        const Icon(Icons.star,color: Colors.white,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                      ),
                        ),
                      ),
                      ),

                      //* TAB BAR OF (ABOUT COLLEGE,HOSTEL,Q&A,EVENTS)
                      bottom: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), 
                          child: Padding(
                              padding: const EdgeInsets.only(top:12.0),
                              child: Container(
                                color: Colors.white,
                                child: TabBar(tabs: getTabs())),
                      )),
                    ),
                    ),
                  )
                ];
              }),

              //* TAB VIEW 
              body: Padding(
                padding: const EdgeInsets.only(bottom:70.0),
                child: TabBarView(children: [
                          AboutCollege(collegeData: widget.collegeData,),
                          HostelFacility(collegeData: widget.collegeData,),
                          const Text('Q & A'),
                          const Text('Events'),
                        ]),
              ),
            ),
            
            //* FLOATING APPLY BUTTON 
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 45)
                  ),
                  onPressed: (){}, child: const Text('Apply')),
              ))
          ],
        )
      ),
    );
  }
}