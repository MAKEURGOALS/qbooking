import 'package:flutter/material.dart';
import 'package:qbooking/feature/profile/widget/button_agree_term_provacy.dart';

import '../../../../constant/colors_constant.dart';

class TermHomePage extends StatelessWidget {
  const TermHomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,   
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                color: ColorsConstants.borderAppbarColor,
                height: 1,
              )),
      ),
      body:  const Padding(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Terms & Conditions', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 25,),
              
              Column(
                children: [
                  Text(
                    "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you across our "
                  ,style: TextStyle(fontSize: 16),            
                  ),
                  Row(
                    children: [
                      Text(
                        "website,"
                      ,style: TextStyle(fontSize: 16, color: Colors.blue),            
                      ),
                      Text(
                    "and other sites we own and operate."
                  ,style: TextStyle(fontSize: 16),            
                  ),
                    ],
                  ),
                  
                ],
              ),
              SizedBox(height: 25,),
        
              Text(
                "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used."
              ,style: TextStyle(fontSize: 16),            
              
              ),
              SizedBox(height: 25,),
        
              Text(
                "We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification."
              ,style: TextStyle(fontSize: 16),            
              
              ),
              SizedBox(height: 25,),
        
              Text(
                "We don’t share any personally identifying information publicly or with third-parties, except when required to by law."
              ,style: TextStyle(fontSize: 16),            
              
              ),
        
              SizedBox(height: 100,),
              ButtonTermAndProvacy(titlebtn: "I've accepted this",)
            ],
          ),
        ),
      ),
    );
  }
}