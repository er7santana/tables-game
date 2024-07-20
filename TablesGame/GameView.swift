//
//  GameView.swift
//  TablesGame
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 20/07/24.
//

import SwiftUI

struct GameView: View {
    
    @State private var multiplicationTable = 2
    @State private var questionsToAnswer = 3
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Which multiplication tables you want to practice?")
                        .font(.headline)
                    
                    Stepper(value: $multiplicationTable, in: 1...10) {
                        Text(multiplicationTable.formatted())
                            .font(.largeTitle)
                    }
                }
                
                Section {
                    Text("How many questions do you want to answer?")
                        .font(.headline)
                    
                    Stepper(value: $questionsToAnswer, in: 1...10) {
                        Text(questionsToAnswer.formatted())
                            .font(.largeTitle)
                    }
                }
            }
            
            NavigationLink {
                QuestionView(multiplicationsTable: $multiplicationTable,
                             questionsToAnswer: $questionsToAnswer)
            } label: {
                Text("START GAME")
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 6))
            }
            .padding(.top, 120)
        }
        .padding()
        .navigationTitle("Shaft Tables")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GameView()
    }
}
