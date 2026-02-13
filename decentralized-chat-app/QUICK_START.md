# 在本地电脑上构建和安装APK

## 🚀 快速开始(3步)

### 步骤1: 准备本地环境

确保您的电脑已安装:

1. **Node.js 18+**
   - 检查: `node --version`
   - 下载: https://nodejs.org/

2. **Java JDK 11+**
   - 检查: `java -version`
   - 下载: https://adoptium.net/

3. **Git**
   - 检查: `git --version`
   - 下载: https://git-scm.com/

### 步骤2: 克隆代码到本地

```bash
# 克隆仓库
git clone https://github.com/2328939668/Hub.git

# 进入项目目录
cd Hub/decentralized-chat-app
```

### 步骤3: 构建APK

**方式A: 使用自动化脚本(推荐新手)**

```bash
# Windows
.\build-local.sh

# Mac/Linux
./build-local.sh
```

脚本会自动:
- ✅ 检查环境依赖
- ✅ 安装项目依赖
- ✅ 构建Web应用
- ✅ 同步到Android
- ✅ 打开Android Studio

**方式B: 手动分步执行**

```bash
# 1. 安装依赖
npm install

# 2. 构建Web应用
npm run build

# 3. 同步到Android
npx cap sync android

# 4. 打开Android Studio
npx cap open android

# 5. 在Android Studio中构建
# 菜单: Build > Build Bundle(s) / APK(s) > Build APK(s)
```

---

## 📱 安装到手机

### 方法A: 使用ADB安装(最简单)

1. **连接手机到电脑**
   - USB线连接
   - 手机上启用"USB调试"

2. **安装APK**
   ```bash
   cd Hub/decentralized-chat-app/android/app/build/outputs/apk/debug
   adb install app-debug.apk
   ```

3. **启动应用**
   ```bash
   adb shell monkey -p com.hub.decentralizedchat 1
   ```

### 方法B: 直接传输安装

1. **找到APK文件**
   - 位置: `Hub/decentralized-chat-app/android/app/build/outputs/apk/debug/app-debug.apk`

2. **传输到手机**
   - 微信/QQ发送
   - 邮件发送
   - USB复制

3. **在手机上安装**
   - 文件管理器中找到APK
   - 点击安装
   - 允许未知来源

---

## 📋 完整流程

### Windows用户

```cmd
# 1. 打开CMD或PowerShell
# 2. 克隆代码
git clone https://github.com/2328939668/Hub.git

# 3. 进入目录
cd Hub\decentralized-chat-app

# 4. 运行构建脚本
.\build-local.sh

# 5. 等待Android Studio打开

# 6. 在Android Studio中构建APK
#    菜单 > Build > Build Bundle(s) / APK(s) > Build APK(s)

# 7. 找到APK文件
#    通常在: android\app\build\outputs\apk\debug\app-debug.apk

# 8. 连接手机,使用ADB安装
adb install android\app\build\outputs\apk\debug\app-debug.apk
```

### Mac用户

```bash
# 1. 打开Terminal
# 2. 克隆代码
git clone https://github.com/2328939668/Hub.git

# 3. 进入目录
cd Hub/decentralized-chat-app

# 4. 运行构建脚本
./build-local.sh

# 5. 等待Android Studio打开
# 6. 在Android Studio中构建APK
# 7. 找到APK文件

# 8. 连接手机,使用ADB安装
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### Linux用户

```bash
# 1. 打开Terminal
# 2. 克隆代码
git clone https://github.com/2328939668/Hub.git

# 3. 进入目录
cd Hub/decentralized-chat-app

# 4. 运行构建脚本
./build-local.sh

# 5. 等待Android Studio打开
# 6. 在Android Studio中构建APK
# 7. 找到APK文件

# 8. 连接手机,使用ADB安装
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 🔧 详细构建说明

### 首次构建(需要较长时间)

1. **下载依赖** (5-10分钟)
   - Gradle会下载Android SDK组件
   - Android Studio会下载必要工具
   - 需要稳定的网络连接

2. **Gradle同步** (2-3分钟)
   - Android Studio右下角显示进度
   - 首次同步需要较长时间
   - 可以看到"Sync Finished"提示

3. **构建APK** (3-5分钟)
   - 点击Build > Build APK(s)
   - 等待构建完成
   - 看到"BUILD SUCCESSFUL"

### 后续构建(快速)

由于依赖已缓存,后续构建只需1-2分钟。

---

## 📂 APK文件位置

构建成功后,APK位于:

```
Hub/decentralized-chat-app/android/app/build/outputs/apk/debug/app-debug.apk
```

在Android Studio中:
- 点击构建通知中的"locate"按钮
- 或手动导航到上述路径

---

## ⚠️ 常见问题

### 问题1: "Failed to install: INSTALL_FAILED_UPDATE_INCOMPATIBLE"

**原因**: 已安装不同签名的版本

**解决**:
```bash
# 卸载旧版本
adb uninstall com.hub.decentralizedchat

# 重新安装
adb install app-debug.apk
```

### 问题2: "SDK location not found"

**解决**:
- 使用Android Studio打开项目
- Android Studio会自动配置SDK
- 或手动设置: `export ANDROID_HOME=/path/to/sdk`

### 问题3: 构建非常慢

**原因**: 首次构建需要下载大量依赖

**解决**:
- 耐心等待首次构建完成
- 后续构建会快很多
- 确保网络稳定

### 问题4: ADB无法识别设备

**解决**:
```bash
# 重启ADB
adb kill-server
adb start-server

# 重新连接USB
adb devices

# 检查手机USB调试是否启用
# 检查USB连接模式(选择文件传输)
```

### 问题5: 手机提示"危险应用"

**说明**: Debug APK未经过Google签名

**解决**:
- 这是正常现象
- 点击"详细信息"
- 选择"仍然安装"

---

## ✅ 安装验证

### 检查应用是否安装

```bash
# 使用ADB
adb shell pm list packages | grep decentralizedchat

# 应该输出:
# package:com.hub.decentralizedchat
```

### 在手机上验证

1. **查看应用列表**
   - 找到"Decentralized Chat"
   - 检查图标是否正常

2. **启动应用**
   - 点击打开应用
   - 检查启动画面

3. **测试功能**
   - 切换底部5个标签
   - 检查UI显示正常

---

## 🎯 下一步

安装完成后:

1. **体验功能**
   - 测试5个主要模块
   - 熟悉界面和操作

2. **提供反馈**
   - 在GitHub提Issue报告问题
   - 分享使用体验

3. **关注更新**
   - 关注GitHub仓库
   - 获取最新版本

---

## 📞 获取帮助

- **GitHub Issues**: https://github.com/2328939668/Hub/issues
- **文档**: 查看`INSTALL_GUIDE.md`和`BUILD_ANDROID.md`
- **在线搜索**: 搜索错误信息获取解决方案

---

**开始构建吧!整个过程约20-30分钟即可完成首次安装。**
