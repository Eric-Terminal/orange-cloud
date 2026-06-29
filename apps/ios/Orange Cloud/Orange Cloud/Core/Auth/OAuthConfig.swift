//
//  OAuthConfig.swift
//  Orange Cloud
//
//  在 Cloudflare Dashboard 创建 OAuth Client 后，填入真实 clientID。
//  redirect_uri 必须与 Dashboard 中注册的完全一致。
//

import Foundation

nonisolated enum OAuthConfig {
    /// 自用构建需要替换为 Cloudflare Dashboard 中自建 OAuth Client 的 Client ID。
    static let clientID = "6519f93a6f6f2afe6a89946e68615816"

    /// 自定义 scheme，供 Web 后端 302 跳回 App
    static let callbackScheme = "orangeclouderic"

    // Cloudflare OAuth 只接受 https redirect_uri，指向 Web 后端回调中转（见 apps/web/README.md）
//    #if DEBUG
//    static let redirectURI = "http://localhost:3000/oauth/callback"
//    #else
    static let redirectURI = "https://auth.ericterminal.com/oauth/callback"
//    #endif

    // Cloudflare OAuth 端点
    static let authorizationURL = URL(string: "https://dash.cloudflare.com/oauth2/auth")!
    static let tokenURL         = URL(string: "https://dash.cloudflare.com/oauth2/token")!
    static let revokeURL        = URL(string: "https://dash.cloudflare.com/oauth2/revoke")!
    static let userInfoURL      = URL(string: "https://dash.cloudflare.com/oauth2/userinfo")!
}
