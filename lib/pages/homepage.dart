import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/AppBar.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String title = 'CourtSide 2.0';

  @override
  State<HomePage> createState() => _HomePageState();

  // this is where I initialize state
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 70,
                      ),
                      Positioned(
                          right: 0,
                          bottom: -2,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.blueAccent.withOpacity(0.3),
                          )),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text('Username', style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 20,),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
            ),
            ListTile(
              title: Text('Customer Support'),
              onTap: () async{
                const String url ='https://deriv.com/contact_us/';
                if(await launchUrl(Uri.parse(url))){
                  launchUrl;
                }else{
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              title: Text('Terms and Conditions'),
              onTap: () async{
                const String url='https://deriv.com/terms-and-conditions/';
                if(await launchUrl(Uri.parse(url))){
                  launchUrl;
                }else{
                  throw 'Could not launch $url';
                }
              },
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90)
              ),
              child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)),onPressed: (){}, child: const Text('Logout')))
          ],
        ),
      ),
    );
  }
}
