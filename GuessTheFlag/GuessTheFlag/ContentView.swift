//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gözde Kahraman on 9.03.2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var showingGameOver = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State var score = 0
    @State var question = 0
    var body: some View {
        // Day 22
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
//                .foregroundColor(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//        LinearGradient(gradient: Gradient(stops: [
//                Gradient.Stop(color: .white, location: 0.45),
//                Gradient.Stop(color: .black, location: 0.55),
//            ]), startPoint: .top, endPoint: .bottom)
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple,.red]), center: .center)

//        Button("Delete selection") {
//            print("Now deleting…")
//        }
//        Button("Delete selection", action: executeDelete)
//        Button("Delete selection", role: .destructive, action: executeDelete)
        
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 5") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button {
//                print("Button was tapped")
//            } label: {
//                Text("Tap me!")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(.red)
//            }
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Image(systemName: "pencil")
//            }
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Label("Edit", systemImage: "pencil")
//            }
//        }
//        VStack {
//            Spacer()
//            Button("Show Alert") {
//                    showingAlert = true
//                }.alert("Important message", isPresented: $showingAlert) {
//                    Button("OK") { }
//                }
//            Spacer()
//            Button("Show Alert") {
//                showingAlert = true
//            }.alert("Important message", isPresented: $showingAlert) {
//                    Button("Delete", role: .destructive) { }
//                    Button("Cancel", role: .cancel) { }
//            }
//            Spacer()
//            Button("Show Alert") {
//                showingAlert = true
//            }.alert("Important message", isPresented: $showingAlert) {
//                Button("OK", role: .cancel) { }
//            } message: {
//                Text("Please read this.")
//            }
//            Spacer()
//        }
        // Day 21
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        .alert(scoreTitle, isPresented: $showingScore) {
                            Button("Continue", action:  askQuestion)
                        } message: {
                            Text("Your score is \(score)")
                        }
                        .alert("Game Over", isPresented: $showingGameOver) {
                            Button("Restart", action:  reset)
                        } message: {
                            Text("Your score is \(score)")
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
        }
    }
    
//    func executeDelete() {
//           print("Now deleting…")
//    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 100
        } else {
            scoreTitle = "Wrong! That is the flag of \(countries[number])"
            score -= 100
        }
        question += 1
        
        showingGameOver = question == 8
        showingScore = question != 8
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        question = 0
        score = 0
        askQuestion()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
