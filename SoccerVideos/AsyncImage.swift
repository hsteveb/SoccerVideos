//
//  AsyncImage.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/24/21.
//

import SwiftUI

struct AsyncImage<PlaceHolder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: () -> PlaceHolder
    
    @State private var animate = true

    
    init(url: URL, @ViewBuilder placeholder: @escaping () -> PlaceHolder) {
        self.placeholder = placeholder
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    var body: some View {
        content
            .onAppear {
                print("public body: onAppear being called")
                if loader.image == nil {
                    print("image is nil")
                    withAnimation(.easeInOut(duration: 0.25)) {
                        loader.load()
                    }
                }
                print("public body: onAppear exiting")
            }
    }
    
    private var content: some View {
        VStack {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder()
            }
        }
    }
}
