import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Validator/database.dart';
import 'package:to_do_app/custom_form_field.dart';
import 'package:to_do_app/Validator/validator.dart';
class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm({Key? key,
    required this.titleFocusNode,
    required this.descriptionFocusNode})
      : super(key: key);

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey=GlobalKey<FormState>();
  bool _isProcessing=false;
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  String getTitle="";
  String getDescription="";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addItemFormKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 24.0
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  CustomFormField(
                    initialValue:"",
                    isLabelEnabled: false,

                      controller: _titleController,
                      focusNode: widget.titleFocusNode,
                      KeyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Title',
                      hint: 'Write your title',
                      validator: (value){
                        Validator.validateField(
                          value:value,
                        );
                        getTitle=value;
                      },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  CustomFormField(
                    initialValue:"",
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    KeyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Description',
                    hint: 'Write your Description',
                    validator: (value){
                      Validator.validateField(
                        value:value,
                      );
                      getDescription=value;
                    },

                  ),


                ],
              ),
            ),
            _isProcessing
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            ): Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10),
                  ),
                  ),
                ),
                onPressed: ()async{
                  widget.titleFocusNode.unfocus();
                  widget.descriptionFocusNode.unfocus();
                  if(_addItemFormKey.currentState!.validate()){
                    setState(() {
                      _isProcessing=true;
                    });
                    await Database.addItem(
                        title: getTitle,
                        description: getDescription,
                    );
                    setState(() {
                      _isProcessing=false;
                    });
                    Navigator.of(context).pop();
                  }


                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16,bottom: 16.0),
                  child: Text(
                    'Add Data',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.blueGrey
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
