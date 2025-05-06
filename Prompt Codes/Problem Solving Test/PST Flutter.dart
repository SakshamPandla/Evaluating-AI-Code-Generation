// Fix all the issues with the code given below, with explanations as comments:

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DynamicFormPage()));
}

class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  final List<Map<Widget, dynamic>> _fields = [
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
    return Scafold(
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey
          child: Column(
            children: [
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

  List _buildField(Map<String, dynamic> field) {
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
          onsaved: (val) = _formData[field['key']] = int.tryParse(val ?? ''),
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          items:
          (field['options'] as List<String>)
              .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
              .toList(),
          onChanged: (val) => _formData[field['key']] = val,
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
        return const SizedBox.expand();
    }
  }
}
