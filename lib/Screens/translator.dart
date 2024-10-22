import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController _controller = TextEditingController();
  String _translatedText = '';
  String _selectedLanguage = 'es'; // Default to Spanish

  void _translate() async {
    final translator = GoogleTranslator();
    final translation = await translator.translate(_controller.text, to: _selectedLanguage);
    setState(() {
      _translatedText = translation.text;
    });
  }

  Widget _buildNeumorphicContainer(Widget child, {Color? color}) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200], // Default light background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Translator',style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
         
          decoration: BoxDecoration(
            
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildNeumorphicContainer(
                TextField(
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter text to translate',
                    labelStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none, // Remove default border
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildNeumorphicContainer(
                DropdownButton<String>(
                  value: _selectedLanguage,
                  isExpanded: true,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  underline: SizedBox(),
                  items: [
                    DropdownMenuItem(value: 'es', child: Text('Spanish')),
                    DropdownMenuItem(value: 'fr', child: Text('French')),
                    DropdownMenuItem(value: 'de', child: Text('German')),
                    DropdownMenuItem(value: 'zh', child: Text('Chinese')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              _buildNeumorphicContainer(
                ElevatedButton(
                  onPressed: _translate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green background
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Translate',
                    style: TextStyle(fontSize: 18, color: Colors.black), // Black text
                  ),
                ),
                color: Colors.green.shade200, // Lighter green for the neomorphic effect
              ),
              SizedBox(height: 30),
              Text(
                'Translated Text:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 10),
              _buildNeumorphicContainer(
                Text(
                  _translatedText.isNotEmpty ? _translatedText : 'No translation yet.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
