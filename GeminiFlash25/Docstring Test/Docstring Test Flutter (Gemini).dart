/// Builds a form field widget based on the provided field configuration map.
///
/// This function takes a [Map<String, dynamic>] representing the configuration
/// of a single form field. It inspects the 'type' key within the map to
/// determine which type of Flutter widget to return.
///
/// Supported field types:
/// - 'text': Returns a [TextFormField] for text input. Uses 'label' for the
///   input decoration and 'key' to store the value in `_formData` on save.
/// - 'number': Returns a [TextFormField] configured for number input
///   ([TextInputType.number]). Uses 'label' for the input decoration and
///   'key' to store the parsed integer value in `_formData` on save.
/// - 'dropdown': Returns a [DropdownButtonFormField] for selecting from a
///   list of options. Uses 'label' for the decoration, 'options' (expected
///   to be a `List<String>`) to populate the dropdown items, and 'key' to
///   store the selected value in `_formData` on change.
/// - 'checkbox': Returns a [CheckboxListTile]. Uses 'label' for the title,
///   initializes its value from `_formData` using 'key' (defaults to false),
///   and updates `_formData` with the new boolean value on change using 'key'.
///
/// If the 'type' is not recognized, a [SizedBox.shrink()] is returned.
///
/// The function relies on a mutable `_formData` map (not explicitly passed
/// but used within the closures for `onSaved` and `onChanged`) to store
/// the values of the form fields.
///
/// Args:
///   field: A map containing the configuration for the form field, including
///          at least a 'type' key and typically 'label' and 'key'.
///
/// Returns:
///   A [Widget] corresponding to the configured form field type, or
///   [SizedBox.shrink()] if the type is unsupported.
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
