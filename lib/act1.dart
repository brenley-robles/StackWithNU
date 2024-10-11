import 'package:flutter/material.dart';

class Act1 extends StatefulWidget {
  @override
  _Act1State createState() => _Act1State();
}

class _Act1State extends State<Act1> {
  final TextEditingController _rowsController = TextEditingController();
  final TextEditingController _columnsController = TextEditingController();

  int _rows = 0;
  int _columns = 0;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Blocks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rowsController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter a string of numbers',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16), // Added space between the TextFields
            TextField(
              controller: _columnsController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter a string of numbers',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _rows = int.tryParse(_rowsController.text) ?? 0;
                  _columns = int.tryParse(_columnsController.text) ?? 0;
                });
              },
              child: const Text('Generate Layout'),
            ),
            const SizedBox(height: 20),
            _buildRowsAndColumns(),
          ],
        ),
      ),
    );
  }

  Widget _buildRowsAndColumns() {
    if (_rows == 0 || _columns == 0) {
      return const Text('Please enter both rows and columns');
    }

    return Expanded(
      child: Column(
        children: List.generate(_rows, (rowIndex) {
          return Expanded(
            child: Row(
              children: List.generate(_columns, (colIndex) {
                final colorIndex =
                    (rowIndex * _columns + colIndex) % colors.length;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    color: colors[colorIndex],
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
