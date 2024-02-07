//
//  Game.swift
//  uiKitStart
//
//  Created by Игорь Крысин on 13.12.2023.
//

import Foundation


protocol GameProtocol {
    //общий счет в игре
    var score: Int { get }
    
    var currentRound: GameRoundProtocol! { get }
    //действующее загаданное число
    var currentSecretValue: GeneratorProtocol { get }
    //флаг о состоянии игры
    var isGameEnded: Bool { get }
    
   
    
    
    // метод перезапуска  игры
    func restartGame()
    //метод начала нового раунда
    func startNewRound()
    //метод подсчета очков и равнения загаданного и пользовательского числа
   
    
}



class Game: GameProtocol {
    
  
    
    var score: Int  {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
   
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var currentSecretValue: GeneratorProtocol
    private var roundsCount: Int!
    var isGameEnded: Bool {
        return  roundsCount == rounds.count
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        currentSecretValue = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(currentSecretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
   
    private func getNewSecretValue() -> Int {
        return currentSecretValue.getRandomValue()
    }
    
    
}
