import 'package:flutter/material.dart';
import 'package:to_do_app/Validator/database.dart';
import 'package:to_do_app/Validator/validator.dart';
import 'package:to_do_app/custom_form_field.dart';

import 'home.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;
  const LoginForm({Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController=TextEditingController();
  final _loginInFormKey=GlobalKey<FormState>();
  String getId="";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginInFormKey,
        child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 24.0),
          child: Column(
            children: [
              CustomFormField(
                  isObscure: true,
                  initialValue:"",
                  controller: _uidController,
                  focusNode: widget.focusNode,
                  KeyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  label:'Unique user id',
                  hint: 'Enter your unique identifier',
                  validator: (value){
                    Validator.validateField(
                      value:value,
                    );
                    getId=value;
                  },
                  ),
            ],
          ),
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 0.0,
                right: 0.0,
              ),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  ),
                ),
                onPressed: (){
                  widget.focusNode.unfocus();
                  if(_loginInFormKey.currentState!.validate()){
                    Database.userId=getId;
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>HomeScreen(),
                    ),
                    );
                  }

                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        ));
  }
}
