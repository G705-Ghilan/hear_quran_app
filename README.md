
# Hear Quran App 📱
A Flutter app offering a streamlined experience for listening to the Quran, featuring renowned reciters from around the world.
enjoy with open source app 👍

<br>

## Feature ✅

- [x] Theme Configuration: `Light, Dark` 💪
- [x] Multi-Language: `English, Arabic`
- [x] Favories Surahs Feature
- [x] Simple UI 🤝

    
### Project Structure

<details>
    
````

lib
├── core
│   ├── app_route.dart
│   ├── extenstions.dart
│   ├── localization
│   │   ├── app_ar.arb
│   │   ├── app_en.arb
│   │   ├── generated
│   │   │   ├── strings_ar.dart
│   │   │   ├── strings.dart
│   │   │   └── strings_en.dart
│   │   └── localization.dart
│   ├── resources
│   │   ├── images.dart
│   │   ├── resources.dart
│   │   └── theme.dart
│   ├── usecase
│   │   └── usecase.dart
│   └── widgets
│       ├── bloc_player_stream.dart
│       ├── dialogs
│       │   ├── about_dialog.dart
│       │   ├── dialogs.dart
│       │   └── select_lang_dialog.dart
│       ├── headline.dart
│       ├── miniplayer
│       │   ├── custom_progress_bar.dart
│       │   ├── lerp_int.dart
│       │   ├── max_panel.dart
│       │   ├── miniplayer.dart
│       │   ├── miniplayer_wdget.dart
│       │   ├── min_panel.dart
│       │   └── play_icon.dart
│       ├── reciter_item.dart
│       ├── setting_item.dart
│       ├── surah_item.dart
│       ├── widgets.dart
│       └── with_observer.dart
├── dependencies_injection.dart
├── features
│   ├── general
│   │   ├── general.dart
│   │   └── settings
│   │       ├── cubit
│   │       │   ├── settings_cubit.dart
│   │       │   └── settings_state.dart
│   │       └── settings_tab.dart
│   └── quran_player
│       ├── data
│       │   ├── datasource
│       │   │   └── quran_local_datasource.dart
│       │   ├── models
│       │   │   ├── models.dart
│       │   │   ├── reciter_mode.dart
│       │   │   └── surah_model.dart
│       │   └── repository
│       │       └── quran_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   ├── entities.dart
│       │   │   ├── reciter.dart
│       │   │   └── surah.dart
│       │   ├── repository
│       │   │   └── quran_repository.dart
│       │   └── usecases
│       │       ├── get_reciters.dart
│       │       ├── get_reciter_surahs.dart
│       │       └── usecases.dart
│       └── presentation
│           ├── cubit
│           │   ├── quran_player_cubit.dart
│           │   └── quran_player_state.dart
│           ├── navigator_wrapper.dart
│           └── tabs
│               ├── favorites.dart
│               └── home
│                   ├── home.dart
│                   ├── reciters_sub_tab.dart
│                   └── surahs_sub_tab.dart
├── hear_quran_app.dart
├── main.dart
└── services
    ├── audio_player
    │   └── quran_player.dart
    ├── hive
    │   ├── defualts_box_values.dart
    │   ├── enums.dart
    │   ├── hive.dart
    │   ├── main_box.dart
    │   └── main_box_mixin.dart
    ├── permissions_handler
    │   ├── handler.dart
    │   └── permissions_handler.dart
    └── services.dart

````

</details>
