//
//  AsyncImage.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/24/21.
//

import SwiftUI

struct AsyncImage<PlaceHolder: View>: View {
    @StateObject private var loader: ImageLoader
    @State var value = true
    @State var repeatAnimation = true
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
                loader.load()
                print("public body: onAppear exiting")
            }
    }
    
    private var content: some View {
        GeometryReader { geometry in
            
            Group {
                if loader.image != nil {
                    Image(uiImage: loader.image!)
                        .resizable()
                }else {
                    placeholder()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.black)
            .opacity(value ? 1.0 : 0.0)
            .onAppear {
                print("private content: onAppear being called")
                if loader.image == nil {
                    print("always loading")
                    let animation = Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
                    withAnimation(animation) {
                        self.value.toggle()
                    }
                } else {
                    print("not loading just putting image up")
                    if animate {
                        self.animate = false
                        withAnimation(.easeInOut(duration: 0.2)) {
                            self.value = true
                        }
                    }
                }
                print("private content: onAppear exiting")
            }

        }

    }
}

/*struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: "", placeholder: ProgressView())
    }
}*/
