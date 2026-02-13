# 去中心化聊天平台 - Android应用构建指南

## 项目概述

这是一个基于 Capacitor + React + TypeScript 的跨平台移动应用,提供匿名加密聊天、Web3浏览器、社交功能、加密货币钱包和小程序平台等功能。

## 技术栈

- **前端框架**: React 18 + TypeScript
- **构建工具**: Vite
- **跨平台框架**: Capacitor
- **目标平台**: Android
- **UI样式**: 自定义CSS (移动端优化)

## 构建步骤

### 前置要求

1. **Java Development Kit (JDK) 17 或更高版本**
   ```bash
   # 检查Java版本
   java -version
   ```

   下载地址: https://adoptium.net/

2. **Android SDK**
   ```bash
   # 设置环境变量
   export ANDROID_HOME=/path/to/android/sdk
   export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
   ```

   下载地址: https://developer.android.com/studio

3. **Node.js 18+**
   ```bash
   # 检查Node.js版本
   node --version
   npm --version
   ```

### 构建方法

#### 方法1: 使用自动化脚本

```bash
# 在项目根目录执行
./build-android.sh
```

#### 方法2: 手动构建

1. **构建Web应用**
   ```bash
   npm install
   npm run build
   ```

2. **同步到Android平台**
   ```bash
   npx cap sync android
   ```

3. **构建Debug APK**
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

4. **构建Release APK (可选)**
   ```bash
   ./gradlew assembleRelease
   ```

   注意: 构建Release版本需要配置签名证书。

## 输出文件

构建成功后,APK文件位于:

- **Debug版本**: `android/app/build/outputs/apk/debug/app-debug.apk`
- **Release版本**: `android/app/build/outputs/apk/release/app-release.apk`

## 安装到设备

### 方法1: 使用ADB

```bash
# 连接Android设备
adb devices

# 安装APK
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### 方法2: 手动传输

1. 将APK文件复制到Android设备
2. 在设备上启用"未知来源"应用安装
3. 点击APK文件进行安装

## 应用功能

### 1. 匿名加密聊天
- 端到端加密(E2EE)消息传输
- 匿名身份保护
- 实时通讯支持

### 2. 社交功能
- 朋友圈: 发布和浏览动态
- 微社区: 创建和加入主题社区
- 点赞和评论互动

### 3. 加密货币钱包
- 转账功能
- 发红包
- 自定义代币创建和管理
- 余额查询

### 4. Web3浏览器
- 访问去中心化应用(DApp)
- 钱包连接
- 智能合约交互

### 5. 小程序平台
- 应用市场
- 沙箱运行环境
- 安全隔离

## 项目结构

```
decentralized-chat-app/
├── src/                    # 源代码
│   ├── App.tsx            # 主应用组件
│   ├── App.css            # 应用样式
│   └── index.css          # 全局样式
├── android/               # Android原生项目
│   └── app/
│       └── src/main/
│           └── assets/
│               └── public/ # Web应用构建产物
├── dist/                  # Web应用构建输出
├── capacitor.config.ts    # Capacitor配置
├── package.json           # 项目依赖
└── build-android.sh       # 自动化构建脚本
```

## 开发调试

### 开发模式

```bash
# 启动开发服务器
npm run dev

# 在另一个终端同步到Android
npx cap sync android

# 打开Android Studio
npx cap open android
```

### 热重载

使用Capacitor Live Reload:

```bash
# 开启热重载
npx cap serve

# 在Android设备上访问显示的URL
```

## 故障排除

### 问题1: Gradle构建失败

```bash
# 清理构建缓存
cd android
./gradlew clean
```

### 问题2: Java版本不兼容

确保使用JDK 17或更高版本:

```bash
# 设置JAVA_HOME
export JAVA_HOME=/path/to/jdk-17
```

### 问题3: Android SDK未找到

设置ANDROID_HOME环境变量:

```bash
export ANDROID_HOME=/path/to/android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

### 问题4: 同步失败

```bash
# 移除Android平台并重新添加
npx cap rm android
npx cap add android
npx cap sync android
```

## 发布到应用商店

### 1. 配置签名证书

在 `android/app/build.gradle` 中配置签名:

```gradle
android {
    signingConfigs {
        release {
            storeFile file("your-keystore.jks")
            storePassword "your-password"
            keyAlias "your-key-alias"
            keyPassword "your-key-password"
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### 2. 构建Release APK

```bash
cd android
./gradlew assembleRelease
```

### 3. 上传到Google Play

访问 https://play.google.com/console 并上传APK文件。

## 性能优化

### 1. 代码分割

在React中使用 `React.lazy` 和 `Suspense`:

```tsx
const LazyComponent = React.lazy(() => import('./LazyComponent'));
```

### 2. 资源优化

- 压缩图片资源
- 使用WebP格式
- 实现懒加载

### 3. 缓存策略

配置Service Worker进行离线缓存:

```bash
npm install -D vite-plugin-pwa
```

## 安全建议

1. **代码混淆**: 在Release版本中启用ProGuard
2. **网络安全**: 使用HTTPS和证书锁定
3. **数据加密**: 敏感数据使用加密存储
4. **权限最小化**: 只申请必要的权限

## 许可证

本项目采用MIT许可证。

## 联系方式

如有问题,请联系开发团队或提交Issue。
