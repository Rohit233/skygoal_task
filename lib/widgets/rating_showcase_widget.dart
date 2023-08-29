import 'package:flutter/material.dart';

class RatingShowcaseWidget extends StatefulWidget {
  final double rating;
  const RatingShowcaseWidget({super.key, required this.rating});

  @override
  State<RatingShowcaseWidget> createState() => _RatingShowcaseWidgetState();
}

class _RatingShowcaseWidgetState extends State<RatingShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 8.0,right: 8.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Text(widget.rating.toString(),style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              const Icon(Icons.star,color: Colors.white,)
            ],
          ),
        );
  }
}