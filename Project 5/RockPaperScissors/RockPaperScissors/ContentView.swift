//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Yasin Aktaş on 6.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let choices = ["Rock","Paper","Scissors"]
    let choiceImages = ["mountain.2.fill","books.vertical.fill","scissors"]
    let winOrLose = ["Win","Lose"]
    @State private var choiceNumber = Int.random(in: 0...2)
    @State private var winOrLoseNumber = Int.random(in: 0...1)
    @State private var alertMessage = "Correct"
    @State private var score = 0 {
        willSet{
            if newValue > score {
                alertMessage = "Correct"
            }else {
                alertMessage = "Wrong"
            }
        }
    }
    
    @State private var showAlert = false
    
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient:Gradient(colors:[.green,.white]),startPoint: .top,endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing:50){
                ZStack{
                    Color.gray
                        .frame(maxWidth:.infinity,maxHeight: 75)
                        .clipShape(Capsule())
                        .padding()
                    VStack{
                        Text("AI's choice is \(choices[choiceNumber])")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("AI will \(winOrLose[winOrLoseNumber])")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                }
                Text("So, you need to select...")
                    .font(.title2)
                HStack{
                    ForEach(0..<3){ number in
                        Spacer()
                        Button{
                            objectSelected(number:number)
                            showAlert = true
                        }label:{
                            VStack{
                                Image(choiceImages[number])
                                    .resizable()
                                    .frame(width:50,height:40)
                                Text(choices[number])
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    Spacer()
                }
                ZStack{
                    Color.orange
                        .frame(maxWidth:.infinity,maxHeight: 75)
                        .clipShape(Capsule())
                        .padding()
                    VStack{
                        Text("Your score is \(score)")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                }
            }
        }.alert(alertMessage,isPresented: $showAlert){
            Button("Continue",action: restartGame)
        }message:{
            Text("Score \(alertMessage == "Correct" ? "+1" : "-1")")
        }
    }
    
    func objectSelected(number: Int){
        if winOrLoseNumber == 1 {
            // Should win
            if choiceNumber == 0 && number == 1 {
                score += 1
                return
            }else if choiceNumber == 1 && number == 2 {
                score += 1
                return
            }else if choiceNumber == 2 && number == 0 {
                score += 1
                return
            }
        }else {
            // Should lose
            if choiceNumber == 0 && number == 2 {
                score += 1
                return
            }else if choiceNumber == 1 && number == 0 {
                score += 1
                return
            }else if choiceNumber == 2 && number == 1 {
                score += 1
                return
            }
        }
        score -= 1
    }
    
    func restartGame(){
        choiceNumber = Int.random(in:0...2)
        winOrLoseNumber = Int.random(in:0...1)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
