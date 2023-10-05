//
//  ExtensionsView.swift
//  CS453-ASN0
//
//  Created by Chris Plowman on 9/28/23.
//

import SwiftUI


// Layout for the title/nav bar
extension CustomNavBar {
    var TitleBar: some View {
        VStack(spacing: 5) {
            Text("Hobby Tracker")
                .font(.title)
                .foregroundColor(.yellow).ignoresSafeArea()
                .background(Color.purple)
        }
        .background(Color.purple)
    }
}


// Button with no action to assist in allignment for title items
extension CustomNavBar {
    var PaddingButton: some View {
        Button(action: {
            
            
        }, label: {Image(systemName: "plus")
            
        })
        .background(Color.purple)
    }
}
