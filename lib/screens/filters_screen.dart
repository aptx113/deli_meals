import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.currentFilter, required this.saveFilters})
      : super(key: key);
  static const routeName = '/filters';

  final Map<String, bool> currentFilter;
  final Function(Map<String, bool>) saveFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'] ?? false;
    _vegetarian = widget.currentFilter['vegetarian'] ?? false;
    _vegan = widget.currentFilter['vegan'] ?? false;
    _lactoseFree = widget.currentFilter['lactose'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, bool currentValue,
          String description, void Function(bool) updateValue) =>
      SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile(
                  'Gluten-free',
                  _glutenFree,
                  'Only include gluten-free meals.',
                  (newValue) => setState(() {
                        _glutenFree = newValue;
                      })),
              _buildSwitchListTile(
                  'Lactose-free',
                  _lactoseFree,
                  'Only include lactose-free meals.',
                  (newValue) => setState(() {
                        _lactoseFree = newValue;
                      })),
              _buildSwitchListTile(
                  'Vegetarian',
                  _vegetarian,
                  'Only include vegatarian meals.',
                  (newValue) => setState(() {
                        _vegetarian = newValue;
                      })),
              _buildSwitchListTile(
                  'Vegan',
                  _vegan,
                  'Only include vegan meals.',
                  (newValue) => setState(() {
                        _vegan = newValue;
                      }))
            ]),
          )
        ],
      ),
    );
  }
}
