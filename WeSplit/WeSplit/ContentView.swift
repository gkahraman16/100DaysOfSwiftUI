//
//  ContentView.swift
//  WeSplit
//
//  Created by Gozde Kahraman on 27.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return tipValue + checkAmount
    }
    var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code:      Locale.current.currencyCode ?? "USD")
    }
    @FocusState private var amountIsFocused: Bool
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection:      $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(totalPerPerson, format: currency)
                } header: {
                    Text("Amount per person")
                }
                Section {
                    Text(totalAmount, format: currency)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
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
    let students = ["Harry", "Hermione", "Ron"]
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
//deneme
