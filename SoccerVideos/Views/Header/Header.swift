//
//  Header.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI

struct Header: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding private var refresh: Bool
    private let content: () -> Void
    private let title: String
    
    init(title: String = "", refresh: Binding<Bool> = Binding.constant(false), content: @escaping () -> Void = {}) {
        self._refresh = refresh
        self.content = content
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 0){
            HStack(alignment: .center, spacing: 5) {
                Button(self.title) {
                    content()
                }
                
                ProgressView()
                    .opacity(self.refresh ? 1.0 : 0.0)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "person.crop.circle")
                })
            }
            
            .frame(height: 50, alignment: .center)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .font(Font.custom("FredokaOne-Regular", size: 24, relativeTo: .title2))
            .foregroundColor(self.colorScheme == .dark ? .white : .orange)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(refresh: Binding.constant(false)){
            
        }
    }
}
