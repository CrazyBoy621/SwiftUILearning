//
//  Image+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 07/04/25.
//

import SwiftUI
import Kingfisher

struct Image_Learning: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                Image(.largeAppStore)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 420)
                Image(.appStore)
                // Custom our image loader
                OnlineImage(URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"))
                // Async image
                ForEach(0..<20) { i in
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct OnlineImage: View {
    
    var url: URL?
    
    init(_ url: URL? = nil) {
        self.url = url
        Kingfisher.ImageCache.default.memoryStorage.config.countLimit = 100
        Kingfisher.ImageCache.default.diskStorage.config.sizeLimit = 1024 * 1024 * 10
        Kingfisher.ImageCache.default.diskStorage.config.expiration = .seconds(10)
    }
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .border(.red)
        
    }
    
}

#Preview {
    Image_Learning()
}
