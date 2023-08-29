import 'package:flutter/material.dart';
import 'package:skygoal_task/utils/basic_utils.dart';

import '../../../models/top_card_data.dart';
import '../../college/colleges.dart';

class TopCard extends StatefulWidget {
  final TopCardData topCardData;
  const TopCard({super.key, required this.topCardData});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //* OPEAN BOTTOM SHEE CONTAINS SORTING FILTERS 
        BasicUtils.openBottomSheet(context, Container(
          padding: const EdgeInsets.only(left:20,top: 8.0,right: 20),
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sort by',style: Theme.of(context).textTheme.titleMedium,),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.clear))
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Colleges();
                         }));
                      },
                      leading: const Icon(Icons.school_outlined),
                      title: const Text('Bachelor of Technology'),
                      trailing: const Icon(Icons.radio_button_off,),
                    ),
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Colleges();
                         }));
                      },
                      leading: const Icon(Icons.school_outlined),
                      title: const Text('Bachelor of Architecture'),
                      trailing: const Icon(Icons.radio_button_off,),
                    ),
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Colleges();
                         }));
                      },
                      leading: const Icon(Icons.school_outlined),
                      title: const Text('Pharmacy'),
                      trailing: const Icon(Icons.radio_button_off,),
                    ),
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Colleges();
                         }));
                      },
                      leading: const Icon(Icons.school_outlined),
                      title: const Text('Law'),
                      trailing: const Icon(Icons.radio_button_off,),
                    ),
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Colleges();
                         }));
                      },
                      leading: const Icon(Icons.school_outlined),
                      title: const Text('Management'),
                      trailing: const Icon(Icons.radio_button_off,),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 160,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.topCardData.imageString,
                width: MediaQuery.sizeOf(context).width ,
                fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.topCardData.title,style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: Theme.of(context).textTheme.titleMedium?.fontWeight,
                      color: Colors.black
                    ),),
                    Text(widget.topCardData.description,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.elliptical(30, 25))
                ),
                child: Text(widget.topCardData.count,style: Theme.of(context).textTheme.labelSmall,)
              ),
            )
          ],
        ),
      ),
    );
  }
}