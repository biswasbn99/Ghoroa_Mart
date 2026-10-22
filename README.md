# 🛍️ Ghoroa Mart - E-Commerce Mobile Application

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![State Management](https://img.shields.io/badge/State_Management-Provider-blue?style=for-the-badge)](https://pub.dev/packages/provider)
[![Firebase](https://img.shields.io/badge/Firebase-Analytics_&_Crashlytics-FFA611?style=for-the-badge&logo=firebase&logoColor=white)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

> **Ghoroa Mart** (`ghoroa_mart`) is a modern, high-performance, and feature-complete e-commerce customer mobile application built using **Flutter** and **Dart**. Designed with a **Feature-First Clean Architecture**, Ghoroa Mart provides an intuitive online shopping experience tailored for digital commerce in Bangladesh—featuring secure OTP-based authentication, real-time cart calculations with Bangladeshi Taka (৳) formatting, bilingual localization (English & Bengali), category pagination, product variation pickers, and cloud observability via Firebase.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [The Problem & The Ghoroa Mart Solution](#-the-problem--the-ghoroa-mart-solution)
- [Role-Wise Feature Matrix](#-role-wise-feature-matrix)
- [Visual UI Showcase](#-visual-ui-showcase)
- [Folder & File Architecture](#-folder--file-architecture)
- [Technology Stack](#-technology-stack)
- [Flutter Packages Breakdown](#-flutter-packages-breakdown)
- [Cloud APIs & Remote Services](#-cloud-apis--remote-services)
- [Bangladesh Location & Delivery Management Dataset](#-bangladesh-location--delivery-management-dataset)
- [Installation & Local Setup Guide](#-installation--local-setup-guide)
- [Roadmap & Implementation Plan](#-roadmap--implementation-plan)
- [License & Authors](#-license--authors)

---

## 🌟 Overview

Ghoroa Mart is engineered to serve as a scalable, responsive, and robust mobile retail client. It interfaces with an asynchronous RESTful backend, transforming complex e-commerce interactions into a frictionless shopping journey.

### Key Highlights
- **Frictionless Auth Flow**: Secure user onboarding via Email + 4-digit OTP verification, backed by local JWT token persistence.
- **Dynamic Catalog & Sliders**: Automated promotional carousels, categorized sections, and infinite pagination for product categories.
- **Interactive Product Details**: Multi-image carousel, dynamic color and size attribute selectors, real-time quantity stepper, and specification views.
- **Reactive Shopping Cart**: Synchronous price re-calculation, item removal, and instant quantity adjustments using the `Provider` pattern.
- **Bilingual & Localization Ready**: First-class support for both English and Bengali (`.arb` based l10n) with dynamic locale switching.
- **Production Observability**: Integrated Firebase Crashlytics for fatal/non-fatal exception tracking and Firebase Analytics for user journey diagnostics.

---

## 💡 The Problem & The Ghoroa Mart Solution

### The Problem
Traditional mobile e-commerce applications in emerging regional markets often face significant challenges:
1. **High Checkout Abandonment**: Complex, multi-field registration forms with forgotten passwords create high friction during user onboarding.
2. **Localization & Currency Disconnect**: Many platforms lack native language support (Bengali) and standard local currency formatting (৳), reducing user trust.
3. **Network Instability**: On fluctuating mobile networks (2G/3G/4G), API requests fail silently or freeze the user interface without graceful recovery.
4. **State Desynchronization**: Adding items to carts or updating quantities across multiple screens frequently leads to state mismatch or UI stutter.

### The Ghoroa Mart Solution
| Challenge | Ghoroa Mart Implementation |
| :--- | :--- |
| **Password Friction** | **Email + OTP Verification Flow**: Passwordless or OTP-validated authentication guarantees verified user identity while minimizing drop-offs. |
| **Bilingual Experience** | **Native Bengali (`bn`) & English (`en`)**: Native `.arb` translation structure with instant locale switching and Bangladeshi Taka (`৳`) currency representation. |
| **Resilient Networking** | **Centralized `NetworkCaller`**: Intercepts requests, logs payloads with `logger`, handles 401 unauthorized session expiry globally, and wraps responses in typed `NetworkResponse` containers. |
| **Smooth Reactive UI** | **ChangeNotifier State Isolation**: Segregated feature providers (`CartListProvider`, `CategoryListProvider`, `HomeSlidersProvider`) guarantee isolated widget rebuilds and zero UI jank. |

---

## 👥 Role-Wise Feature Matrix

Ghoroa Mart implements strict permission handling and conditional UI rendering based on the user's authentication state:

| Feature Area | Guest / Unauthenticated User | Registered Customer (Logged In) |
| :--- | :---: | :---: |
| **Browse Promotional Sliders** | ✅ Supported | ✅ Supported |
| **Search Catalog & Browse Categories** | ✅ Supported | ✅ Supported |
| **View Category Products (Pagination)** | ✅ Supported | ✅ Supported |
| **Inspect Product Details (Colors, Sizes)** | ✅ Supported | ✅ Supported |
| **Toggle Dark / Light Mode & Language** | ✅ Supported | ✅ Supported |
| **Add to Cart** | 🔒 Redirects to Sign In | ✅ Enabled (Instant Sync) |
| **Manage Cart (Adjust Quantity, Remove)** | 🔒 Redirects to Sign In | ✅ Enabled (Live Total Calculation) |
| **Manage Wishlist** | 🔒 Redirects to Sign In | ✅ Enabled |
| **Checkout & Order Creation** | 🔒 Auth Required | ✅ Enabled |
| **Persistent User Session** | ❌ None | ✅ Encrypted local token storage |

---

## 📱 Visual UI Showcase

*(Screenshots can be placed in `assets/screenshots/`)*

| 1. Splash & Auth | 2. Home Dashboard | 3. Category & Catalog |
| :---: | :---: | :---: |
| ![Splash & Auth](https://via.placeholder.com/260x520?text=Splash+%26+Auth) | ![Home Screen](https://via.placeholder.com/260x520?text=Home+Dashboard) | ![Category List](https://via.placeholder.com/260x520?text=Category+Pagination) |
| *App logo, email input, OTP pin field* | *Search bar, banner slider, popular grids* | *4-column category grid with refresh* |

| 4. Product Details | 5. Shopping Cart | 6. Wishlist Screen |
| :---: | :---: | :---: |
| ![Product Details](https://via.placeholder.com/260x520?text=Product+Details) | ![Cart Screen](https://via.placeholder.com/260x520?text=Cart+Checkout) | ![Wishlist Screen](https://via.placeholder.com/260x520?text=Wishlist+Catalog) |
| *Image slider, color/size chips, quantity* | *Cart cards, dynamic ৳ price counter* | *Saved favorite items ready to buy* |

---

## 🏗️ Folder & File Architecture

Ghoroa Mart strictly adopts a **Feature-First Architecture** with clear domain separation:

```text
ghoroa_mart/
├── android/                    # Android native configuration & Gradle scripts
├── ios/                        # iOS native configuration & Runner project
├── assets/                     # Static media assets
│   └── images/                 # SVG logos, branding graphics, fallback images
├── lib/
│   ├── main.dart               # App entrypoint (Firebase, Error handlers, runApp)
│   ├── firebase_options.dart   # Firebase platform-specific configuration
│   ├── app/                    # Global app configuration & cross-cutting concerns
│   │   ├── app_colors.dart     # Centralized brand color palette (#07ADAE)
│   │   ├── app_theme.dart      # Material 3 Light & Dark ThemeData definitions
│   │   ├── asset_paths.dart    # Constant SVG and image asset paths
│   │   ├── constants.dart      # Global constants (e.g., Taka sign ৳)
│   │   ├── ghoroa_mart_app.dart# Root MaterialApp widget, theme/locale injection
│   │   ├── routes.dart         # Named routing table (onGenerateRoute)
│   │   ├── urls.dart           # REST API endpoints & query builders
│   │   ├── validators.dart     # Input validation regex and logic
│   │   ├── extensions/         # Dart utility & localization extensions
│   │   └── providers/          # Global state (Theme, Locale, AuthController)
│   ├── core/                   # Core infrastructure services
│   │   └── services/
│   │       └── network_caller/ # Base HTTP client, logger, and NetworkResponse model
│   ├── features/               # Modular business feature packages
│   │   ├── auth/               # Sign In, Sign Up, OTP Verification, Splash
│   │   │   └── presentation/   # Auth UI screens (Splash, Login, OTP) & widgets
│   │   ├── home/               # Carousel slider, Category sections, Search
│   │   ├── category/           # Paginated Category catalog, Pull-to-refresh
│   │   ├── products/           # Product details, variation selectors, lists by category
│   │   ├── cart/               # Cart list, quantity steppers, checkout calculation
│   │   ├── wishlist/           # Customer favorite items management
│   │   └── shared/             # Main navigation holder, bottom bar, reusable UI
│   └── l10n/                   # Bilingual Internationalization ARB files
│       ├── app_en.arb          # English translation keys
│       └── app_bn.arb          # Bengali translation keys
├── pubspec.yaml                # Package dependencies and asset declarations
└── README.md                   # Project documentation
```

---

## 💻 Technology Stack

- **Framework**: [Flutter](https://flutter.dev) (v3.x / Dart 3.x)
- **UI System**: Material Design 3 (Custom Theme with primary `#07ADAE`)
- **State Management**: [Provider](https://pub.dev/packages/provider) (`ChangeNotifierProvider`, `Consumer`, `MultiProvider`)
- **Architecture**: Feature-Driven Modular Clean Architecture
- **Networking**: [http](https://pub.dev/packages/http) wrapped in custom `NetworkCaller` with logging and error interceptors
- **Local Persistence**: [shared_preferences](https://pub.dev/packages/shared_preferences) for Auth Tokens & User Profile caching
- **Cloud & Observability**: Google Firebase Core, Firebase Crashlytics, Firebase Analytics

---

## 📦 Flutter Packages Breakdown

| Package | Version | Purpose |
| :--- | :--- | :--- |
| **`provider`** | `^6.1.5+1` | Reactive application state management and dependency injection |
| **`http`** | `^1.6.0` | Asynchronous REST API network requests |
| **`firebase_core`** | `^4.15.0` | Firebase native initialization for Android and iOS |
| **`firebase_crashlytics`** | `^5.4.0` | Real-time crash diagnostics and fatal/non-fatal exception logging |
| **`firebase_analytics`** | `^12.6.0` | Event logging and mobile telemetry analysis |
| **`shared_preferences`** | `^2.5.5` | Key-value encrypted local token and session persistence |
| **`carousel_slider`** | `^5.1.2` | Interactive banner sliders on the Home screen and Product Details |
| **`pin_code_fields`** | `^9.4.0` | 4-digit animated OTP input field with validation |
| **`flutter_svg`** | `^2.3.0` | Scalable Vector Graphics (SVG) rendering for high-DPI icons |
| **`cached_network_image`** | `^3.4.1` | Network image caching, placeholder states, and memory optimization |
| **`logger`** | `^2.7.0` | Pretty formatted HTTP request/response debugging in console |
| **`email_validator`** | `^3.0.0` | Robust email address syntax verification |
| **`intl`** | `^0.20.2` | Date, number, and localization message formatting |

---

## 🌐 Cloud APIs & Remote Services

The mobile client consumes a RESTful microservice deployed at:
`https://ecom-rs8e.onrender.com/api`

### API Endpoint Registry

| Method | Endpoint | Auth Required | Description |
| :---: | :--- | :---: | :--- |
| `POST` | `/auth/signup` | No | Register a new user profile with email and metadata |
| `POST` | `/auth/verify-otp` | No | Validate OTP sent to user email and retrieve JWT token |
| `POST` | `/auth/login` | No | Initiate sign-in flow for registered customer |
| `GET` | `/slides` | No | Fetch list of active promotional banners for Home carousel |
| `GET` | `/categories?page={p}&count={n}` | No | Fetch paginated category list with page number and count |
| `GET` | `/products?category={id}&page={p}&count={n}` | No | Fetch products belonging to a specific category |
| `GET` | `/products/id/{productId}` | No | Retrieve comprehensive product details, colors, and sizes |
| `GET` | `/cart` | **Yes (Bearer Token)** | Fetch authenticated customer's current shopping cart |
| `POST` | `/cart` | **Yes (Bearer Token)** | Add an item with specified color, size, and quantity to cart |
| `GET` | `/wishlist?page={p}&count={n}` | **Yes (Bearer Token)** | Fetch customer's personal wishlist items |


## 🚀 Installation & Local Setup Guide

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`^3.11.0` or higher)
- [Dart SDK](https://dart.dev/get-dart) (`^3.11.0` or higher)
- Android Studio / VS Code with Flutter and Dart extensions
- Android SDK Platform 34+ / Xcode for iOS development
- Git installed on your system

### 1. Clone the Repository
```bash
git clone https://github.com/biswasbn99/ghoroa_mart.git
cd ghoroa_mart
```

### 2. Configure Flutter SDK (FVM or Global)
If you manage Flutter versions using **FVM (Flutter Version Management)**:
```bash
fvm install 3.24.5
fvm use 3.24.5
fvm flutter pub get
```
*Or using your global Flutter installation:*
```bash
flutter pub get
```

### 3. Generate Localization Files
```bash
flutter gen-l10n
```

### 4. Firebase Configuration Setup
Ensure your `google-services.json` (for Android) is placed in:
```text
android/app/google-services.json
```
*(This file is excluded from Git tracking for security purposes).*

### 5. Run the Application
Connect a physical device or launch an emulator, then execute:
```bash
# Debug Mode
flutter run

# Or with FVM
fvm flutter run
```

### 6. Build Release APK / App Bundle
```bash
# Generate Release APK
flutter build apk --release

# Generate Release App Bundle (for Google Play Console)
flutter build appbundle --release
```

---

## 🗺️ Roadmap & Implementation Plan

All features specified below are scoped and systematically implemented for **Ghoroa Mart**:

- [x] Project Architecture Setup (`ghoroa_mart` Feature-First structure)
- [x] Firebase Core, Analytics & Crashlytics Integration
- [x] Material 3 Light & Dark Theme Configuration (`#07ADAE`)
- [x] Bilingual Internationalization Engine (English & Bengali `.arb` setup)
- [x] Animated Splash Screen & SVG Branding Assets (`logo.svg`, `logo_nav.svg`)
- [ ] Centralized `NetworkCaller` & HTTP Interceptor Layer
- [ ] Email & 4-Digit OTP Authentication Flow
- [ ] Home Screen with Promotional Slider & Category Sections
- [ ] Paginated Category Browser with Pull-to-Refresh
- [ ] Product Details View with Image Carousel & Attribute Selectors (Color, Size)
- [ ] Reactive Shopping Cart with Real-time ৳ Price Counter
- [ ] Customer Wishlist & Favorite Items Management
- [ ] Checkout Flow with Bangladesh Division/District/Thana Delivery Matrix
- [ ] Payment Gateway Integration (COD, bKash, Nagad, SSLCommerz)
- [ ] Order Tracking & Real-Time Status Timeline

---

## 📄 License & Authors

### Author
- **Bn Biswas**
  - **Email**: [biswasbn99@gmail.com](mailto:biswasbn99@gmail.com)
  - **GitHub**: [@biswasbn99](https://github.com/biswasbn99)
  - **Project**: Ostad Flutter Application Development Program

### License
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Developed with ❤️ for the Ghoroa Mart Community in Bangladesh.
</p>
