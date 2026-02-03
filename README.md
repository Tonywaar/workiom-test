# Workiom – Test App

A Flutter test app for a job application at Workiom. It implements a full sign-up and login flow using the Workiom API.

## What it does

When you open the app you see a splash screen that checks if you’re already logged in. If not, you go to the auth flow: start screen (continue with Google – placeholder – or with email), then login (email + password), then workspace setup (company name, first/last name). After that the app registers the tenant and logs you in, then shows the home screen with a welcome message and logout.

The backend is **https://api.workiom.club** (ABP-style API). The app talks to it for things like editions, password rules, tenant availability, tenant registration, and authentication.

## Tech stack

- **Flutter** for the UI
- **GetX** for state, navigation, and translations (EN/AR)
- **Dio** for HTTP, with PrettyDioLogger in debug
- **GetIt** to inject Dio and a shared DataService
- **Get Storage** for token, user, tenant, and language
- **flutter_screenutil** for responsive layout (design size 440×956)
- **flutter_gen** for type-safe asset paths
- **flutter_timezone** to send the device’s IANA timezone when registering / authenticating

## Project structure

Code lives under `lib/app/`:

- **core/** – shared stuff: theme (Rubik, Material 3), colors, strings, validators, dialogs, common widgets (buttons, text fields, scaffold, etc.), UserService, and the injector setup.
- **data/** – one central HTTP layer: `DataService` (wraps Dio), endpoint constants, and a generic `GeneralResponse<T>` plus `DataState` (success/failed) so every API call returns the same shape.
- **modules/** – one folder per feature (splash, auth, home), each with bindings, controllers, views, and for auth also repo and models.
- **routes/** – GetX routes and pages; app starts at splash, then goes to home or auth depending on login state.

So: feature-based modules, a single place for API calls, and shared UI/theme/utils in core.

## Auth flow in a bit more detail

On the first screen you can pick “continue with email” (Google is just a button for now). That opens the login form: email and password. Password rules (length, uppercase, lowercase, number, special char) come from the API (`GetPasswordComplexitySetting`), and the UI shows which rules are met in real time. The “Confirm password” button only works when all rules pass.

After that you get the workspace form: workspace name, first name, last name. The app checks if the workspace name is free (`IsTenantAvailable`), then on submit it calls `RegisterTenant` (with timezone and the first registrable edition from the API) and then `Authenticate`, stores the token and user/tenant via UserService, and navigates to home.

Home is simple: “Stay organized with Workiom” and a logout button with a confirmation dialog.

## API

All requests go through `DataService` (get, post, put, delete). Endpoints and base URL live in `DataConsts`. Responses are parsed as ABP-style JSON (`result`, `success`, `error`), wrapped in `GeneralResponse<T>`, and returned as `DataSuccess` or `DataFailed`. Repos (e.g. `AuthRepoImpl`, `UserRepoImpl`) call DataService and map to the app’s models.

Used endpoints include: session/current login info, password complexity setting, editions for select, is tenant available, register tenant, authenticate.

## Running the app

You need Flutter (SDK ^3.10.1). Then:

```bash
flutter pub get
dart run build_runner build -d
flutter run
```

There’s also a `make buildData` that runs the build_runner step.

## Summary

I set up a clear feature structure (splash, auth, home), a single API layer with a generic response type, and repos + controllers so the flow is easy to follow. Password rules are driven by the API and validated live. Workspace name is checked before registration, and the app supports English and Arabic with the language choice persisted. Theme uses Rubik and Material 3, and assets are wired through flutter_gen so paths are type-safe.