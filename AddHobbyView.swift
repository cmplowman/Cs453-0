//
//  AddHobbyView.swift
//  CS453-ASN0
//
//  Created by Chris Plowman on 9/28/23.
//

import SwiftUI

// Construct of the Modal sheet that allows user to add a hobby
struct ModalSheet: View {
    @Binding var showingSheet: Bool
    @Binding var hobbies: [String]
    @State var TextInput: String = ""
    @State var alertToggle = false
    @State var displayPicker = false
    @State var emojiPicked: String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Spacer()
                Spacer()
                Text("Add Hobby")
                    .font(.system(size: 25))
                    .padding()
                
                Spacer()
                    .font(.system(size: 20))
                    .opacity(0)
                    .background(Color.purple)
                
                Button("X") {
                    showingSheet = false
                }
                .font(.system(size: 20).bold())
                .foregroundColor(Color.yellow)
                .padding()
                
            }
            .background(Color.purple)
            
            TextField("Enter New Hobby", text: $TextInput)
            .padding()
            .background(Color.yellow.cornerRadius(15))
                .foregroundColor(.purple)
                .padding()
                .font(.headline)
                .keyboardType(.default)
            
            Button(action: {
                if correctSize() && !isDupe() {
                    displayPicker.toggle()
                }
                else if isDupe() {
                    alertToggle = true
                }
                
            },  label: {
                Text("Submit".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(correctSize() ? Color.yellow : Color.yellow.opacity(0.5))
                    .cornerRadius(15)
                    .padding()
                    .foregroundColor(Color.purple)
                    .font(.system(size: 20).bold())
            })
            .disabled(!correctSize())
            
            .sheet(isPresented: $displayPicker) {
                emojiPickerView(displayPicker: $displayPicker, emojiPicked: $emojiPicked)
                    .onDisappear {
                        TextInput += " " + emojiPicked
                        saveText()
                    }
            }
            .alert("That Hobby is Already Added! ", isPresented: $alertToggle) {
                Button("Cancel", role: .cancel) { }
            }
            
            Spacer()
        }
        .background(Color.purple)
    }
    
    // checks that the user input is correct length
    func correctSize() -> Bool {
        return TextInput.count <= 16 && TextInput.count >= 3
    }
    
    // checks that the user input is not already in the list (case insensitive) and strips white space on comparison
    func isDupe() -> Bool {
        return hobbies.contains(where: { $0.localizedCaseInsensitiveContains(TextInput.replacingOccurrences(of: " ", with: ""))})
    }
    
    // adds the input to the list and clears the input bar
    func saveText() {
        hobbies.append(TextInput)
        TextInput = ""
    }
}
