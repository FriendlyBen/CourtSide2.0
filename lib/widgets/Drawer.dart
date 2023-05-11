import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const Icon(
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
            ),
            ListTile(
              title: const Text('Customer Support'),
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
              title: const Text('Terms and Conditions'),
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
      );
  }
}

