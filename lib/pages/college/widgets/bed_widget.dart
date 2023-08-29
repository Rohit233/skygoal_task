import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class BedWidget extends StatelessWidget {
  final bool isSelected;
  final int bedCount;
  const BedWidget({super.key, required this.isSelected, required this.bedCount});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 70,
              height: 35,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Constants.primaryColorTheme),
                color: isSelected ? Constants.primaryColorTheme : null,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bedroom_child_rounded,color: isSelected ?Colors.white : null ,),
                  Text(bedCount.toString(),style: TextStyle(
                    color: isSelected ? Colors.white : null
                  ),)
                ],
              ),
            );
  }
}