import 'package:amplitudedemo/search/search%20logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Search_Logic(context),
      child: _SearchScreen(),
    );
  }
}

class _SearchScreen extends StatelessWidget {
  const _SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Search_Logic>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustTextField(),
            Expanded(
              child: ListView(
                children: Search_Logic.searches.map<Widget>((value) {
                  if (provider.controller.text.isEmpty ||
                      value
                          .toLowerCase()
                          .contains(provider.controller.text.toLowerCase()))
                    return ListTile(
                      onTap: () => provider.controller.text = value,
                      title: Text(value),
                      trailing: Icon(Icons.north_west),
                    );
                  return const SizedBox();
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustTextField extends StatelessWidget {
  const CustTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Search_Logic>(context, listen: false);
    return TextField(
      controller: provider.controller,
      textInputAction: TextInputAction.search,
      onEditingComplete: provider.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
            borderRadius: BorderRadius.zero),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.zero,
        ),
        filled: true,
        focusColor: Colors.orange,
        fillColor: Colors.white,
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffix: InkWell(
          onTap: provider.controller.clear,
          child: Icon(Icons.clear),
        ),
        suffixIcon: InkWell(onTap: provider.search, child: Icon(Icons.search)),
      ),
    );
  }
}
