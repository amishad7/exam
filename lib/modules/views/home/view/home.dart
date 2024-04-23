import 'package:flutter/material.dart';
import 'package:untitled1/modules/utils/helper/dbhelper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "your contact list",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: DBHelper.instance.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(snapshot.data![index]['name'].toString()),
                    subtitle: Text(snapshot.data![index]['mail'].toString()),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
