/// Builds and returns a widget based on the specified field configuration.
///
/// This function takes a map representing a field configuration and returns
/// the appropriate widget for the field type. The supported field types include:
/// - 'text': Returns a `TextFormField` for plain text input.
/// - 'number': Returns a `TextFormField` for numeric input.
/// - 'dropdown': Returns a `DropdownButtonFormField` for selecting options.
/// - 'checkbox': Returns a `CheckboxListTile` for boolean input.
///
/// If the field type is not recognized, it returns an empty `SizedBox`.
///
/// The field map should include the following keys:
/// - 'type': The type of the field (e.g., 'text', 'number', 'dropdown', 'checkbox').
/// - 'label': The label to display for the field.
/// - 'key': The key to store the field's value in the `_formData` map.
/// - 'options': (Optional) A list of options for dropdown fields.
///
/// Example:
/// ```dart
/// final field = {
///   'type': 'text',
///   'label': 'Name',
///   'key': 'name',
/// };
/// final widget = _buildField(field);
/// ```
///
/// @param field A map containing the field configuration.
/// @return A widget corresponding to the field type.
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
