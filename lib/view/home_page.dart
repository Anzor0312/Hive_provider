import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return _scaffold(context);
      },
    );
  }

  Scaffold _scaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("App"),
        ),
        body: Builder(
          builder: (BuildContext context) {
            if (context.watch<HomeProvider>().isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (context.watch<HomeProvider>().error.isNotEmpty) {
              return Center(
                child: Text(context.watch<HomeProvider>().error),
              );
            } else {
              return ListView.builder(
                itemCount: context.watch<HomeProvider>().list!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(context
                        .watch<HomeProvider>()
                        .list![index]
                        .title
                        .toString()),
                  );
                },
              );
            }
          },
        ),
      );
}
