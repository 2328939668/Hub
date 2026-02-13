# 去中心化聊天平台

基于 Capacitor + React 的跨平台移动应用,提供匿名加密聊天、Web3浏览器、社交功能、加密货币钱包和小程序平台。

## 功能特性

- 🔒 **匿名加密聊天** - 端到端加密(E2EE)消息传输
- 👥 **社交功能** - 朋友圈和微社区
- 💰 **加密货币钱包** - 转账、发红包、自定义代币
- 🌐 **Web3浏览器** - 访问去中心化应用(DApp)
- 📱 **小程序平台** - 丰富的轻量级应用

## 快速开始

### 开发模式

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 同步到Android平台
npm run sync
```

### 构建Android应用

详细构建指南请查看 [BUILD_ANDROID.md](BUILD_ANDROID.md)

```bash
# 构建Web应用
npm run build

# 同步到Android
npm run sync

# 打开Android Studio
npm run open
```

## 项目结构

```
├── src/              # React源代码
├── android/          # Android原生项目
├── dist/             # Web应用构建输出
└── capacitor.config.ts  # Capacitor配置
```

## 技术栈

- React 19 + TypeScript
- Vite 7
- Capacitor 8
- 移动端优化的CSS

## 构建要求

- Node.js 18+
- Java JDK 17+
- Android SDK
- Android Studio (可选)

## 许可证

MIT
