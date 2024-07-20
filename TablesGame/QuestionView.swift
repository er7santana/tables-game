//
//  QuestionView.swift
//  TablesGame
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 20/07/24.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var multiplicationsTable: Int
    @Binding var questionsToAnswer: Int
    
    @State private var tableNumbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State private var questionsAnswered = 0
    @State private var currentQuestion = 0
    @State private var numberToBeMultipliedTo = 0
    @State private var answer = ""
    @State private var score = 0
    @State private var showGameOverAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            Text("\(currentQuestion) / \(questionsToAnswer)")
                .font(.headline)
            
            Text("\(score) points")
                .font(.largeTitle)
            
            Spacer()
            
            Text("How much is")
                .font(.headline)
                        
            Text("\(multiplicationsTable) x \(numberToBeMultipliedTo)")
                .font(.system(size: 50))
            
            TextField("Your answer", text: $answer)
                .font(.system(size: 40))
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                nextQuestion()
            }, label: {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(answer.isEmpty ? .gray : .red)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 6))
            })
            .disabled(answer.isEmpty)
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            nextQuestion()
        }
        .alert("Game over",
               isPresented: $showGameOverAlert) {
            Button("Try again", role: .cancel) {
                restartGame()
            }
            Button("Quit", role: .destructive) {
                presentationMode.wrappedValue.dismiss()
            }
        } message: {
            Text("Final score: \(score) points")
        }
    }
    
    func restartGame() {
        questionsAnswered = 0
        currentQuestion = 0
        numberToBeMultipliedTo = 0
        answer = ""
        score = 0
        showGameOverAlert = false
        tableNumbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        nextQuestion()
    }
    
    func nextQuestion() {
        
        let rightAnswer = numberToBeMultipliedTo * multiplicationsTable
        
        if answer == rightAnswer.formatted() {
            score += 10
        }
        
        guard questionsAnswered < questionsToAnswer else {
            showGameOverAlert = true
            return
        }
        
        questionsAnswered += 1
        currentQuestion += 1
        numberToBeMultipliedTo = tableNumbers.randomElement() ?? 0
        if numberToBeMultipliedTo > 0 {
            if let indexOfNumber = tableNumbers.firstIndex(of: numberToBeMultipliedTo) {
                tableNumbers.remove(at: indexOfNumber)
            }
        }
        print(tableNumbers)
        answer = ""
    }
}

#Preview {
    QuestionView(multiplicationsTable: .constant(2),
                 questionsToAnswer: .constant(3))
}
