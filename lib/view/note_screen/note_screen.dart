import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/dummy_db.dart';
import 'package:note_app/view/note_screen/note_card.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descpController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int selectedColorIndex=0;
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          titleController.clear();
          descpController.clear();
          dateController.clear();
          selectedColorIndex=0;
          _customBottomSheet(context);
          
        },
        backgroundColor: Colors.grey.shade300,
        child: Icon(Icons.add),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text("PENPAD",style: TextStyle(color: Colors.pink,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 40,),
              Expanded(child: ListView.separated(itemBuilder: (context, index) => NoteCard(

                //for editing


                onEdit: () {
                  titleController.text=DummyDb.notesList[index]["title"];
                  descpController.text=DummyDb.notesList[index]["descp"];
                  dateController.text=DummyDb.notesList[index]["date"];
                  selectedColorIndex=DummyDb.notesList[index]["colorIndex"];
                  //titleController=TextEditingController(text: DummyDb.notesList[index]["title"]);
                  setState(() {
                    
                  });
                  _customBottomSheet(context,isEdit: true,itemIndex: index);
                },


                //for deletion
                
                
               onDelete: (){
                DummyDb.notesList.removeAt(index);
                setState(() {
                  
                });
               }, descp: DummyDb.notesList[index]["descp"].toString(), title: DummyDb.notesList[index]["title"].toString(), date: DummyDb.notesList[index]["date"].toString(), noteColor: DummyDb.noteColors[DummyDb.notesList[index]["colorIndex"]], 
              ), separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount:DummyDb.notesList.length))
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context,
  {bool isEdit = false,int?itemIndex}) {
    return showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.grey.shade800,
          context: context, builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              
              mainAxisSize: MainAxisSize.min,
              children: [
               
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                      
            
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: descpController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                      
            
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                      
            
                    )
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(width: 10,),

                //build color section
                StatefulBuilder(builder: (context, setColorState) =>  Row(
             children: List.generate(DummyDb.noteColors.length, (index) => Expanded(
               child: InkWell(
                onTap: () {
                  selectedColorIndex=index;
                  setColorState(() {
                    
                  },);
                },
                 child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: selectedColorIndex==index?Border.all(width: 3):null,
                    color: DummyDb.noteColors[index],
                  ),
                 ),
               ),
             ))
                ),),
               
                SizedBox(height: 28,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        setState(() {
                          
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Cancel",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
                      ),
                    ),
                    SizedBox(width: 14,),
                InkWell(
                  onTap:(){
                    isEdit?DummyDb.notesList[itemIndex!]={
                      "title":titleController.text,
                      "descp":descpController.text,
                      "date":dateController.text,
                      "colorIndex": selectedColorIndex 
                    }   :  DummyDb.notesList.add({
                    "title":titleController.text,
                    "descp":descpController.text,
                    "date":dateController.text,
                    "colorIndex":selectedColorIndex
                   });
                  Navigator.pop(context);
                  setState(() {
                    
                  });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        isEdit?"Update":"Save",
                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
                    ),
                ),
                
              ]
              
            ),
            SizedBox(height: 28,),
                      ],),
          ),
        ),);
  }
}
