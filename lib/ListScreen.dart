import 'package:flutter/material.dart';
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [

          const Row(
            children: [
              Text(
                'Choose Activity',
                style: TextStyle(
                  fontSize:30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 500,
          child:
          ListView.builder(itemCount:activityList.length,
            itemBuilder:(context,index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Colors.grey,
                  leading: Icon(activityList[index].icon.icon),
                  subtitle: Text(activityList[index].description),
                  title: Text(activityList[index].name),
                ),
              );
            },
          ),

        ),
      ]
      ),
      ),
    );
  }
}
class Activity{
  final String name;
  final String description;
  final Icon icon;
  Activity({
    required this .name,
    required this.description,
    required this.icon,
  });
}
List <Activity>activityList=[
  Activity(name: 'Idea', description: '3 activities available', icon: const Icon(Icons.lightbulb)),
  Activity(name: 'Food', description: '13 activities available', icon: const Icon (Icons.fastfood)),
  Activity(name: 'Work', description: '4 activities available', icon: const Icon(Icons.work)),
  Activity(name: 'Sport', description: '2 activities available', icon:const Icon(Icons.sports_basketball)),
  Activity(name: 'Music', description: '9 activities available', icon: const Icon(Icons.music_video)),


];

