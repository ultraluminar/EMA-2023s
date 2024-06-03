// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, one: 'expired 1 day ago', other: 'expired ${count} days ago')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'expires today', one: 'expires in 1 day', other: 'expires in ${count} days')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Fridge Manager"),
        "editProductAddAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Add Product"),
        "editProductEditAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Edit Product"),
        "editProductSaveButtonTooltip":
            MessageLookupByLibrary.simpleMessage("Save Product"),
        "nothingToSeeHereYet":
            MessageLookupByLibrary.simpleMessage("Nothing to see here yet!"),
        "overviewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Fridge Manager"),
        "overviewPageNavigationBarLabel":
            MessageLookupByLibrary.simpleMessage("Overview"),
        "productListTileDescriptionExpired": m0,
        "productListTileDescriptionNotExpired": m1,
        "productsAppBarTitle": MessageLookupByLibrary.simpleMessage("Products"),
        "productsEmptyView": MessageLookupByLibrary.simpleMessage(
            "No todos found with the selected filters."),
        "productsErrorSnackbarText": MessageLookupByLibrary.simpleMessage(
            "An error occurred while loading todos."),
        "productsPageLink":
            MessageLookupByLibrary.simpleMessage("Products Page"),
        "productsPageNavigationBarLabel":
            MessageLookupByLibrary.simpleMessage("Products"),
        "recipesAppBarTitle": MessageLookupByLibrary.simpleMessage("Recipes"),
        "recipesPageNavigationBarLabel":
            MessageLookupByLibrary.simpleMessage("Recipes")
      };
}
