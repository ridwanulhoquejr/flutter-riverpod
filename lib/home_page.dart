// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/pages/change_notifier_page.dart';
import 'package:riverpod_tutorial/pages/future_provider.dart';
import 'package:riverpod_tutorial/pages/notifier_provider_page.dart';
import 'package:riverpod_tutorial/pages/post_from_api.dart';
import 'package:riverpod_tutorial/pages/provider_page.dart';
import 'package:riverpod_tutorial/pages/state_notifier_provider_page.dart';
import 'package:riverpod_tutorial/pages/state_provider_page.dart';
import 'package:riverpod_tutorial/pages/stream_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<String> _providerNames = [
    'Provider',
    'State Provider',
    'Future Provider',
    'Stream Provider',
    'Change Notifier Provider',
    'State Notifier Provider',
    'Future Notifier Provider',
    'Stream Notifier Provider',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Tutorial'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              RiverpodProviders(
                providerName: 'Provider',
                color: Colors.pink,
                index: 0,
              ),
              SizedBox(height: 10),
              RiverpodProviders(
                providerName: 'State Provider',
                color: Colors.green,
                index: 1,
              ),
              SizedBox(height: 10),
              RiverpodProviders(
                  providerName: 'Future Provider',
                  color: Colors.green,
                  index: 2),
              SizedBox(height: 10),
              RiverpodProviders(
                providerName: 'Stream Provider',
                color: Colors.cyan,
                index: 3,
              ),
              SizedBox(height: 10),
              RiverpodProviders(
                providerName: 'Change Notifier Provider',
                color: Colors.red,
                index: 4,
              ),
              SizedBox(height: 10),
              RiverpodProviders(
                providerName: 'State Notifier Provider',
                color: Colors.amber,
                index: 5,
              ),
              RiverpodProviders(
                providerName: 'Notifier Provider',
                color: Colors.blue,
                index: 6,
              ),
              RiverpodProviders(
                providerName: 'Post From API',
                color: Colors.greenAccent,
                index: 7,
              ),
            ],
          ),
        ));
  }
}

class RiverpodProviders extends StatelessWidget {
  const RiverpodProviders({
    Key? key,
    required this.providerName,
    required this.index,
    required this.color,
  }) : super(key: key);
  final String? providerName;
  final int? index;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(providerName!),
        onPressed: () {
          // there will be a switch case here
          // to navigate to the correct page

          switch (index) {
            case 0:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProviderPage(),
                ),
              );
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StateProviderPage()));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FutureProviderPage()));
              break;
            case 3:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StreamProviderPage()));
              break;
            case 4:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangeNotifierPage()));
              break;
            case 5:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StateNotifierProviderPage()));
              break;
            case 6:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotifierProviderPage()));
              break;
            case 7:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PostFromAPI()));
              break;

            default:
              break;
          }
        },
      ),
    );
  }
}
