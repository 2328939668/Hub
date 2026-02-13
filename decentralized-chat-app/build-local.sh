#!/bin/bash

# 本地Android APK构建脚本
# 在您的本地电脑上运行此脚本

set -e  # 遇到错误立即退出

echo "================================"
echo "去中心化聊天平台 - 本地APK构建脚本"
echo "================================"
echo ""

# 检查Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 错误: 未安装Node.js"
    echo "请访问 https://nodejs.org/ 下载安装"
    exit 1
fi

echo "✅ Node.js版本: $(node --version)"
echo "✅ npm版本: $(npm --version)"
echo ""

# 检查Java
if ! command -v java &> /dev/null; then
    echo "❌ 错误: 未安装Java JDK"
    echo "请访问 https://adoptium.net/ 下载JDK 11或更高版本"
    exit 1
fi

echo "✅ Java版本: $(java -version 2>&1 | head -n 1)"
echo ""

# 检查ADB
if command -v adb &> /dev/null; then
    echo "✅ ADB已安装: $(adb --version | head -n 1)"
    echo ""
else
    echo "⚠️  警告: 未安装ADB"
    echo "安装Android Studio会自动安装ADB"
    echo ""
fi

# 步骤1: 安装依赖
echo "================================"
echo "步骤 1: 安装项目依赖"
echo "================================"
echo ""

npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"
echo ""

# 步骤2: 构建Web应用
echo "================================"
echo "步骤 2: 构建Web应用"
echo "================================"
echo ""

npm run build

if [ $? -ne 0 ]; then
    echo "❌ Web应用构建失败"
    exit 1
fi

echo "✅ Web应用构建完成"
echo ""

# 步骤3: 同步到Android
echo "================================"
echo "步骤 3: 同步到Android平台"
echo "================================"
echo ""

npx cap sync android

if [ $? -ne 0 ]; then
    echo "❌ Android同步失败"
    exit 1
fi

echo "✅ Android同步完成"
echo ""

# 步骤4: 检查Android Studio
echo "================================"
echo "步骤 4: 检查Android Studio"
echo "================================"
echo ""

if [ -n "$CAPACITOR_ANDROID_STUDIO_PATH" ]; then
    echo "✅ 使用自定义Android Studio路径: $CAPACITOR_ANDROID_STUDIO_PATH"
    STUDIO_PATH="$CAPACITOR_ANDROID_STUDIO_PATH"
else
    # 尝试常见的Android Studio安装路径
    STUDIO_PATH=""

    if [ -d "/usr/local/android-studio" ]; then
        STUDIO_PATH="/usr/local/android-studio"
    elif [ -d "/opt/android-studio" ]; then
        STUDIO_PATH="/opt/android-studio"
    elif [ -d "$HOME/Android Studio" ]; then
        STUDIO_PATH="$HOME/Android Studio"
    elif [ -d "$HOME/Applications/Android Studio.app" ]; then
        STUDIO_PATH="$HOME/Applications/Android Studio.app"
    fi

    if [ -n "$STUDIO_PATH" ]; then
        echo "✅ 找到Android Studio: $STUDIO_PATH"
    else
        echo "❌ 未找到Android Studio"
        echo ""
        echo "请先安装Android Studio:"
        echo "https://developer.android.com/studio"
        echo ""
        echo "安装后可以:"
        echo "1. 使用Gradle直接构建: cd android && ./gradlew assembleDebug"
        echo "2. 或设置Android Studio路径: export CAPACITOR_ANDROID_STUDIO_PATH=/path/to/studio"
        exit 1
    fi
fi

echo ""
echo "================================"
echo "构建准备完成!"
echo "================================"
echo ""
echo "APK文件将在以下位置生成:"
echo "  android/app/build/outputs/apk/debug/app-debug.apk"
echo ""

# 提供两种构建方式
echo "请选择构建方式:"
echo ""
echo "选项1: 使用Android Studio构建(推荐)"
echo "  执行: npx cap open android"
echo ""
echo "选项2: 使用Gradle直接构建"
echo "  执行: cd android && ./gradlew assembleDebug"
echo ""

read -p "按Enter继续,或Ctrl+C退出..."

# 打开Android Studio
echo ""
echo "正在打开Android Studio..."
npx cap open android

echo ""
echo "================================"
echo "后续步骤:"
echo "================================"
echo ""
echo "1. 等待Android Studio完全启动并同步项目"
echo "2. 在菜单栏选择: Build > Build Bundle(s) / APK(s) > Build APK(s)"
echo "3. 等待构建完成(首次需要5-10分钟)"
echo "4. 构建完成后,通知会显示APK位置"
echo "5. 点击通知中的'locate'按钮找到APK文件"
echo ""
echo "或者使用ADB安装:"
echo "  adb install android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
