//
//  MemorizeGame .swift
//  Memorize Game
//
//  Created by Shreya Wanjari on 18/01/24.
//It is a model  

import Foundation
 struct MemoryGame<CardContent> {
  
    var cards : Array<Card>
    
    func chooseCard(card : Card){
        
    }
    
    struct Card{
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent
        
    }
}
