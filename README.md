# 📰 Vibe News

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Provider](https://img.shields.io/badge/State%20Management-Provider-7B1FA2)](https://pub.dev/packages/provider)
[![Dio](https://img.shields.io/badge/Networking-Dio-0F63F4)](https://pub.dev/packages/dio)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-00A86B)](#-architecture)
[![License](https://img.shields.io/badge/License-Unspecified-lightgrey)](#-license)

> A professional Flutter news application focused on clean structure, reusable UI components, responsive design, and a smooth reading experience across themes and device sizes.

## ✨ Overview

**Vibe News** is a Flutter and Dart project that delivers category-based news content through a polished, modern interface. The app is organized using clean architecture principles, uses **Provider** for app-level state management, and integrates with a REST API using **Dio** and HTTP-based services.

It is designed to be a strong starter architecture for scalable Flutter apps, with clear separation of concerns, reusable widgets, and a feature-first structure that is easy to maintain and extend.

## 🚀 Features

| Feature | Status | Notes |
| --- | --- | --- |
| 🗂️ Browse news by categories | ✅ Available | Includes categories like General, Business, Sports, Health, Entertainment, Science, and Technology |
| 📰 Explore articles by source | ✅ Available | Category sources are displayed in tabs, then mapped to article feeds |
| 🌗 Light and Dark mode | ✅ Available | Theme switching is managed through Provider |
| 🌍 Multi-language foundation | 🛠️ In progress | Language provider exists and can be extended with full localization |
| 🔎 Search for news articles | 🛠️ Planned | A dedicated search flow can be added on top of the existing API layer |
| 📄 Article details screen | 🛠️ Planned | Article cards are already separated into reusable widgets |
| 📱 Responsive UI | ✅ Available | Uses `flutter_screenutil` and flexible layouts |
| 🧭 Custom Drawer navigation | ✅ Available | Includes navigation plus app settings access |
| ♻️ Reusable components | ✅ Available | Shared widgets, theme tokens, assets, and styles improve maintainability |

## 🎬 Demo

Add your screen recording or hosted demo link here:

- **Live Demo / Recording:** [Coming Soon](https://your-demo-link-here)
- **Alternative:** Upload a GIF or MP4 preview in `assets/screenshots/` and link it here

## 🖼️ Screenshots

> Replace the placeholders below with your final app screenshots or exported device frames.

| Splash Screen | Home Screen | Category Feed |
| --- | --- | --- |
| `![Splash](path/to/splash-screen.png)` | `![Home](path/to/home-screen.png)` | `![Category](path/to/category-feed.png)` |

| Dark Mode | Drawer | Article View |
| --- | --- | --- |
| `![Dark Mode](path/to/dark-mode.png)` | `![Drawer](path/to/drawer.png)` | `![Article](path/to/article-details.png)` |

### Example screenshot markdown placeholders

```md
![Splash Screen](path/to/splash-screen.png)
![Home Screen](path/to/home-screen.png)
![Category Screen](path/to/category-screen.png)
![Dark Mode Screen](path/to/dark-mode-screen.png)
![Drawer Navigation](path/to/drawer-screen.png)
![Article Details](path/to/article-details-screen.png)
```

## 🏗️ Architecture

The project follows **clean architecture principles** with a practical Flutter-friendly structure:

- **Presentation layer**: screens, feature widgets, drawer flow, tabs, reusable UI
- **State layer**: `Provider`-based theme and language state
- **Data layer**: API managers, Dio configuration, REST calls, and response models
- **Core/shared layer**: app routes, themes, assets, colors, styles, and extensions

### Architecture goals

- Clear separation of responsibilities
- Reusable and testable UI building blocks
- Easy feature expansion without tightly coupling modules
- Readable project layout for collaboration and scaling

## 📁 Folder Structure

```text
lib/
├── api/
│   ├── dio/
│   │   └── dio_manager.dart
│   ├── api_constants.dart
│   ├── api_endpoints.dart
│   └── api_manger.dart
├── core/
│   └── utils/
│       ├── app_assets.dart
│       ├── app_colors.dart
│       ├── app_routes.dart
│       ├── app_styles.dart
│       ├── app_theme.dart
│       └── extensions/
├── features/
│   ├── home/
│   │   ├── category_details/
│   │   ├── category_fragment/
│   │   ├── drawer/
│   │   ├── news/
│   │   ├── widget/
│   │   └── home_screen.dart
│   └── splash_screen/
├── model/
├── providers/
└── main.dart
```

## 🧰 Technologies Used

| Category | Stack |
| --- | --- |
| Framework | Flutter |
| Language | Dart |
| Architecture | Clean Architecture principles |
| State Management | Provider |
| Networking | Dio, HTTP, REST API |
| Image Loading | Cached Network Image |
| Responsive UI | flutter_screenutil |
| Fonts | google_fonts |
| Platforms | Android, iOS, Web, Windows, macOS, Linux |

## ⚙️ Installation and Setup

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- Android Studio, VS Code, or another Flutter-compatible IDE
- A News API key

### 1) Clone the repository

```bash
git clone https://github.com/fatmanagaa/Vibe-News.git
cd Vibe-News
```

### 2) Install dependencies

```bash
flutter pub get
```

### 3) Configure the API key

Update the API key used by the app in:

```text
lib/api/api_constants.dart
```

> For production apps, move secrets to a secure configuration strategy instead of keeping them directly in source code.

### 4) Run the app

```bash
flutter run
```

### 5) Optional quality checks

```bash
flutter analyze
flutter test
```

## 📦 Dependencies

### Core dependencies

| Package | Purpose |
| --- | --- |
| `provider` | App-wide state management |
| `dio` | Modern REST API client |
| `http` | Additional HTTP service layer |
| `cached_network_image` | Efficient remote image loading and caching |
| `flutter_screenutil` | Responsive sizing across devices |
| `google_fonts` | Typography customization |
| `flutter_native_splash` | Splash screen generation |

### Dev dependencies

| Package | Purpose |
| --- | --- |
| `flutter_lints` | Recommended static analysis rules |
| `flutter_test` | Widget and unit testing support |

## 🔌 API Integration

The app consumes news data from a REST API and separates networking concerns into dedicated service files.

### Current API flow

1. `api_constants.dart` stores the base URL and API key
2. `api_endpoints.dart` centralizes endpoint paths
3. `api_manger.dart` and `dio/dio_manager.dart` perform remote requests
4. `model/` classes map JSON responses into Dart objects
5. Feature widgets render category sources and article lists from async responses

### Why this structure works well

- Keeps API logic away from UI code
- Makes future refactoring easier
- Improves readability and maintainability
- Simplifies reuse across new features like search or bookmarks

## 🧠 State Management

`Provider` is used for lightweight, scalable state handling.

### Providers in the project

| Provider | Responsibility |
| --- | --- |
| `AppThemeProvider` | Manages light and dark theme mode |
| `AppLanguageProvider` | Holds the current app language and language switching hooks |

This approach keeps global app preferences centralized while allowing the UI to reactively rebuild when settings change.

## 🔮 Future Improvements

- Add a dedicated **search experience** for articles and sources
- Create a full **article details screen** with web view or deep linking
- Complete **localization** and integrate Flutter internationalization
- Move API secrets to a safer runtime configuration approach
- Add **offline caching** and saved articles
- Improve test coverage for providers, networking, and widgets
- Introduce repository/use-case abstractions for deeper clean architecture layering

## 🤝 Contributing

Contributions are welcome and appreciated.

1. Fork the repository
2. Create a feature branch
3. Make your changes with clear commit messages
4. Run analysis and tests
5. Open a pull request describing your improvements

If you are contributing UI enhancements, screenshots or short demo recordings are highly encouraged.

## 📄 License

This repository does not currently include a license file.

If you plan to make the project open for public reuse, add a license such as **MIT**, **Apache-2.0**, or another option that fits your needs.

## 📬 Contact

Feel free to connect or customize the placeholders below:

- **GitHub:** [@your-github-username](https://github.com/your-github-username)
- **LinkedIn:** [Your LinkedIn Profile](https://www.linkedin.com/in/your-linkedin-profile)

---

If you like this project, consider giving it a ⭐ and sharing feedback to help improve **Vibe News**.
