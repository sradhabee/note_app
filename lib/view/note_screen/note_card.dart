
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:note_app/dummy_db.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key, this.onDelete, required this.title, required this.descp, required this.date, this.onEdit, required this.noteColor,
    
  });
  
final void Function()? onDelete;
final void Function()? onEdit;
final String title;
final String descp;
final String date;
final Color noteColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // height: 150,
      // width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: noteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Row(
            children: [
              Text(title,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
              Spacer(),
             IconButton(onPressed: onEdit, icon:  Icon(Icons.edit,color: Colors.black,),),
              SizedBox(width: 8,),
             IconButton(onPressed: onDelete, icon: Icon(Icons.delete,color: Colors.black,),
             
             ),
               SizedBox(width: 8,),
              
              
            ],
          ),
          SizedBox(height: 10,),
          Text(descp,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(date,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),
              SizedBox(width: 12,),
            IconButton(onPressed: (){
             Share.share('$title \n$descp \n$date');
            }, icon:   Icon(Icons.share,color: Colors.black,))
            ],
          )
        ], 
      ),
    );
  }
}