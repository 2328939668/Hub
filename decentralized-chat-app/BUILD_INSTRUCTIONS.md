# Android APK 构建说明

## 当前状态

Web应用已成功构建并同步到Android项目。但是,由于环境限制,完整的Android构建需要以下额外步骤。

## 已完成的工作

✅ 项目结构创建
- React + TypeScript + Vite 项目
- Capacitor 跨平台框架配置
- 移动端优化的UI界面
- Android原生项目生成

✅ Web应用构建
- 应用代码已编译
- 资源已优化
- 构建产物已生成到 `dist/` 目录

✅ Android项目同步
- Web资源已同步到 `android/app/src/main/assets/public`
- Capacitor配置已生成

## 需要完成的步骤

### 方法1: 使用Android Studio构建(推荐)

1. **安装Android Studio**
   下载地址: https://developer.android.com/studio

2. **打开项目**
   ```bash
   cd decentralized-chat-app
   npx cap open android
   ```

3. **等待依赖下载**
   Android Studio会自动下载所需的SDK和构建工具

4. **构建APK**
   - 在Android Studio菜单中选择: Build > Build Bundle(s) / APK(s) > Build APK(s)
   - APK文件位置: `android/app/build/outputs/apk/debug/app-debug.apk`

### 方法2: 命令行构建

#### 前提条件

1. **安装Android SDK**
   - 下载Command Line Tools: https://developer.android.com/studio#command-line-tools-only
   - 解压到: `/usr/lib/android-sdk`

2. **安装必要的SDK组件**
   ```bash
   # Android SDK Platform 30
   sdkmanager "platforms;android-30"

   # Android SDK Build-Tools 30.0.3
   sdkmanager "build-tools;30.0.3"

   # Android SDK Platform-Tools
   sdkmanager "platform-tools"
   ```

3. **接受许可证**
   ```bash
   sdkmanager --licenses
   ```

#### 构建命令

```bash
# 设置环境变量
export ANDROID_HOME=/path/to/android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# 进入项目目录
cd decentralized-chat-app

# 构建Debug APK
cd android
./gradlew assembleDebug
```

### 方法3: 使用本地构建脚本

如果您的本地环境已经配置好Android SDK,可以直接使用提供的脚本:

```bash
cd decentralized-chat-app
./build-android.sh
```

## APK文件位置

构建成功后,APK文件位于:

```
decentralized-chat-app/android/app/build/outputs/apk/debug/app-debug.apk
```

## 安装到Android设备

### 使用ADB

```bash
# 启用USB调试
# 连接设备
adb devices

# 安装APK
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### 手动安装

1. 将APK文件传输到Android设备
2. 在设备上启用"未知来源"应用安装
3. 点击APK文件进行安装

## 功能说明

应用包含以下5个主要模块:

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

## 故障排除

### 问题1: Gradle构建失败

```bash
# 清理构建缓存
cd android
./gradlew clean

# 重新构建
./gradlew assembleDebug
```

### 问题2: SDK许可证未接受

```bash
# 创建许可证目录
mkdir -p $ANDROID_HOME/licenses

# 接受所有许可证
yes | sdkmanager --licenses
```

### 问题3: Java版本不兼容

确保使用JDK 11或更高版本:

```bash
# 检查Java版本
java -version

# 设置JAVA_HOME
export JAVA_HOME=/path/to/jdk-11
```

### 问题4: 找不到Android SDK

设置正确的ANDROID_HOME:

```bash
export ANDROID_HOME=/path/to/android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/30.0.3
```

## 应用信息

- **应用ID**: com.hub.decentralizedchat
- **应用名称**: Decentralized Chat
- **最小SDK版本**: 24 (Android 7.0+)
- **目标SDK版本**: 30 (Android 11)
- **版本号**: 1.0
- **版本代码**: 1

## 下一步开发

如果需要继续开发,可以:

1. **修改Web应用代码**
   ```bash
   cd decentralized-chat-app
   npm run dev
   ```

2. **热重载到Android**
   ```bash
   # 修改代码后
   npx cap sync android
   ```

3. **在Android Studio中调试**
   ```bash
   npx cap open android
   ```

## 技术支持

如有问题,请参考:

- Capacitor文档: https://capacitorjs.com/docs/android
- Android开发者文档: https://developer.android.com
- Gradle文档: https://docs.gradle.org

## 备注

当前环境已安装:
- ✅ OpenJDK 17
- ✅ Android SDK Tools (基础版本)
- ✅ Node.js + npm
- ✅ Gradle

需要手动安装:
- ❌ Android SDK Platform 30
- ❌ Android SDK Build-Tools 30.0.3

请参考上述方法完成APK构建。
