# Isla Midonas Minecraft Server

Welcome to **Isla Midonas**, a custom Minecraft server project! This repository contains all the necessary files, configurations, and plugins to run the server. The server is automatically deployed and managed using **GitHub Actions**, ensuring smooth updates and continuous integration.

---

## 🚀 Features

- **Automatic Deployment**: The server automatically updates whenever changes are pushed to the `main` branch, thanks to a GitHub Actions workflow that handles deployment via FTP.
- **Custom Plugins & Configurations**: Tailored plugins and configurations to enhance gameplay.
- **Optimized Performance**: Runs on a high-performance VPS with regular backups and automated server restarts.

---

## 🔧 How It Works

1. **Push to `main`**: Any changes pushed to the `main` branch trigger the GitHub Actions workflow.
2. **Automatic Deployment**: The workflow deploys the updated files to the server using **FTP**.
3. **Server Restart**: After deployment, the server is automatically restarted to apply the new changes.

---

## ⚙️ Technologies Used

- **Minecraft Server**: [Purpur](https://purpurmc.org) for enhanced performance and customization.
- **GitHub Actions**: Automates the deployment process.
- **FTP**: Used to transfer files to the server.

---

## 🛠️ How to Contribute

1. **Fork the Repository**.
2. **Create a Branch**:
   ```bash
   git checkout -b feature/new-feature
   ```

