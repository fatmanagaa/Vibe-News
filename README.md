# 🗞️ Vibe News — Flutter News App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC%2FCubit-blue)](https://pub.dev/packages/flutter_bloc)
[![Retrofit](https://img.shields.io/badge/Networking-Retrofit-red)](https://pub.dev/packages/retrofit)
[![License](https://img.shields.io/badge/License-MIT-green)](#-license)

A modern, high-performance Flutter News App built with **Dart**, following **Clean Architecture principles**. It leverages **BLoC/Cubit** for feature-specific state management, **Injectable + GetIt** for Dependency Injection, and **Retrofit** for robust networking.

---

## 📌 Project Overview

**Vibe News** provides a seamless experience for discovering the latest news across various categories. The project is engineered for scalability and maintainability, utilizing industry-standard patterns for data handling and UI updates.

---

## ✨ Features

- 🧭 **Category-based Browsing**: Explore news tailored to specific interests (Sports, Technology, Business, etc.).
- 🌗 **Theme Support**: Fully integrated Light and Dark modes.
- 📱 **Responsive UI**: Optimized for different screen sizes using `flutter_screenutil`.
- 📂 **Custom Drawer**: Easy navigation between Home and settings.
- 💉 **Dependency Injection**: Decoupled components using `GetIt` and `Injectable`.
- ♻️ **Clean Architecture**: Clear separation of concerns between Data, Core, and Presentation layers.

---

## 🧱 Architecture & Patterns

This project follows a **Clean Architecture** approach with a **Feature-first structure**:

- **Presentation Layer**: 
  - UI screens and widgets.
  - State management using **Cubit** for feature logic (News, Sources).
  - **Provider** for global app settings like Theme and Language.
- **Data Layer**: 
  - **Repositories**: Abstracted data access.
  - **Data Sources**: Remote (Retrofit) and Local (Hive placeholders).
  - **Models**: JSON serialization using `json_serializable`.
- **Core Layer**: Shared utilities, theme configurations, constants, and extensions.

---

## 🗂️ Folder Structure

```bash
lib/
├── api/
│   ├── retrofit/          # Retrofit services and generated models
│   ├── api_constants.dart
│   ├── api_endpoints.dart
│   └── api_manger.dart     # Legacy/Alternative API handling
├── core/
│   └── utils/             # Themes, Colors, Styles, and Extensions
├── data/
│   └── repository/        # Repository implementations and Data Sources
├── di/                    # Dependency Injection configuration
├── features/
│   ├── splash_screen/
│   └── home/
│       ├── category_fragment/
│       ├── category_details/ # BLoC/Cubit implementations
│       ├── news/             # BLoC/Cubit implementations
│       └── drawer/
├── model/                 # Shared data models
├── providers/             # Global setting providers (Theme, Language)
└── main.dart
```

---

## 🛠️ Technologies Used

| Category | Stack |
|---|---|
| **Framework** | Flutter |
| **State Management** | BLoC / Cubit & Provider |
| **Networking** | Retrofit & Dio |
| **Dependency Injection** | GetIt & Injectable |
| **Serialization** | Json Serializable |
| **UI Utilities** | flutter_screenutil, google_fonts, cached_network_image |
| **Local Storage** | Hive |

---

## 🚀 Installation & Setup

### 1) Clone the repository
```bash
git clone https://github.com/fatmanagaa/Vibe-News.git
cd Vibe-News
```

### 2) Install dependencies
```bash
flutter pub get
```

### 3) Generate boilerplate code (Retrofit/Injectable)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4) Run the app
```bash
flutter run
```

---

## 🧠 State Management Strategy

- **Cubit (flutter_bloc)**: Used for handling data-driven states in features like `NewsWidgetByCubit` and `CategoryDetailsMvvmBloc`. It manages the loading, success, and error states for network requests.
- **Provider**: Used for lightweight, app-wide states such as `AppThemeProvider` and `AppLanguageProvider`.
- **BlocObserver**: Custom `MyBlocObserver` is implemented to monitor state transitions globally.

---

## 🛣️ Future Roadmap

- 🔍 **Search Functionality**: Implement full-text search for news articles.
- 📖 **Article Details**: Add a dedicated screen for full article reading.
- 🌍 **Localization**: Complete the implementation for multi-language support.
- 💾 **Offline Caching**: Fully implement Hive for offline news reading.
- 🧪 **Testing**: Add unit and widget tests for BLoC and Repositories.

---

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 📬 Contact

- GitHub: [@fatmanagaa](https://github.com/fatmanagaa)
