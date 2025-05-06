//Didnt fix super (key:key) even after telling it, that its wrong

import 'package:flutter/material.dart';

void main() {
  // The main function is the entry point of the application.
  runApp(const MaterialApp(home: DynamicFormPage()));
}

// DynamicFormPage is a StatefulWidget because its content (the form fields) can change based on user interaction.
class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  // _formKey is used to uniquely identify the Form widget and allow validation and saving.
  final _formKey = GlobalKey<FormState>();
  // _formData will store the values entered by the user in the form fields.
  final Map<String, dynamic> _formData = {};

  // _fields is a list of maps, where each map describes a form field.
  // The keys 'label', 'type', and 'key' are used to configure the field.
  // 'options' is used specifically for dropdown fields.
  final List<Map<String, dynamic>> _fields = const [
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
      // Fix 1: Corrected the typo from 'Scafold' to 'Scaffold'.
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key:
              _formKey, // Fix 2: Added a comma after _formKey to separate it from the child property.
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .stretch, // Fix 3: Added crossAxisAlignment to stretch the form fields horizontally.
            children: [
              // Dynamically build form fields based on the _fields list.
              ..._fields.map((field) => _buildField(field)).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before saving.
                  if (_formKey.currentState?.validate() ?? false) {
                    // Fix 4: Changed the default value for validate() from true to false. If validate() returns null, it means the form is not ready or doesn't exist, so validation should fail.
                    _formKey.currentState?.save();
                    // Show a dialog with the collected form data.
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

  // _buildField is a helper function that returns the appropriate widget based on the field type.
  Widget _buildField(Map<String, dynamic> field) {
    // Fix 5: Changed the return type from List to Widget because each case returns a single widget.
    switch (field['type']) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(labelText: field['label']),
          onSaved: (val) => _formData[field['key']] = val,
          // Optional: Add validator for text fields
          validator: (value) {
            if (value == null || value.isEmpty) {
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
                  ), // Fix 6: Corrected the typo from 'onsaved' to 'onSaved' and added null check and default empty string for int.tryParse.
          // Optional: Add validator for number fields
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
        // Initialize the dropdown value in _formData if it's not already present.
        // This prevents an error if the user doesn't interact with the dropdown.
        if (!_formData.containsKey(field['key'])) {
          _formData[field['key']] =
              null; // Or a default value from options if applicable
        }
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: field['label']),
          items:
              (field['options'] as List<String>)
                  .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                  .toList(),
          onChanged: (val) {
            setState(() {
              // Fix 7: Wrapped onChanged in setState to update the UI when the dropdown value changes.
              _formData[field['key']] = val;
            });
          },
          onSaved:
              (val) =>
                  _formData[field['key']] =
                      val, // Fix 8: Added onSaved for the dropdown to ensure the selected value is saved when form.save() is called.
          value:
              _formData[field['key']]
                  as String?, // Fix 9: Set the initial value of the dropdown from _formData and cast it to String?
          // Optional: Add validator for dropdown fields
          validator: (value) {
            if (value == null) {
              return 'Please select a ${field['label']}';
            }
            return null;
          },
        );
      case 'checkbox':
        // Initialize the checkbox value in _formData if it's not already present.
        if (!_formData.containsKey(field['key'])) {
          _formData[field['key']] = false;
        }
        return CheckboxListTile(
          title: Text(field['label']),
          value:
              _formData[field['key']]
                  as bool?, // Fix 10: Cast the value to bool? to match the CheckboxListTile value type.
          onChanged: (val) {
            setState(() {
              _formData[field['key']] = val;
            });
          },
          // CheckboxListTile doesn't have an onSaved property in the same way as TextFormField or DropdownButtonFormField.
          // The value is already being updated in the _formData map via setState in onChanged.
        );
      default:
        return const SizedBox.shrink(); // Fix 11: Changed SizedBox.expand to SizedBox.shrink to avoid taking up unnecessary space for unknown field types.
    }
  }
}
