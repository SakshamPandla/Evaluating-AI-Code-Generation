//Code not working as it messed up the DropdownButtonFormField, but its the only AI to get all the comments right

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DynamicFormPage()));
}

class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key: key); // Added key parameter

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  final List<Map<String, dynamic>> _fields = [
    // Changed Map<Widget, dynamic> to Map<String, dynamic>
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
      // Corrected spelling from Scafold to Scaffold
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Added comma after _formKey
          child: Column(
            children: [
              ..._fields.map((field) => _buildField(field)).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Changed ?? true to ?? false
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

  Widget _buildField(Map<String, dynamic> field) {
    // Changed return type from List to Widget
    switch (field['type']) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          onSaved: (val) => _formData[field['key']] = val,
          validator: (val) {
            // Added validator to prevent null values
            if (val == null || val.isEmpty) {
              return 'Please enter ${field['label']}';
            }
            return null;
          },
        );
      case 'number':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          keyboardType: TextInputType.number,
          onSaved:
              (val) =>
                  _formData[field['key']] = int.tryParse(
                    val ?? '',
                  ), // Corrected onsaved to onSaved
          validator: (val) {
            // Added validator to prevent null and non-numeric values
            if (val == null || val.isEmpty) {
              return 'Please enter ${field['label']}';
            }
            if (int.tryParse(val) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          items:
              (field['options'] as List<String>)
                  .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                  .toList(),
          onSaved:
              (val) =>
                  _formData[field['key']] = val, // Changed onChanged to onSaved
          validator: (val) {
            // Added validator to prevent null values
            if (val == null) {
              return 'Please select ${field['label']}';
            }
            return null;
          },
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
        return const SizedBox.shrink(); // Changed SizedBox.expand to SizedBox.shrink
    }
  }
}
