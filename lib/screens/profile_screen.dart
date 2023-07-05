// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_wheels/auth/signin.dart';
import 'package:food_wheels/screens/screens.dart';
import 'package:food_wheels/widgets/profile_image.dart';

import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.0.h,
              ),
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 4.0.h,
              ),
              const ProfileHeader(),
              const ProfileListView()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: [
            const ProfileListTile(
              text: 'Profile',
              icon: UniconsLine.user_circle,
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
            const ProfileListTile(
              text: 'Recipes',
              icon: UniconsLine.restaurant,
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
            ProfileListTile(
              text: 'Logout',
              icon: UniconsLine.sign_out_alt,
            ),
          ]),
    );
  }
}

class ProfileListTile extends StatefulWidget {
  final String text;
  final IconData icon;

  const ProfileListTile({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  _ProfileListTileState createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text, style: Theme.of(context).textTheme.headline5),
      horizontalTitleGap: 5.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(widget.icon, color: Theme.of(context).iconTheme.color),
      ),
      trailing: Icon(
        UniconsLine.angle_right,
        size: 24.0.sp,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: () {
        if (widget.text == 'Logout' && !isLoading) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Confirmation'),
              content: Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text('Logout'),
                  onPressed: () {
                    Navigator.pop(context); // Close the confirmation dialog
                    _performLogout();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        } else if (widget.text == 'Recipes') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SavedScreen()));
        }
      },
    );
  }

  void _performLogout() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });

      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
      );
    });
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(
            height: 20.0.h,
            image:
                'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80'),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Janet Weaver',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text('janet.weaver@reqres.in',
            style: Theme.of(context).textTheme.headline5),
      ],
    );
  }
}
