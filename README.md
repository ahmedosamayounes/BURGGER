# <img src="https://github.com/user-attachments/assets/d2416038-f112-4761-b62a-02cbf73e80fa" width="38" height="38" valign="middle"/> Burgger App - E-Commerce Mobile Application

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D%203.10.0-blue.svg?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D%203.0-navy.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture%20(Feature--First)-emerald.svg?style=flat-square)](https://clean-architecture.org)
[![State Management](https://img.shields.io/badge/State%20Management-Bloc%20%2F%20Cubit-red.svg?style=flat-square)](https://pub.dev/packages/flutter_bloc)

**Burgger App** is a food delivery e-commerce mobile application built with **Flutter** and **Dart**. The project serves as a practical implementation of a modular codebase, demonstrating how to handle remote data fetching, local data persistence, and state management across structured features.

---

## 📸 Application Showcase & UI Flow

| 📱 Native Splash | 🔑 Multi-Step Signup (1) | 🔑 Multi-Step Signup (2) | 🛡️ Signup Success |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/060c93a5-d8ce-4a86-94cd-ca23ebe87648" width="180"/> | <img src="https://github.com/user-attachments/assets/e60b77d4-1384-4d96-9565-f0b2adf48661" width="180"/> | <img src="https://github.com/user-attachments/assets/bfbb8182-5185-445d-9c9d-ea275bde480b" width="180"/> | <img src="https://github.com/user-attachments/assets/3a75c4fc-80ab-4d6a-b747-9648b26c8f8e" width="180"/> |

| 🔓 Secure Login | 🏠 Home & Categories | 🍔 Product Details | 🧀 Custom Toppings |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/1e12dbaa-0551-4071-9d1f-8af71bd8445a" width="180"/> | <img src="https://github.com/user-attachments/assets/b19bc6cb-6d14-4a69-b9f2-a681cff39895" width="180"/> | <img src="https://github.com/user-attachments/assets/a443edb6-6575-4215-9539-f595d6cce6ab" width="180"/> | <img src="https://github.com/user-attachments/assets/f18022c3-974c-4d20-8815-a75f0f1b3c2d" width="180"/> |

| 🛒 Interactive Cart | 💳 Mock Checkout Visa | 🎉 Order Success | 👤 User Profile | ✏️ Edit Profile Success |
| :---: | :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/fe99e9e4-d28d-4fac-8295-7153044e11ac" width="180"/> | <img src="https://github.com/user-attachments/assets/c6910a5b-b4be-4878-bba5-3b256ab112f0" width="180"/> | <img src="https://github.com/user-attachments/assets/f99fe56f-e5f7-4016-988a-efa7e6981f2f" width="180"/> | <img src="https://github.com/user-attachments/assets/6da775e4-1ecc-4ab2-a87a-1132c3c9108c" width="180"/> | <img src="https://github.com/user-attachments/assets/babbe3a3-27d9-47e7-9db6-9cf634baf7bb" width="180"/> |

---

## 🏗 Architectural Design

The application implements a **Feature-First Clean Architecture** pattern. Each feature is decoupled into separate layers to isolate business logic from UI components and external framework dependencies.

<p align="center">
<img width="768" height="1376" alt="Image" src="https://github.com/user-attachments/assets/410ad19b-2c55-461e-9ddc-263d2e27bad4" />
</p>

### 📁 Feature-Based Directory Layout

Each vertical feature is structured into three standard layers:

```text
lib/
├── core/                        # Global shared infrastructure
│   ├── di/                      # Dependency Injection setup (Get_It)
│   ├── networking/              # Dio client, Retrofit setup, and error models
│   ├── routing/                 # App router using onGenerateRoute
│   └── theming/                 # App styling tokens (Colors & Fonts)
└── features/                    # Independent modules
    └── home/                    # Feature Example
        ├── data/                # Data Layer
        │   ├── datasources/     # Remote API Client & Local DB boxes
        │   ├── models/          # Data Transfer Objects (DTOs) & JSON parsers
        │   └── repositories/    # Concrete Repository implementations
        ├── domain/              # Domain Layer (Pure Dart)
        │   ├── entities/        # Core business models used by the UI
        │   ├── repositories/    # Abstract repository interfaces
        │   └── usecases/        # Single-responsibility use cases (e.g., GetProductsUseCase)
        └── presentation/        # Presentation Layer
            ├── cubit/           # State management logic
            └── widgets/         # Components and feature screens
```




## Technical Implementation Details
1. Data Flow & Separation of Concerns
Domain Layer Isolation: The domain layer contains pure Dart logic. Entities and Use Cases do not depend on external data packages or API configurations.


Data Mapping: Implements explicit mappers to translate API Models (DTOs) into domain Entities before passing them to the presentation layer, maintaining a stable UI model even if contract keys change.

2. Local Persistence & Offline Support
Hive Caching: Integrated Hive in the Home feature data layer to store the products list locally.

Data Flow: The application loads cached data immediately on startup for instant UI rendering, then performs an asynchronous remote network request to update the local store and refresh the view.

3. State Management (Bloc / Cubit)
Uses Cubits to manage specific state updates, such as tracking active selections, dynamic toppings, and computing totals inside the cart.

Uses BlocListener to handle asynchronous background operations (e.g., executing navigation commands or displaying dialogs upon successful authentication).

4. Networking Engine
Type-Safe Clients: Built with Retrofit and Dio, utilizing code generation (build_runner) to handle endpoint configurations and JSON deserialization.

Interceptors: Features an interceptor pipeline for unified request/response logging via pretty_dio_logger and auth header injection using tokens retrieved from flutter_secure_storage.

Error Handling: Features a mapping utility that catches HTTP errors, network timeouts, or parsing issues, converting them into readable error objects for the UI.

---




## Tech Stack & Core


| Category | Libraries Used |
| :--- | :--- |
| **State Management** | `bloc`, `flutter_bloc` |
| **Networking** | `dio`, `retrofit`, `pretty_dio_logger` |
| **Local Storage** | `hive`, `hive_flutter`, `shared_preferences`, `flutter_secure_storage` |
| **Dependency Injection** | `get_it` |
| **Code Generation** | `freezed`, `json_serializable`, `retrofit_generator`, `build_runner` |
| **UI UX / Responsive** | `flutter_screenutil`, `flutter_native_splash`, `flutter_svg`, `gap`, `shimmer`, `flutter_credit_card` |
