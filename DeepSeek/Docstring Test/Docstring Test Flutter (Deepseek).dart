/// Builds a form widget based on the configuration provided in the [field] map.
///
/// The [field] map must contain a 'type' key specifying which widget to create:
/// - 'text': Creates a [TextFormField] with a text input. Requires 'label' and 'key'.
/// - 'number': Creates a [TextFormField] with numeric input. Requires 'label' and 'key'.
/// - 'dropdown': Creates a [DropdownButtonFormField] with options from 'options' list.
///   Requires 'label', 'key', and 'options' (List<String>).
/// - 'checkbox': Creates a [CheckboxListTile] that toggles a boolean value.
///   Requires 'label' and 'key'.
///
/// The generated widgets automatically save their values to the [_formData] map using
/// the specified 'key'. Unsupported types return an empty [SizedBox.shrink].
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
