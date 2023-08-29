import 'package:flutter/material.dart';
import 'package:skygoal_task/models/college_data.dart';
import 'package:skygoal_task/pages/college/college_details.dart';
import 'package:skygoal_task/widgets/rating_showcase_widget.dart';

class CollegeDetailCard extends StatefulWidget {
  final CollegeData collegeData;
  const CollegeDetailCard({super.key, required this.collegeData});

  @override
  State<CollegeDetailCard> createState() => _CollegeDetailCardState();
}

class _CollegeDetailCardState extends State<CollegeDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context){
            return CollegeDetails(collegeData: widget.collegeData);
         }));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin:  const EdgeInsets.only(top: 12,bottom: 12,left: 30,right: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const[
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.25),
            )
          ]
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              //* IMAGE 
              child: Stack(
                children: [
                  Image.asset(widget.collegeData.image,height: 116,fit: BoxFit.cover,width: MediaQuery.sizeOf(context).width,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: const Icon(Icons.share,color: Colors.black,size: 15,),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: const Icon(Icons.bookmark_outline_outlined,color: Colors.black,size: 15,),
                        ),
                      ],
                    ),
                  )
                ],
              )),

            //* NAME,DESCRIPTION AND RATING  
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //* COLLEGE NAME 
                        Text(widget.collegeData.name,style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        //* COLLEGE DESCRIPTION 
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(widget.collegeData.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [

                      //* RATING 
                      RatingShowcaseWidget(rating: widget.collegeData.ratings,),

                      //* APPLY BUTTON 
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 40)
                        ),
                        onPressed: (){}, child: const Text('Apply')),
                        
                    ],
                  )
                ],
              ),
            ),

            //* DIVIDER 
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),

            //* OTHER INFO LIKE VIEWS AND LIKES 
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12,right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.thumb_up,size: 17,),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.60,
                    child: Text('More than 1000+ students have been placed',maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye,size: 15,),
                      Text(widget.collegeData.views.toString(),style: Theme.of(context).textTheme.bodySmall)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}