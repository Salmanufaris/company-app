import 'package:app/Model/data_model.dart';
import 'package:app/screens/detail_page.dart';
import 'package:flutter/material.dart';

class EmployeeSearch extends SearchDelegate {
  final List<EmployeeModel> employeeList;

  EmployeeSearch(this.employeeList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final List<EmployeeModel> searchResults = employeeList
        .where((employee) =>
            employee.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (searchResults.isEmpty) {
      return const Center(
        child: Text(
          "list is empty",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final data = searchResults[index];
        // ignore: unused_local_variable
        final originalIndex = employeeList.indexOf(data);

        return ListTile(
          title: Text(
            data.name,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            data.category,
            style: const TextStyle(color: Colors.red),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Detailscreen(
                  companyname: "",
                  name: data.name,
                  gender: data.gender,
                  catogery: data.category,
                  email: data.email,
                  number: data.number,
                  image: data.image,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
