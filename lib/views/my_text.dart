import 'package:flutter/material.dart';

class MyDropdownExample extends StatefulWidget {
  @override
  _MyDropdownExampleState createState() => _MyDropdownExampleState();
}

class _MyDropdownExampleState extends State<MyDropdownExample> {
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedItem;

  // Define your categories, subcategories, and items here
  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  Map<String, List<String>> subcategories = {
    'Category 1': ['Subcategory A', 'Subcategory B'],
    'Category 2': ['Subcategory X', 'Subcategory Y'],
    'Category 3': ['Subcategory P', 'Subcategory Q'],
  };
  Map<String, Map<String, List<String>>> items = {
    'Category 1': {
      'Subcategory A': ['Item A1', 'Item A2', 'Item A3'],
      'Subcategory B': ['Item B1', 'Item B2', 'Item B3'],
    },
    'Category 2': {
      'Subcategory X': ['Item X1', 'Item X2', 'Item X3'],
      'Subcategory Y': ['Item Y1', 'Item Y2', 'Item Y3'],
    },
    'Category 3': {
      'Subcategory P': ['Item P1', 'Item P2', 'Item P3'],
      'Subcategory Q': ['Item Q1', 'Item Q2', 'Item Q3'],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (category) {
                setState(() {
                  selectedCategory = category;
                  selectedSubCategory = null;
                  selectedItem = null;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Category',
              ),
            ),
            SizedBox(height: 16),
            if (selectedCategory != null)
              DropdownButtonFormField<String>(
                value: selectedSubCategory,
                items: subcategories[selectedCategory!]!.map((subcategory) {
                  return DropdownMenuItem<String>(
                    value: subcategory,
                    child: Text(subcategory),
                  );
                }).toList(),
                onChanged: (subcategory) {
                  setState(() {
                    selectedSubCategory = subcategory;
                    selectedItem = null;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Subcategory',
                ),
              ),
            SizedBox(height: 16),
            if (selectedCategory != null)
              DropdownButtonFormField<String>(
                value: selectedItem,
                items: items[selectedCategory!]![selectedSubCategory!]!
                    .map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedItem = item;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Item',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
