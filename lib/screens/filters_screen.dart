import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
