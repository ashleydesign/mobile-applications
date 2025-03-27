import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Image.network("https://welcome.miami.edu/_assets/images/homepage-images/experience-um-images/lake-dusk-400x400.jpg",
         width: 400,),
        Text("University of Miami", style: TextStyle(color: Colors.cyan),),
        Text("Lakeside Village at the University of Miami is a modern, sustainable student housing complex on Lake Osceola, offering a mix of apartments and suites, community spaces, and amenities designed to foster a sense of community and well-being.")
      ],
      
    );

    
  }
}