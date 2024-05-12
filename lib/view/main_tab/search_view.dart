import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _selectedFilter = 'All'; // Initial filter selection

  // List of filter options
  List<String> _filterOptions = [
    'All',
    'Gyms',
    'Trainers',
    'Sports Products',
    // Add more filter options as needed
  ];

  String _searchText = '';
  bool _showSearchHistory = true;
  bool _showFilterList = false; // Flag to control filter list visibility

  // Placeholder for search bar widget
  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchText = value;
          });
        },
      ),
    );
  }

  // Placeholder for recommendations widget
  Widget _buildRecommendations() {
    return _searchText.isNotEmpty
        ? Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recommendations will appear here...',
              style: TextStyle(fontSize: 16),
            ),
          )
        : SizedBox.shrink();
  }

  // Placeholder for search history widget
  Widget _buildSearchHistory() {
    return _showSearchHistory && _searchText.isEmpty
        ? Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search History',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Placeholder for search history list
                Text('Search history items will appear here...'),
                SizedBox(height: 8),
                // Placeholder for clear history button
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement clear history functionality
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Clear History'),
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }

// Placeholder for filter list widget (shown as a drawer)
Widget _buildFilterListDrawer(BuildContext context) {
  return Drawer(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6, // Adjust height as needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(60),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Filter Options',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _filterOptions.map((String filter) {
                return CheckboxListTile(
                  title: Text(filter),
                  value: _selectedFilter.contains(filter),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          _selectedFilter += filter;
                        } else {
                          _selectedFilter = _selectedFilter.replaceAll(filter, '');
                        }
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: RoundButton(title: 'Done', onPressed: (){
              Navigator.pop(context);
            })
          ),
        ],
      ),
    ),
  );
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Open filter list drawer
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildRecommendations(),
          _buildSearchHistory(),
        ],
      ),
      endDrawer: _buildFilterListDrawer(context),
    );
  }
}
