import 'package:flutter/material.dart';
import 'package:to_do_app/Validator/database.dart';
import 'package:to_do_app/screens/app_bar.dart';
import 'package:to_do_app/screens/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  EditScreen({
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId
  });




  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _titleFocusNode=FocusNode();
  final FocusNode _descriptionFocusNode=FocusNode();
  bool _isDeleting=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF2C384A),
          title: AppBarTitle(
            sectionName: 'CRUD',
          ),
          actions: [
            _isDeleting ?
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,right: 16.0,),
                  child:CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.redAccent
                    ),
                    strokeWidth: 3,
                  ),
                ) :IconButton(
                onPressed: ()async{
                  setState(() {
                    _isDeleting=true;
                  });
                  await Database.deleteItem(
                      docId: widget.documentId,
                  );
                  setState(() {
                    _isDeleting=false;
                  });
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete_forever,color: Colors.redAccent,size: 32.0,))
    ]
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
              child: EditItemForm(
                documentId: widget.documentId,
                titleFocusNode:_titleFocusNode,
                descriptionFocusNode:_descriptionFocusNode,
                currentTitle:widget.currentTitle,
                currentDescription:widget.currentDescription
              ),
            ))

      ),
    );
  }
}
