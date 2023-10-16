# Hear Quran App 📱

## Overview
Hear Quran App is a Flutter-based mobile application that offers a seamless experience for listening to the Holy Quran. It features a collection of renowned reciters from around the world, ensuring a diverse and enriching listening experience. As an open-source project, we welcome contributions from developers and users alike to enhance and expand the app's capabilities.

## Installation ✅

### 1. Clone the Repository
Clone the repository to your local machine to get started:
```shell
git clone https://github.com/G705-Ghilan/hear_quran_app.git
```

### 2. Install Packages
Navigate to the project directory and install the required packages:
```shell
cd hear_quran_app
flutter pub get
```

### 3. Run the Application
Ensure your emulator is running and connected to the internet, then execute:
```shell
flutter run
```
> **Note:** Ensure the emulator is connected to the internet to avoid errors from the `just_audio` plugin.

## Features ✅

- Theme Configuration: Supports Light and Dark modes 💪
- Multi-Language Support: `عربي, English, 中文, Deutsch, Türkçe, Français, Español`
- Favorites Surahs Feature ♥️
- Background Playback 💯
- Local Surahs Saving ✅
- Offline Mode
- Intuitive and User-Friendly UI 🤝


## To-Do 🚀

- ❌ Fix `just_audio` errors when opening the app without an internet connection
- ❌ Improve the app's structural organization for enhanced readability and maintainability
- ❌ Optimize app performance for a smoother user experience
- ✅ Support android 13 [`FIXED`]


![file](https://lottie.host/de8d3212-571c-4ecc-9f8a-48aa43bdba69/qav7y8nP75.json)
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://lottie.host/de8d3212-571c-4ecc-9f8a-48aa43bdba69/qav7y8nP75.json" background="##fff" speed="1" style="width: 300px; height: 300px" loop controls autoplay direction="1" mode="normal"></lottie-player>


## Project Structure


<details>

```
lib 
├── core
│   ├── app_route.dart
│   ├── extenstions.dart
│   ├── localization
│   │   ├── app_ar.arb
│   │   ├── app_de.arb
│   │   ├── app_en.arb
│   │   ├── app_es.arb
│   │   ├── app_fr.arb
│   │   ├── app_tr.arb
│   │   ├── app_zh.arb
│   │   ├── generated
│   │   │   ├── strings_ar.dart
│   │   │   ├── strings.dart
│   │   │   ├── strings_de.dart
│   │   │   ├── strings_en.dart
│   │   │   ├── strings_es.dart
│   │   │   ├── strings_fr.dart
│   │   │   ├── strings_tr.dart
│   │   │   └── strings_zh.dart
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
│       │   ├── offline_hint_dialog.dart
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
│   │   ├── permissions
│   │   │   └── permissions_page.dart
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

```

</details>



## Contributing

We warmly welcome contributions from the community. If you would like to contribute to the enhancement of Hear Quran App, please fork the repository and submit your pull requests. We are excited to collaborate with passionate individuals like you!

## License

Hear Quran App is open-source and available under the MIT license

