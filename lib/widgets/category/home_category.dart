import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

var mda = ['All', 'Huddi', 'Jacket', 'Pants', 'Sneakers'];

class _HomeCategory extends StatelessWidget {
  final String name;
  const _HomeCategory({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: (){},
        child: Text(name, style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight:FontWeight.normal
        ),),
        style: ElevatedButton.styleFrom(
            primary: Colors.grey[300],
            minimumSize: Size(50, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onPrimary: Colors.yellow
        ),
      ),
    );
  }
}


class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16,),
        Expanded(child: SizedBox(
          height: 32,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mda.length,
              itemBuilder: (BuildContext context, int index){
                return _HomeCategory(name: mda[index]);
              })
        ))
      ],
    );
  }
}
