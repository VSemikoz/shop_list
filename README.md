Shop list app
Features:
 - Data contain only in local db(drift)
 - Export/import from/into data.json file that store in file system
 - Lists color scheme editing (images in future)
 - Localization onn en/ru 

## Initialization:

`flutter pub run build_runner watch --delete-conflicting-outputs`
init localization - `flutter packages pub global activate intl_utils && flutter pub global run intl_utils:generate`