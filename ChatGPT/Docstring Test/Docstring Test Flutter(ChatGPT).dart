/// Builds a form field widget based on the provided field information.
///
/// The function checks the 'type' key in the `field` map to determine which widget to build.
/// It supports the following types: 'text', 'number', 'dropdown', and 'checkbox'.
/// Each widget is configured based on the associated `label`, `key`, and other relevant data in the `field` map.
///
/// - 'text': Builds a `TextFormField` for text input.
/// - 'number': Builds a `TextFormField` for numeric input with a number keyboard.
/// - 'dropdown': Builds a `DropdownButtonFormField` for selecting an option from a list.
/// - 'checkbox': Builds a `CheckboxListTile` for boolean selection.
///
/// The created widgets are linked to `_formData` through the `onSaved` or `onChanged` callback,
/// which updates the corresponding value in the `_formData` map based on the field's `key`.
///
/// Returns the appropriate widget or an empty `SizedBox` if the field type is unknown.
///
/// Parameters:
///   - [field]: A map containing the field configuration with keys such as 'type', 'label', 'key', and 'options'.
///
/// Returns:
///   - A widget corresponding to the field type.
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
