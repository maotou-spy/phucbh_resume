# PhucBH's Portfolio

A personal portfolio & resume website built with **Flutter Web**, showcasing my experience as a Fullstack Test Engineer | Automation Test Engineer.

🔗 **Live site:** [phucbh.id.vn](https://phucbh.id.vn) · [phucbh-resume.pages.dev](https://phucbh-resume.pages.dev/)

![Static Badge](https://img.shields.io/badge/Flutter-02569B%3Fstyle%3Dflat%26logo%3Dflutter%26logoColor%3Dwhite)
![Static Badge](https://img.shields.io/badge/Dart-0175C2%3Fstyle%3Dflat%26logo%3Ddart%26logoColor%3Dwhite)

## ✨ Overview

This is a responsive, single-page portfolio site featuring:

- **Home** — Introduction, role, and quick call-to-actions (Get in Touch / Download Resume)
- **About Me** — Personal background, with dedicated layouts for desktop and mobile
- **Job Experience** — Horizontally scrollable cards detailing work & personal projects, tech stack used, team size, and demo videos where available
- **Contact** — A contact form for reaching out directly
- Fully responsive layout with distinct **desktop** and **mobile** experiences

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev) (Web)
- **Language:** Dart
- **Packages:**
  - [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) — environment variable management
  - [`url_launcher`](https://pub.dev/packages/url_launcher) — opening external links (resume, demo videos)
- **Deployment:** [Cloudflare Pages](https://pages.cloudflare.com/)

## 📂 Project Structure

```
lib/
├── constants/          # Colors & text styles
├── pages/              # Main page / route entry
├── utils/              # Helpers (assets, URLs, experience data models)
├── widgets/            # Reusable UI sections & components
│   ├── header.dart
│   ├── home_desktop_section.dart
│   ├── home_mobile_section.dart
│   ├── about_desktop_section.dart
│   ├── about_mobile_section.dart
│   ├── experience_section.dart
│   ├── experience_card.dart
│   ├── contact_section.dart
│   ├── drawer_mobile.dart
│   └── footer.dart
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A running web browser (Chrome recommended for local dev)

### Setup

1. Clone the repository

   ```bash
   git clone https://github.com/maotou-spy/phucbh_resume.git
   cd phucbh_resume
   ```

2. Install dependencies

   ```bash
   flutter pub get
   ```

3. Create a `.env` file in the project root (see `.env.example` if available):

   ```env
   RESUME_URL=https://your-resume-link.com
   ```

4. Run locally
   ```bash
   flutter run -d chrome
   ```

### Build for production

```bash
flutter build web
```

Output is generated in `build/web`.

## 🌐 Deployment

This project is deployed via **Cloudflare Pages**

- **Build command:** `flutter build web`
- **Publish directory:** `build/web`
- Environment variables (e.g. `RESUME_URL`) are configured under **Site settings > Environment variables** on Cloudflare Pages.

## 📄 License

This project is personal portfolio code and is provided for reference purposes. Feel free to fork it for inspiration, but please don't reuse personal content (name, photos, resume, project details) as your own.

## 📬 Contact

- **Portfolio:** [phucbh.id.vn](https://phucbh.id.vn)
- **GitHub:** [@maotou-spy](https://github.com/maotou-spy)
