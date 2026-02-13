import { useState } from 'react'
import './App.css'

function App() {
  const [currentTab, setCurrentTab] = useState('chat')

  return (
    <div className="app">
      <header className="app-header">
        <h1>去中心化聊天</h1>
      </header>

      <main className="app-content">
        {currentTab === 'chat' && (
          <div className="tab-content">
            <h2>匿名加密聊天</h2>
            <p>端到端加密的匿名聊天功能</p>
            <div className="feature-list">
              <div className="feature-item">
                <span className="icon">🔒</span>
                <span>端到端加密</span>
              </div>
              <div className="feature-item">
                <span className="icon">👤</span>
                <span>匿名身份</span>
              </div>
              <div className="feature-item">
                <span className="icon">💬</span>
                <span>实时通讯</span>
              </div>
            </div>
          </div>
        )}

        {currentTab === 'social' && (
          <div className="tab-content">
            <h2>朋友圈与社区</h2>
            <p>分享动态,加入微社区</p>
            <div className="feature-list">
              <div className="feature-item">
                <span className="icon">📷</span>
                <span>朋友圈</span>
              </div>
              <div className="feature-item">
                <span className="icon">👥</span>
                <span>微社区</span>
              </div>
              <div className="feature-item">
                <span className="icon">❤️</span>
                <span>点赞评论</span>
              </div>
            </div>
          </div>
        )}

        {currentTab === 'wallet' && (
          <div className="tab-content">
            <h2>加密货币钱包</h2>
            <p>管理您的数字资产</p>
            <div className="feature-list">
              <div className="feature-item">
                <span className="icon">💰</span>
                <span>转账功能</span>
              </div>
              <div className="feature-item">
                <span className="icon">🧧</span>
                <span>发红包</span>
              </div>
              <div className="feature-item">
                <span className="icon">🪙</span>
                <span>自定义代币</span>
              </div>
            </div>
          </div>
        )}

        {currentTab === 'browser' && (
          <div className="tab-content">
            <h2>Web3浏览器</h2>
            <p>访问去中心化应用</p>
            <div className="feature-list">
              <div className="feature-item">
                <span className="icon">🌐</span>
                <span>DApp浏览</span>
              </div>
              <div className="feature-item">
                <span className="icon">🔗</span>
                <span>钱包连接</span>
              </div>
              <div className="feature-item">
                <span className="icon">⚡</span>
                <span>智能合约交互</span>
              </div>
            </div>
          </div>
        )}

        {currentTab === 'apps' && (
          <div className="tab-content">
            <h2>小程序平台</h2>
            <p>丰富的轻量级应用</p>
            <div className="feature-list">
              <div className="feature-item">
                <span className="icon">📱</span>
                <span>应用市场</span>
              </div>
              <div className="feature-item">
                <span className="icon">⚙️</span>
                <span>沙箱运行</span>
              </div>
              <div className="feature-item">
                <span className="icon">🔒</span>
                <span>安全隔离</span>
              </div>
            </div>
          </div>
        )}
      </main>

      <nav className="bottom-nav">
        <button
          className={`nav-item ${currentTab === 'chat' ? 'active' : ''}`}
          onClick={() => setCurrentTab('chat')}
        >
          <span className="nav-icon">💬</span>
          <span className="nav-label">聊天</span>
        </button>
        <button
          className={`nav-item ${currentTab === 'social' ? 'active' : ''}`}
          onClick={() => setCurrentTab('social')}
        >
          <span className="nav-icon">👥</span>
          <span className="nav-label">社交</span>
        </button>
        <button
          className={`nav-item ${currentTab === 'wallet' ? 'active' : ''}`}
          onClick={() => setCurrentTab('wallet')}
        >
          <span className="nav-icon">💰</span>
          <span className="nav-label">钱包</span>
        </button>
        <button
          className={`nav-item ${currentTab === 'browser' ? 'active' : ''}`}
          onClick={() => setCurrentTab('browser')}
        >
          <span className="nav-icon">🌐</span>
          <span className="nav-label">浏览器</span>
        </button>
        <button
          className={`nav-item ${currentTab === 'apps' ? 'active' : ''}`}
          onClick={() => setCurrentTab('apps')}
        >
          <span className="nav-icon">📱</span>
          <span className="nav-label">小程序</span>
        </button>
      </nav>
    </div>
  )
}

export default App
