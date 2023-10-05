//
//  EmojiPickerView.swift
//  CS453-ASN0
//
//  Created by Chris Plowman on 10/3/23.
//

import SwiftUI

struct emojiPickerView: View {
    @Binding var displayPicker: Bool
    @Binding var emojiPicked: String
    let emojis = ["📖","👨‍💻","⚾️","📺","✍️","🎵","🎮","🦌","🎣","🏊‍♂️","🏈","🕺","🪡","⚽️","🎹","🏋️","🛍️","🛶","🍻","🏃"]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                ForEach(emojis, id: \.self) {emoji in
                    Text(emoji)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.purple)
                        .onTapGesture {
                            emojiPicked = emoji
                            displayPicker = false
                        }
                }
            }
        }
        .background(Color.purple)
    }
}
