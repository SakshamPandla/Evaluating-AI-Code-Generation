import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DynamicFormPage()));
}

class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key: key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  // Fixed: Changed List<Map<Widget, dynamic>> to List<Map<String, dynamic>>
  // The keys in these maps are Strings (like 'label', 'type'), not Widgets
  final List<Map<String, dynamic>> _fields = [
    {'label': 'Name', 'type': 'text', 'key': 'name'},
    {'label': 'Age', 'type': 'number', 'key': 'age'},
    {
      'label': 'Gender',
      'type': 'dropdown',
      'key': 'gender',
      'options': ['Male', 'Female', 'Other'],
    },
    {'label': 'Subscribe', 'type': 'checkbox', 'key': 'subscribe'},
  ];

  @override
  Widget build(BuildContext context) {
    // Fixed: Corrected 'Scafold' to 'Scaffold'
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          // Fixed: Added missing comma after _formKey
          key: _formKey,
          child: Column(
            children: [
              // Fixed: Converted to appropriate return type for map function
              ..._fields.map((field) => _buildField(field)).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Fixed: Changed default from true to false
                    // If currentState is null, we shouldn't proceed with submission
                    _formKey.currentState?.save();
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: const Text("Form Data"),
                            content: Text(_formData.toString()),
                            // Added: Action buttons for better UX
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fixed: Changed return type from List to Widget
  // This function should return a single Widget, not a List
  Widget _buildField(Map<String, dynamic> field) {
    switch (field['type']) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          // Added: Validator to ensure non-empty values
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${field['label']}';
            }
            return null;
          },
          onSaved: (val) => _formData[field['key']] = val,
        );
      case 'number':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          keyboardType: TextInputType.number,
          // Fixed: Corrected 'onsaved' to 'onSaved' and fixed the arrow syntax
          onSaved: (val) => _formData[field['key']] = int.tryParse(val ?? ''),
          // Added: Validator to ensure valid numbers
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${field['label']}';
            }
            if (int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          // Added: Initial value to prevent null errors
          value: _formData[field['key']] as String?,
          items:
              (field['options'] as List<String>)
                  .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                  .toList(),
          onChanged: (val) => setState(() => _formData[field['key']] = val),
          // Added: Using setState to trigger UI update
          // Added: Validator for dropdown
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select ${field['label']}';
            }
            return null;
          },
          onSaved: (val) => _formData[field['key']] = val,
        );
      case 'checkbox':
        return CheckboxListTile(
          title: Text(field['label']),
          value: _formData[field['key']] ?? false,
          onChanged: (val) {
            setState(() {
              _formData[field['key']] = val;
            });
          },
        );
      default:
        return const SizedBox.shrink(); // Fixed: SizedBox.expand() to SizedBox.shrink()
      // SizedBox.expand() would take all available space, which might not be desired
    }
  }
}
