//
//  HorizontalScrollView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import SwiftUI

struct HorizontalScrollView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var selection: Int
    let headerObject: HorizontalHeaderInfoProtocol
    private let animation: Animation = .easeInOut(duration: 1.0)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 5){
                    ForEach(0 ..< self.headerObject.getCount(), id: \.self) { value in
                        Button(self.headerObject.getHeaderValue(index: value)) {
                            self.selection = value
                            proxy.scrollTo(value)
                        }
                            .foregroundColor((self.selection == value ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                            /*.onTapGesture {
                                    self.selection = value
                                    proxy.scrollTo(value)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)*/
                    }
                }
                .onChange(of: self.selection, perform: { value in // called once if put on the hstack and changes the value to the correct position.
                    withAnimation(self.animation) {
                        proxy.scrollTo(value)
                    }
                })
            } // end of ScrollViewReader
        }// end of ScrollView
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView(selection: Binding.constant(0),headerObject: Countries())
    }
}
