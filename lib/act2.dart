import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for FilteringTextInputFormatter

class Act2 extends StatefulWidget {
  @override
  _Act2State createState() => _Act2State();
}

class _Act2State extends State<Act2> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  int maxNumber = 0;
  bool isButtonEnabled = false;
  bool layoutGenerated = false;

  void generateGrid() {
    setState(() {
      // Convert the input string to a list of integers
      numbers = _controller.text.split('').map((e) => int.parse(e)).toList();
      maxNumber = numbers.reduce((curr, next) => curr > next ? curr : next); // Get the largest number
      layoutGenerated = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive tile sizing
    double screenWidth = MediaQuery.of(context).size.width;
    double blockWidth = screenWidth / (numbers.isNotEmpty ? numbers.length : 1) - 8; // Responsive width calculation

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Grid Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allows only numbers
              ],
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isButtonEnabled ? generateGrid : null,
              child: Text('Generate Layout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isButtonEnabled ? Colors.blueAccent : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            if (!layoutGenerated && !isButtonEnabled)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Waiting for input',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            SizedBox(height: 20),
            if (numbers.isNotEmpty)
              Expanded(
                child: Column(
                  children: List.generate(maxNumber, (rowIndex) {
                    return Expanded(
                      child: Row(
                        children: List.generate(numbers.length, (colIndex) {
                          // Determine if the tile should be green or grey
                          bool isGreen = (maxNumber - rowIndex) <= numbers[colIndex];

                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: isGreen ? const Color.fromARGB(255, 77, 72, 224) : Colors.grey[800],
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(3, 3),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: isGreen
                                    ? Text(
                                        (maxNumber - rowIndex).toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: blockWidth * 0.4, // Responsive font size
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
