// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/pages/provider_page.dart';
import 'package:riverpod_tutorial/pages/state_provider_page.dart';
import 'counter_page.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                  providerName: 'Provider',
                  color: Colors.pink,
                  index: 0,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                  providerName: 'State Provider',
                  color: Colors.green,
                  index: 1,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                    providerName: 'Future Provider',
                    color: Colors.green,
                    index: 2),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                  providerName: 'Stream Provider',
                  color: Colors.cyan,
                  index: 3,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                  providerName: 'Change Notifier Provider',
                  color: Colors.red,
                  index: 4,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute()
                },
                child: const RiverpodProviders(
                  providerName: 'State Notifier Provider',
                  color: Colors.amber,
                  index: 5,
                ),
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
          //* there will be a switch case here
          //* to navigate to the correct page

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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CounterPage()));
              break;
            case 3:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CounterPage()));
              break;

            default:
              break;
          }
        },
      ),
    );
  }
}
