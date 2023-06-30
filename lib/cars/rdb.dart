import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/app_buttons.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Add Vehicle');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(height: 40,),
            const Row(
              children: [
                Icon(Icons.arrow_back_rounded,size: 32,color: Color(0xff277FC1),),
                SizedBox(width: 80),
                Text('My Garage',style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'poppins',
                  color: Color(0xff2A2D37),
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
            Container(height: 25,),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  String vehicleName = snapshot.child('vehicle name').value.toString();
                  String color = snapshot.child('color').value.toString();

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 0.3),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: Border.all(
                        color: const Color(0xffFFFFFF),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.0,
                          blurRadius: 0.0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' $vehicleName',
                          style: const TextStyle(
                            color: Color(0xff2B2F32),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ' $color',
                          style: const TextStyle(
                            color: Color(0xffABAFB1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(height: 1,color:AppColors.lightGrey,),
            Container(

                padding: const EdgeInsets.only(top:15,left: 170,right: 10,bottom: 5),
                child:
                AppButtons(textColor: Colors.white,borderColor:AppColors.blue ,height:56 ,text:'Next',onTap: () {
                }// Handle arrow button tap
                  ,width:200, backgroundColor: const Color(0xff277FC1), size: 10,)
            ),
          ],
        ),
      ),
    );
  }
}
