import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'StateManagementTool.dart';

class Crudapp extends StatefulWidget {
  Crudapp({super.key});

  @override
  State<Crudapp> createState() => _CrudappState();
}

class _CrudappState extends State<Crudapp> {

  void _addPost(){
    TextEditingController title_textEditingController = TextEditingController();
    TextEditingController description_textEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context){
          var itemProvider = Provider.of<ItemProvider>(context);
          double screenWidth = MediaQuery.of(context).size.width;
          return AlertDialog(
            shape: Border.all(width: 1),
            title: Text('Add Post',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: CupertinoColors.activeBlue
            ),),
            content:Container(
              width: 300,
              height: 385,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: title_textEditingController,
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: "Enter Title",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1), // Rounded corners
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Light grey background
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: description_textEditingController,
                      decoration: InputDecoration(
                        labelText: "Enter Description",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1), // Rounded corners
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Light grey background
                      ),
                      maxLines: 5, // Allows user to type multiple lines
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(right: 25),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color:CupertinoColors.activeBlue
                            ),),
                        ),),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                          side: MaterialStateProperty.all(BorderSide(color: Colors.blueAccent, width: 2)),
                        ),
                        onPressed: () {
                          itemProvider.addItem(title_textEditingController.text, description_textEditingController.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),

          );
        }
    );
  }

  void _editPost(int index,String title, String body){

    TextEditingController title_textEditingController = TextEditingController(text: title);
    TextEditingController description_textEditingController = TextEditingController(text: body);

    showDialog(
        context: context,
        builder: (BuildContext context){
          var itemProvider = Provider.of<ItemProvider>(context);
          double screenWidth = MediaQuery.of(context).size.width;
          return AlertDialog(
            shape: Border.all(width: 1),
            title: Text('Edit Post',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: CupertinoColors.activeBlue
            ),),
            content:Container(
              width: 300,
              height: 385,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: title_textEditingController,
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: "Enter Title",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1), // Rounded corners
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Light grey background
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: description_textEditingController,
                      decoration: InputDecoration(
                        labelText: "Enter Description",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1), // Rounded corners
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Light grey background
                      ),
                      maxLines: 5, // Allows user to type multiple lines
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(right: 25),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color:CupertinoColors.activeBlue
                            ),),
                        ),),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                          side: MaterialStateProperty.all(BorderSide(color: Colors.blueAccent, width: 2)),
                        ),
                        onPressed: () {
                          itemProvider.updateItem(index, title_textEditingController.text, description_textEditingController.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),

          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: PostAppbar(),
      body: itemProvider.items.isEmpty
          ? Center( child: CircularProgressIndicator() )
          : ListViewBuilder(),
      bottomNavigationBar: PostsBottomAppbar()
    );
  }

  PreferredSizeWidget PostAppbar(){
    return AppBar(
      title: Center(
        child: Text("POSTS"),
      ),
      titleTextStyle: TextStyle(
          color: CupertinoColors.activeBlue,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget ListViewBuilder(){
    var itemProvider = Provider.of<ItemProvider>(context);
    return ListView.builder(
        itemCount: itemProvider.items.length,
        itemBuilder: (context,index){
          var item = itemProvider.items[index];
          return ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 185,
                        child: Tooltip(
                          message: item["title"],
                          textStyle: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          child: Text(
                            item["title"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <IconButton>[
                            IconButton(onPressed: (){
                              _editPost(index,item["title"], item["body"]);
                            },
                              icon: Icon(Icons.edit,color: CupertinoColors.activeBlue),),

                            IconButton(onPressed: (){
                              itemProvider.deleteItem(index);
                            }, icon: Icon(Icons.delete,color: CupertinoColors.destructiveRed,)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(padding: EdgeInsets.only(right: 17),
                  child: SizedBox(
                    width: 350,
                    child: Text(item["body"],textAlign: TextAlign.justify,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
            titleTextStyle: TextStyle( fontWeight: FontWeight.w700, fontSize: 17,
              color: Colors.indigo,),
          );
        });
  }

  Widget PostsBottomAppbar(){
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.blueAccent),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.4), // Soft blue shadow
                  spreadRadius: 1, // Expands the shadow
                  blurRadius: 8, // Soft blur effect
                  offset: Offset(0, 4), // Moves shadow downward
                ),
                BoxShadow(
                  color: CupertinoColors.inactiveGray, // Light black shadow for depth
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: _addPost,
              icon: Icon(
                Icons.add,
                size: 35,
                weight: 65,
                color: Colors.blueAccent, // Matches the border color
              ),
            ),
          )
        ],
      ),
    );
  }
}
