import 'package:flutter/material.dart';

// Search Page
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String _search_input = '';

  _SearchPageState() {
    _textController.addListener(_searchListen);
  }

  void _searchListen() {
    try {
      if (_textController.text.isEmpty) {
        _search_input = "nothing";
      } else {
        _search_input = _textController.text;
      }
    } catch (error) {
      //it keeps bringing NoSuchMethodError on restart.
      print('$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _search();
                  //make the search
                },
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                  clearText();
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
      )),
    );
  }

  void clearText() {
    _textController.clear();
  }

  void _search() {
    print('The user wants to search for $_search_input'); //function for search
  }
}
