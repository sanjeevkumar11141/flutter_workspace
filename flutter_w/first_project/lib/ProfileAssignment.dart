import 'package:flutter/material.dart';

class ProfileAssignment extends StatelessWidget {
  const ProfileAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Stack(
        children: [
          backgroundSection(),
          floatingCardSection(),
        ],
      ),
    );
  }

  Stack floatingCardSection() {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          top: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            color: Colors.white,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Syed Tanvir Ahmad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Instructor at Udemy',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                mediaButtonSection(),
                socialMediaStatSection(),
                const FollowersSection(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0))),
                  onPressed: () {},
                  child: const Text('FOLLOW NOW'),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        roundProfileImage()
      ],
    );
  }

  Positioned roundProfileImage() {
    return Positioned(
      left: 0,
      right: 0,
      top: 50,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'images/profile.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }

  Padding socialMediaStatSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '240',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'FOLLOWING',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '24K',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'FOLLOWER',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding mediaButtonSection() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaButton(
            filled: true,
            icon: Icons.call,
          ),
          SocialMediaButton(
            filled: false,
            icon: Icons.near_me,
          ),
          SocialMediaButton(
            filled: false,
            icon: Icons.share,
          ),
          SocialMediaButton(
            filled: false,
            icon: Icons.sms,
          ),
          SocialMediaButton(
            filled: false,
            icon: Icons.email,
          ),
        ],
      ),
    );
  }

  Column backgroundSection() {
    return Column(
      children: [
        Image.asset(
          'images/background.jpg',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final bool filled;
  final IconData? icon;

  const SocialMediaButton({
    super.key,
    this.filled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: filled ? Colors.blue : null,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.lightBlueAccent)),
      child: Icon(
        icon,
        color: filled ? Colors.white : Colors.black,
      ),
    );
  }
}

class FollowersSection extends StatelessWidget {
  const FollowersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      width: double.infinity,
      height: 120,
      color: Colors.blue.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 250,
            child: Stack(
              //alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 25,
                    child: Icon(Icons.person),
                  ),
                ),
                Positioned(
                  left: 40,
                  child: CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person),
                  ),
                ),
                Positioned(
                  left: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                    child: Icon(Icons.group),
                  ),
                ),
                Positioned(
                  left: 120,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 25,
                    child: Icon(Icons.group_add_outlined),
                  ),
                ),
                Positioned(
                  left: 160,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 25,
                    child: Icon(Icons.group_remove),
                  ),
                ),
                Positioned(
                  left: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 25,
                    child: Icon(Icons.group_add_outlined),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '22 FOLLOWER YOU KNOW',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}