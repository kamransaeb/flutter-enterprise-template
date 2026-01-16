#!/bin/bash

# Create Flutter Enterprise Project
PROJECT_NAME="flutter_enterprise_template"

echo "Creating Flutter Enterprise Project: $PROJECT_NAME via fvm"

# Create project structure
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Initialize Flutter project via fvm
fvm flutter create --org com.rtchoke --project-name $PROJECT_NAME .

# Create directory structure
mkdir -p lib/src/{app,core/{constants,error,network,theme,utils,injection},features/{auth/{data/{datasources,models,repositories},domain/{entities,repositories,usecases},presentation/{bloc,pages,widgets}},dashboard,profile},shared}
mkdir -p test/{helpers,mocks,app,features}
mkdir -p integration_test
mkdir -p scripts
mkdir -p assets/{images,icons,fonts,translations}
mkdir -p .github/workflows
mkdir -p .build_config

# Create all the files we discussed
# (You would copy all the file contents from above into respective files)

echo "Project structure created!"

# Create pubspec.yaml
cat > pubspec.yaml << 'EOF'
name: flutter_enterprise_template
description: A Flutter Enterprise Template 
version: 1.0.0+1
publish_to: 'none'

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: '>=3.10.0'

dependencies:
  flutter:
    sdk: flutter
  
  # Core
  freezed_annotation: ^2.4.1
  get_it: ^7.6.4
  injectable: ^2.1.5
  equatable: ^2.0.5
  dartz: ^0.10.1
  
  # State Management
  flutter_bloc: ^8.1.3
  hydrated_bloc: ^9.1.2
  
  # Network 
  dio: ^5.1.2  
  retrofit: ^4.0.1  
  logger: ^2.0.2

  # Local Storage
  shared_preferences: ^2.2.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Firebase
  firebase_core: ^2.28.2
  firebase_analytics: ^10.7.2
  firebase_crashlytics: ^3.3.6
  firebase_remote_config: ^4.2.1  
  
  # Monitoring
  sentry_flutter: ^7.20.0
  
  # UI
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  
  # Navigation
  go_router: ^12.1.3
  auto_route: ^7.8.2
  
  # Utils
  intl: ^0.18.1
  url_launcher: ^6.2.1
  package_info_plus: ^4.1.0
  connectivity_plus: ^4.0.1
  device_info_plus: ^10.0.0
  
  # Very Good Analysis (VGV's lint rules)
  very_good_analysis: ^5.0.0


dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.5
  freezed: ^2.3.2
  injectable_generator: ^2.1.1
  retrofit_generator: ^9.7.0
  mocktail: ^0.3.0


flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/
    - assets/fonts/
    - assets/translations/

  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
EOF

# Create README.md
cat > README.md << 'EOF'
# Flutter Enterprise Project Template

A production-ready Flutter application template following Clean Architecture and Very Good Ventures patterns and best practices.

## Features

- 🏗️ **Clean Architecture** with feature-based organization
- 🎯 **Environment-aware** configuration (dev/staging/prod)
- 🛡️ **Comprehensive error handling** and crash reporting
- 📱 **Multi-flavor support** for different app variants
- 🧪 **Full test coverage** with unit, widget, and integration tests
- 🔧 **Dependency injection** with GetIt + Injectable
- 🎨 **Theming and localization** ready
- 📊 **Analytics and monitoring** integration
- 🔒 **Security best practices** implemented
- 🚀 **CI/CD ready** with GitHub Actions

echo "Project created successfully!"
echo "Run: cd $PROJECT_NAME && fvm flutter pub get"
