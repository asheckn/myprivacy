import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:myprivacy/constants/palette.dart';
import 'package:myprivacy/widgets/app_bar.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../models/user.dart';
import '../../services/services.dart';


class EditUser extends StatefulWidget {
  EditUser({Key? key, @required required this.user}) : super(key: key);
  User user;

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  User? user;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
    firstNameController.text = widget.user.firstName!;
    lastNameController.text = widget.user.lastName!;
    locationController.text = widget.user.location!;
    dateController.text = widget.user.dateOfBirth!.toString();

  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
          appBar: appBar(context, "Editing: ${widget.user.username}"),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //     child: Text("First Name", textAlign: TextAlign.left,)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value == ""){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      // border: OutlineInputBorder(
                      //     borderRadius: inputRadius,
                      //     borderSide: BorderSide(color: metBlue)
                      // ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value == ""){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      // border: OutlineInputBorder(
                      //     borderRadius: inputRadius,
                      //     borderSide: BorderSide(color: metBlue)
                      // ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value == ""){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: "Location",
                      // border: OutlineInputBorder(
                      //     borderRadius: inputRadius,
                      //     borderSide: BorderSide(color: metBlue)
                      // ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(

                  child: ListTile(
                    trailing: Icon(Icons.edit),
                    onTap: () async {
                    final DateTime? newDate = await showDatePicker(
                     context: context,
                    initialDate: DateTime.now(),
                    firstDate:  DateTime(1900,1,1),
                    lastDate: DateTime(2025, 7),
                    helpText: 'Date of Birth',
            );

            setState(() {
              // dateController.text = DateFormat(DateFormat.YEAR_MONTH_DAY,).format(newDate!.toUtc());
                        user!.dateOfBirth = newDate;
            });
          },
                    title: Text(DateFormat(DateFormat.YEAR_MONTH_DAY,).format(user!.dateOfBirth!)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: saBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    onPressed:  () async {
                      if(_formKey.currentState!.validate()){
                        context.loaderOverlay.show();
                        user!.location = locationController.text;
                        user!.firstName = firstNameController.text;
                        user!.lastName = lastNameController.text;

                        bool result =  await updateUser(user!);
                        context.loaderOverlay.hide();
                        if(result){
                          Navigator.pop(context, true);
                        }
                      }

                    }, child: Text("UPDATE", style: TextStyle(color: Colors.white),)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
