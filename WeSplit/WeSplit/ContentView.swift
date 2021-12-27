//
//  ContentView.swift
//  WeSplit
//
//  Created by Gozde Kahraman on 27.12.2021.
//

import SwiftUI

struct ContentView: View {   
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 DAY 16
 
struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let  students = ["Harry", "Hermione", "Ron"]
    @State private var selectedSutdent = "Harry"
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
        }
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedSutdent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        Text("Hello, world!")
            .padding()
    }
}
*/
