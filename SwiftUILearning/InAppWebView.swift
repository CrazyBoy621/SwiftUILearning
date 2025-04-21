//
//  InAppWebView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 19/04/25.
//


import SwiftUI
@preconcurrency import WebKit

struct InAppWebView: View {
    
    let urlString: String
    var title: LocalizedStringKey = "Maxviylik Siyosati"
    @State private var isLoading: Bool = true
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            NativeWebViewRepresentable(urlString: urlString, isLoading: $isLoading)
                .ignoresSafeArea()
                .overlay(content: LoadingView)
//                .navigationTitle(title)
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar(content: ToolbarContent)
        }
    }
    
    @ViewBuilder func LoadingView() -> some View {
        if isLoading {
            ProgressView()
                .controlSize(.large)
        }
    }
    
    @ToolbarContentBuilder func ToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .fontWeight(.bold)
                    .padding(8)
                    .foregroundStyle(Color(hex: "636364"))
                    .background(Circle().fill(Color(hex: "D0D6DC")))
            }
        }
        ToolbarItem(placement: .principal) {
            Text("")
        }
        ToolbarItem(placement: .topBarLeading) {
            Text("Maxviylik Siyosati")
                .font(.system(size: 18, weight: .bold))
        }
    }
}

#Preview {
    InAppWebView(urlString: "https://www.google.com")
}

struct NativeWebViewRepresentable: UIViewRepresentable {
    
    let urlString: String
    @Binding var isLoading: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        
        let disableTextSelection = """
                var style = document.createElement('style');
                style.innerHTML = 'p, div { -webkit-user-select: none; }';
                document.head.appendChild(style);
            """
        let textSelectionScript = WKUserScript(source: disableTextSelection, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(textSelectionScript)
        let metaZoomDisable = """
            var meta = document.createElement('meta');
            meta.name = 'viewport';
            meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
            document.head.appendChild(meta);
        """
        let zoomDisableScript = WKUserScript(source: metaZoomDisable, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(zoomDisableScript)
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 1.0
        webView.scrollView.pinchGestureRecognizer?.isEnabled = false
        webView.allowsLinkPreview = true
        
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: NativeWebViewRepresentable
        
        init(_ parent: NativeWebViewRepresentable) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.isLoading = false
            }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.parent.isLoading = false
            }
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
                if url.host != parent.urlString {
                    UIApplication.shared.open(url)
                    decisionHandler(.cancel)
                    return
                }
            }
            decisionHandler(.allow)
        }
    }
}
