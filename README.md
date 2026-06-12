# 🍔 Burgger App - Production-Ready E-Commerce Mobile Application

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D%203.10.0-blue.svg?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D%203.0-navy.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Feature--First%20Clean%20Code-emerald.svg?style=flat-square)](https://clean-architecture.org)
[![State Management](https://img.shields.io/badge/State%20Management-Bloc%20%2F%20Cubit-red.svg?style=flat-square)](https://pub.dev/packages/flutter_bloc)

**Burgger App** is a high-performance, fully-featured E-commerce mobile application tailored for food delivery. Built with **Flutter** and **Dart**, this project showcases production-grade software engineering practices, prioritizing **Scalability, Clean Architecture, and Highly-Maintainable Modular Code**.

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

## 🏗 Architectural Overview

The app strictly follows **Feature-First Clean Architecture**. This decouples business logic from UI components, offering smooth testability and parallel development scaling across modules.

<p align="center">
  <img width="850" alt="BURGGER App System Design" src="https://github.com/user-attachments/assets/6cc68b70-134d-4fc4-b3aa-919d560755c6" />
</p>

### 📁 Directory Layout & Module Structure
```text
lib/
├── core/               # App-wide foundational architecture (Shared)
│   ├── di/             # Dependency Injection Setup (Get_it)
│   ├── networking/     # Dio Client, Rest Client, Interceptors, Error Handling
│   ├── routing/        # AppRouter (onGenerateRoute) & Screen Path Definitions
│   ├── shared/         # Universal Core Reusable Widgets
│   └── theming/        # Design System (Custom AppColors & TextStyles)
├── features/           # Completely decoupled domain features
│   ├── login/          # Secure Authentication Logic & UI
│   ├── signup/         # Multi-step onboarding and account creation
│   ├── home/           # Product Discovery, Dynamic Categories, Banners
│   ├── product_details/# Customized orders (Toppings, Side options state)
│   ├── cart/           # Reactive Cart Calculation & Order Placement Flow
│   └── profile/        # User Profile Management & Reactive Updates
└── main.dart           # Application Root entry point
<br>

```

<br>


## 🛠 Advanced Technical Capabilities

### 1. Advanced State Management (Bloc / Cubit)
* Enforces single-responsibility state management using **Cubits** for predictable lifecycle actions.
* Utilizes `BlocListener` efficiently to map background side-effects (e.g., launching Success Dialogs, routing on successful validation, triggering system snackbars).
* Complex business state mutation handled for the **Toppings & Side Options System**, calculating real-time pricing updates before cart injection.

### 2. Production Networking & Type-Safe API Client
* **Dio Factory Client:** Equipped with centralized error interceptors, authorization token headers handling, and automated network logging via `pretty_dio_logger`.
* **Retrofit REST Engine:** Fully type-safe REST integrations, minimizing boilerplate code and ensuring strict type parsing through code generation.
* **Resilient Error Handler:** Global API failure mapping that seamlessly catches server errors, timeouts, or bad payloads, translating them into human-readable UI prompts.

### 3. Local Caching & Data Security
* **Flutter Secure Storage:** Encrypts and securely caches sensitive user auth tokens (`JWT`) locally.
* **Shared Preferences:** Handles high-speed caching for user sessions and light/persistent app preferences.

### 4. Enterprise-Grade UI Development
* **Device Responsiveness:** Fully adaptive UI scaling driven by `flutter_screenutil` using a base baseline design (360x690).
* **Sleek UX Feedback:** Native startup rendering through `flutter_native_splash` alongside contextual asset rendering via `shimmer` loads.
* **Interactive Checkout Components:** Integrated an aesthetic `flutter_credit_card` input engine during the checkout preview step.
---
## 🚀 Tech Stack & Core Libraries

| Category | Technology Used |
| :--- | :--- |
| **State Management** | `bloc`, `flutter_bloc` |
| **Networking** | `dio`, `retrofit`, `pretty_dio_logger` |
| **Dependency Injection**| `get_it` |
| **Code Generation** | `freezed`, `json_serializable`, `retrofit_generator`, `build_runner` |
| **Storage / Security** | `flutter_secure_storage`, `shared_preferences` |
| **UI UX Helpers** | `flutter_screenutil`, `flutter_native_splash`, `flutter_svg`,`gap`|

---
