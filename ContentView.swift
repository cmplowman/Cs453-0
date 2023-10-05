//
//  ContentView.swift
//  CS453-ASN0
//
//  Created by Chris Plowman on 9/27/23.
//

import SwiftUI
//import EmojiPicker

// The construct of the navigation bar, title and buttons along with the content to be
// displayed on  the screen
struct CustomNavBar: View {
    @State var showingSheet = false
    @State var hobbies: [String] =
    ["Reading 📖","Swimming 🏊‍♂️","Fishing 🎣","Hunting 🦌","Gaming 🎮",
      "Coding 👨‍💻","Sports ⚾️","TV 📺","Drawing ✍️","Music 🎵"]
    
    var body: some View {
        VStack {
            HStack {
                //Specific sized "buttons" to allow specific allignment in the title bar
                PaddingButton
                    .opacity(0)
                    .background(Color.purple)
                PaddingButton
                    .opacity(0)
                    .background(Color.purple)
                Spacer()
                TitleBar
                Spacer()
                Button("+") {
                    showingSheet.toggle()
                }
                .font(.system(size: 30))
                .sheet(isPresented: $showingSheet) {
                    ModalSheet(showingSheet: $showingSheet, hobbies: $hobbies)
                }
                .foregroundColor(Color.yellow)
                PaddingButton
                    .opacity(0)
                    .background(Color.purple)
            }
            .background(Color.purple)
            
            
            if hobbies.count >= 1 {
                VStack(spacing: 0) {
                    HStack {
                        List(hobbies, id: \.self) {
                            Text($0)
                                .listRowBackground(Color.purple)
                                .listRowSeparatorTint(Color.yellow)
                        }
                        .foregroundColor(.yellow)
                        .padding()
                    }
                    .background(Color.purple)
                }
                .scrollContentBackground(.hidden)
                .background(Color.purple)
            }
            
            else {
                Spacer()
                VStack(spacing: 0) {
                    HStack {
                        Text("Add a hobby using the '+' button!")
                        .foregroundColor(.yellow)
                        .padding()
                    }
                    //.background(Color.purple)
                }
                .scrollContentBackground(.hidden)
                .background(Color.purple)
                Spacer()
            }
        }
        .background(Color.purple)
    }
}

// The preview for what the screen will look like
struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBar()
        }
        .background(Color.purple)
    }
}

