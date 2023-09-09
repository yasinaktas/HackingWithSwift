//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yasin Aktaş on 3.09.2023.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius:5)
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingRestart = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var currentQuestion = 0
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack(spacing:15){
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.bold))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    }label:{
                        CountryImage(country: countries[number])
                    }
                }
                Text("Your score is \(score)")
                    .foregroundStyle(.secondary)
                    .font(.title2.weight(.regular))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }.alert(scoreTitle,isPresented: $showingScore){
            Button("Continue",action: askQuestion)
        }message:{
            Text("Your score is \(score)")
                .foregroundColor(.white)
                .font(.title.bold())
        }.alert(scoreTitle,isPresented: $showingRestart){
            Button("Restart",action: askQuestion)
        }message:{
            Text("Your score is \(score)\nGame is Completed and Restarted Again")
                .foregroundColor(.white)
                .font(.title.bold())
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
        }else{
            scoreTitle = "Wrong"
        }
        currentQuestion += 1
        if currentQuestion == 8{
            showingRestart = true
            currentQuestion = 0
            score = 0
        }else {
            showingScore = true
        }
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
