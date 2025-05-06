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

  final List<Map<String, dynamic>> _fields = [
    // Fixed: Changed `Map<Widget, dynamic>` to `Map<String, dynamic>` since the field keys are strings, not widgets.
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
      // Fixed: `Scafold` was misspelled. Corrected to `Scaffold`.
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          // Fixed: Added a missing comma after `_formKey`. Dart requires this for proper syntax.
          child: Column(
            children: [
              ..._fields.map((field) => _buildField(field)).toList(),
              // Fixed: `_buildField` return type was incorrect.
              // It should return a `Widget`, not a `List`. Corrected the implementation below.
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

  Widget _buildField(Map<String, dynamic> field) {
    // Fixed: Changed the return type of `_buildField` to `Widget` instead of `List`.
    switch (field['type']) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          onSaved: (val) => _formData[field['key']] = val,
          // Fixed: `onSaved` was not capitalized correctly.
        );
      case 'number':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          keyboardType: TextInputType.number,
          onSaved: (val) => _formData[field['key']] = int.tryParse(val ?? ''),
          // Fixed: `onsaved` was misspelled. Changed to `onSaved`.
          // Fixed: `=` was used instead of `=>` in the lambda function.
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          items:
              (field['options'] as List<String>)
                  .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                  .toList(),
          onChanged: (val) {
            setState(() {
              _formData[field['key']] = val;
            });
          },
          onSaved: (val) => _formData[field['key']] = val,
          // Fixed: Added `onSaved` to save the selected value to `_formData`.
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
        return const SizedBox.shrink();
      // Fixed: Changed `SizedBox.expand` to `SizedBox.shrink` for better handling of unsupported types.
    }
  }
}
