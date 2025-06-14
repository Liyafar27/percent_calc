# 📊 Percent Calculator

**Percent Calculator** is a simple and intuitive Flutter app that helps users quickly calculate percentages and keep a history of their calculations.

---

## ✨ Features

- 🧮 Calculate percentage values instantly
- 💾 Save and view a **local history** of calculations
- 🗑️ Delete individual history entries
- 🌓 **Light / Dark** theme toggle
- 🌍 **Localization support** for English and Russian
- 🧠 Smart result formatting: `120.00 → 120`, `87.50 → 87.5`

---

## 🛠️ Tech Stack

- **Flutter** – UI framework
- **flutter_bloc** – state management
- **SharedPreferences** – local storage
- **intl / flutter_localizations** – i18n support
- **flutter_gen** – localization code generation

---

## ⚙️ State Management

This project uses **BLoC (Business Logic Component)** for state management.  
The choice of `flutter_bloc` was made based on the following rationale:

- 🔄 **Separation of concerns**: BLoC allows for a clear division between UI and business logic.
- 🧪 **Testable**: Events and states can be easily unit tested.
- 🔌 **Scalable**: Suitable for both small and larger apps with more complex flows.
- 🧰 **Mature ecosystem**: `flutter_bloc` has a well-established API and active community support.

> Alternatives like **Provider** or **Riverpod** were considered, but BLoC was chosen for its structure, robustness, and familiarity in managing UI-driven workflows such as form validation, localization, and theme switching.

---

## 📸 Screenshots


<p align="center">
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/Screenshot_1749888796.png" width="250" alt="accessibility text">  
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/Screenshot_1749888802.png" width="250" alt="accessibility text">
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/untitled.gif" width="250" alt="accessibility text">

</p>
---

## 🚀 Getting Started

```bash
git clone https://github.com/Liyafar27/percent_calc.git
cd dog-journal
flutter pub get
flutter run
    
