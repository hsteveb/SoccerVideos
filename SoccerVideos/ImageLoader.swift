//
//  ImageLoader.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/24/21.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    private var cache: ImageCache?
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    private(set) var isLoading = false
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    
    deinit {
        print("Image Loader: cancelling")
        cancel()
    }
    
    func load() {
        
        guard !isLoading else { return }
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        print("Image Loader: loading image")
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: Self.imageProcessingQueue)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                          receiveOutput: { [weak self] in self?.cache($0)},
                          receiveCompletion: { [weak self] _ in self?.onFinish()},
                          receiveCancel: {
                            [weak self] in self?.onFinish()
                          })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }

    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
