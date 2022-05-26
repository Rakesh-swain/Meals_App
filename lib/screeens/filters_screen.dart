import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactosefree = false;
  @override
  void initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updatevlaue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updatevlaue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenfree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenfree,
                  (newValue) {
                setState(() {
                  _glutenfree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals', _lactosefree, (newValue) {
                setState(() {
                  _lactosefree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegeterian', 'Only include vegeterian meals', _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
