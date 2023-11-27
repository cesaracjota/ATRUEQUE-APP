import 'package:flutter/material.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({Key? key}) : super(key: key);

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  List<String> selectedCategories = [];

  List<Category> categories = [
    Category("Icono1", "Categoría 1"),
    Category("Icono2", "Categoría 2"),
    Category("Icono3", "Categoría 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona Categorías'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.category),
                    title: Text(categories[index].title),
                    trailing: Checkbox(
                      value:
                          selectedCategories.contains(categories[index].title),
                      onChanged: (value) {
                        setState(() {
                          if (value != null && value) {
                            selectedCategories.add(categories[index].title);
                          } else {
                            selectedCategories.remove(categories[index].title);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/main', arguments: selectedCategories);
                  },
                  child: const Text('Omitir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/main', arguments: selectedCategories);
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String icon;
  final String title;

  Category(this.icon, this.title);
}
