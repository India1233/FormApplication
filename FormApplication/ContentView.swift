//
//  ContentView.swift
//  FormApplication
//
//  Created by shiga on 14/11/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import SwiftUI
struct Location {
    static let allLocations = [
    "Hyderabad",
    "Chennai",
    "Bangaloor",
    "Trivendram",
    "Mumbai",
    "Delhi",
    "Rajastan"]
}

struct ContentView: View {
    
    @State private var firstName:String = "shiga"
    @State private var lastName:String  = "suresh"
    @State private var location:String  = ""
    @State private var termsAccepted    = false
    @State private var age              = 20
    private let oldPasswordToConfirmAgainst = "12345"
    @State private var oldpassword      = ""
    @State private var newPassword      = ""
    @State private var confirmPassword = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Deatils").font(.body)) {
                
                TextField("firstname", text: $firstName)
                TextField("lastname", text: $lastName)
                
                Picker(selection: $location, label: Text("location")) {
                    ForEach(Location.allLocations, id: \.self) { location  in
                        Text(location).tag(location)
                    }
                }
                
                Toggle(isOn: $termsAccepted) {
                    Text("Accept terms and conditions")
                }
                
                Stepper(value: $age, in: 18...100) {
                    Text("Current age: \(self.age)")
                }
                
                if isUserInformationValid() {
                    Button(action: {
                        print("Updated profile")
                    }) {
                        Text("Update Profile")
                    }
                }
            }
                
                Section(header: Text("Forgot Password").font(.body)){
                    SecureField("oldpassword", text: $oldpassword)
                    SecureField("newpassword", text: $newPassword)
                    SecureField("confirmpassword", text: $confirmPassword)
                    
                    if isPasswordValid() {
                    Button(action:{
                        print("Updated password")
                    }, label:{
                        Text("Update password")
                    })
                }
                }
                
                

        }
             .navigationBarTitle(Text("PROFILE"), displayMode: .large)
    }
    }
    
    private func isUserInformationValid() -> Bool {
        
        if firstName.isEmpty {
            return false
        }
        
        if lastName.isEmpty {
            return false
        }
        
        if location.isEmpty {
            return false
        }
        
        if !termsAccepted {
            return false
        }
        
        return true
    }
    
    private func isPasswordValid() -> Bool {
        if oldpassword != oldPasswordToConfirmAgainst {
            return false
        }
        
        if newPassword != confirmPassword && newPassword.isEmpty {
            return false
        }
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
