//
//  Round.swift
//  uiKitStart
//
//  Created by Игорь Крысин on 13.12.2023.
//

import Foundation

protocol GameRoundProtocol {
    
    //общий счет в игре
    var score: Int { get }
    
    //действующее загаданное число
    var currentSecretValue: Int { get }
  
    //метод подсчета очков и равнения загаданного и пользовательского числа
    func calculateScore(with value: Int)
    
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    
    var currentSecretValue: Int = 0
    
    init(currentSecretValue: Int) {
        self.currentSecretValue = currentSecretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
    
}












