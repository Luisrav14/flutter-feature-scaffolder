# Flutter Feature Scaffolder 🏗️

A generator for **hexagonal architecture feature modules** in Flutter/Dart projects.
It allows you to quickly create a new feature module with ready-to-use folders and boilerplate files.

## 🚀 Installation

Place the `create_feature.dart` file inside a `tools/` folder in your Flutter project.

Your project structure should look like this:

```
.
├── lib/
│   └── features/
│       └── ...
└── tools/
    └── create_feature.dart
```

## 🛠 Usage

Run the command from the root of your project:

```sh
dart run tools/create_feature.dart <feature_name>
```

For example, to create a `products` feature:

```sh
dart run tools/create_feature.dart products
```

This will generate:

```
lib/features/products/
├── domain/
│   ├── entities/
│   │   └── product.dart
│   ├── datasources/
│   │   └── product_datasource.dart
│   ├── repositories/
│   │   └── product_repository.dart
│   └── domain.dart
├── infrastructure/
│   ├── models/
│   │   └── product_model.dart
│   ├── mappers/
│   │   └── product_mapper.dart
│   ├── datasources/
│   │   └── product_datasource_impl.dart
│   ├── repositories/
│   │   └── product_repository_impl.dart
│   └── infrastructure.dart
└── presentation/
    ├── providers/
    ├── screens/
    ├── widgets/
    └── presentation.dart
```

With empty classes, abstract repositories, datasources, and barrel files already created.

## 🧩 Benefits

✅ **Fast** – Create a complete feature module in seconds.
✅ **Consistent** – Keeps the architecture uniform across the entire project.
✅ **Scalable** – Easy to extend with more folders or templates if needed.
✅ **Productive** – Reduces repetitive work and human errors.

## 📌 Notes

* Classes and methods are generated empty with `TODO` comments ready to be implemented.
* Compatible with any Flutter/Dart project that follows **hexagonal architecture**.

---
