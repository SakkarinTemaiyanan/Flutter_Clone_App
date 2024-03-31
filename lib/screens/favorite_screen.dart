import 'package:flutter/material.dart';

import '../model/suggested_follower.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int _currentIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(161, 195, 152, 1.0),
          title: const Text(
            'Activity',
            style: TextStyle(color: Color.fromRGBO(254, 253, 237, 1.0)),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TabBar(
                labelColor: Color.fromRGBO(254, 253, 237, 1.0),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(250, 112, 112, 1.0)),
                onTap: (index) => setState(() => _currentIndexTab = index),
                tabs: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _currentIndexTab == 0
                              ? Colors.transparent
                              : Color.fromRGBO(254, 253, 237, 1.0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Tab(text: 'All'),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _currentIndexTab == 1
                              ? Colors.transparent
                              : Color.fromRGBO(254, 253, 237, 1.0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Tab(text: 'Follows'),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _currentIndexTab == 2
                              ? Colors.transparent
                              : Color.fromRGBO(254, 253, 237, 1.0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Tab(text: 'Replies'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Color.fromRGBO(254, 253, 237, 1.0),
            child: TabBarView(
              children: [
                Column(
                  children: [
                    ...suggestedFollowers.map((follower) {
                      return SuggestedFollowerWidget(follower: follower);
                    }).toList()
                  ],
                ),
                const Center(child: Text('Nothing to see here yet')),
                const Center(child: Text('Nothing to see here yet')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuggestedFollowerWidget extends StatelessWidget {
  const SuggestedFollowerWidget({super.key, required this.follower});

  final SuggestedFollower follower;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(follower.profileImageUrl),
            backgroundColor: Color.fromRGBO(197, 235, 170, 1.0),
          ),
          title: Text(follower.username),
          subtitle: Text(follower.username.toLowerCase()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: 110,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: follower.isFollowing
                    ? const Text(
                        'Following',
                        style: TextStyle(color: Colors.grey),
                      )
                    : const Text('Follow'),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
