import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PowerCleanDialog(),
              );
            },
            child: Text('Click me')),
      ),
    );
  }
}

class PowerCleanDialog extends StatelessWidget {
  const PowerCleanDialog({super.key});

  List<Map<String, dynamic>> _generateRMList() {
    List<Map<String, double>> rmList = [];
    double percentage = 100.0;
    double weight = 102.9;

    for (int i = 0; i < 35; i++) {
      rmList.add({
        'percentage': percentage,
        'weight': weight,
      });
      percentage -= 2.0;
      weight -= 2.0;
    }
    return rmList;
  }

  @override
  Widget build(BuildContext context) {
    final rmList = _generateRMList();

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _HeaderWidget(),
          _ElementosWidget(rmList: rmList),
          const SizedBox(height: 20),
          _CustomBotton(),
        ],
      ),
    );
  }
}

class _CustomBotton extends StatelessWidget {
  const _CustomBotton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          'Genial',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class _ElementosWidget extends StatelessWidget {
  const _ElementosWidget({
    required this.rmList,
  });

  final List<Map<String, dynamic>> rmList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final width = size.width * 0.5;
    return SizedBox(
      height: 120, // altura para los elementos de la lista
      width: width,

      child: ListView.builder(
        shrinkWrap: true,
        itemCount: rmList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RM ${rmList[index]['percentage'].toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '${rmList[index]['weight'].toStringAsFixed(1)}Kg',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Power Clean',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Here you can find yours RMs',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
