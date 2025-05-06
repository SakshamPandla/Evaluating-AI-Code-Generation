//Code not working as it messed up the DropdownButtonFormField as it changed onChanged to onSaved

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

  // Corrected the list type to use String keys in the map
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
    return Scaffold(
      // Fixed typo: Scafold -> Scaffold
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Added missing comma
          child: Column(
            children: [
              // Each field is mapped to a single widget
              ..._fields.map((field) => _buildField(field)).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    _formKey.currentState?.save();
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: const Text("Form Data"),
                            content: Text(_formData.toString()),
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

  // Corrected return type to Widget and fixed form field implementations
  Widget _buildField(Map<String, dynamic> field) {
    switch (field['type']) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          onSaved: (val) => _formData[field['key']] = val,
        );
      case 'number':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          keyboardType: TextInputType.number,
          // Fixed typo: onsaved -> onSaved and corrected lambda syntax
          onSaved: (val) => _formData[field['key']] = int.tryParse(val ?? ''),
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          // Added value binding to reflect the current state
          value: _formData[field['key']] as String?,
          items:
              (field['options'] as List<String>)
                  .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                  .toList(),
          // Changed to onSaved to trigger during form save
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
        // Return an empty widget instead of expanded to avoid layout issues
        return const SizedBox.shrink();
    }
  }
}
