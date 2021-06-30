//
//  ContentView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var select = 0
    var body: some View {
        VStack {
            if(self.select == 0) {
                News()
            } else if self.select == 1 {
                Standings()
            } else if self.select == 2 {
                Highlights()
            } else {
                More()
            }

            /*Footer*/
            HStack(alignment: .bottom, spacing: 0) {
                Spacer()
                Button(action: {
                    self.select = 0
                }, label: {
                    VStack(spacing: 1) {
                        Spacer()
                        Image(systemName: "newspaper")
                            .resizable()
                            .aspectRatio(contentMode: .fit
                            )
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("News")
                    }
                })
                .frame(height: 50)
                .foregroundColor((self.select == 0 ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                //.background(Color.blue)
                
                Spacer()
                Button(action: {
                    self.select = 1
                }, label: {
                    VStack(spacing: 1) {
                        Spacer()
                        Image(systemName: "tablecells")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Table")
                    }

                })
                .frame(height: 50)
                .foregroundColor((self.select == 1 ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                //.background(Color.blue)
                
                Spacer()
                Button(action: {
                    self.select = 2
                }, label: {
                    VStack(spacing: 1) {
                        Spacer()
                        Image(systemName: "play.rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Highlights")
                    }

                })
                .frame(height: 50)
                .foregroundColor((self.select == 2 ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                //.background(Color.blue)
                
                Spacer()
                Button(action: {
                    self.select = 3
                }, label: {
                    VStack(spacing: 1) {
                        Spacer()
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("More")
                    }
                })
                .frame(height: 50)
                .foregroundColor((self.select == 3 ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                //.background(Color.blue)
                Spacer()
            }
            .frame(height: 50, alignment: .bottom)
            .font(Font.custom("FredokaOne-Regular", size: 12, relativeTo: .caption))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
