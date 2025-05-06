/// Builds a form field widget based on the field type specified in the input map.
///
/// Takes a Map containing field configuration and returns the appropriate form widget.
/// Supported field types are:
///   - 'text': Creates a text input field
///   - 'number': Creates a numeric input field with number keyboard
///   - 'dropdown': Creates a dropdown selection with options from the field map
///   - 'checkbox': Creates a checkbox with label
///   - Any other type will return an empty SizedBox
///
/// Parameters:
///   field: A Map<String, dynamic> containing at minimum:
///     - 'type': String defining the field type
///     - 'label': String for the field label
///     - 'key': String used to store the value in _formData
///     - 'options': List<String> (required only for 'dropdown' type)
///
/// Returns a Widget appropriate for the specified field type.
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
        onSaved: (val) => _formData[field['key']] = int.tryParse(val ?? ''),
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
      return const SizedBox.shrink();
  }
}
