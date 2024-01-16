//
//  ContentView.swift
//  Memorize Game
//
//  Created by Shreya Wanjari on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐷","🐼","🐻","🦊","🐮","🐷","🐼","🐻","🦊","🐮","🐷","🐼","🐻","🦊","🐮"]
    @State var CardCount : Int = 4
    var body: some View {
        VStack{
            ScrollView{
                card
            }
                Spacer()
                cardCountADjuster
            
        }
      
        .padding()
        
    }
    
    var cardCountADjuster : some View{
        HStack{
        cardAdder
        Spacer()
        cardRemover
        }.imageScale(.large)
         .font(.largeTitle)
    }
    var card : some View{
        LazyVGrid(columns : [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<CardCount , id : \.self  ){ item in
                CardView(content: emojis[item] )
                    .aspectRatio(2/3 , contentMode: .fit)
            }
        }.foregroundColor(.red)
    }
    var cardRemover : some View{
        Button(action: {
            if CardCount > 1{
                CardCount -= 1
            }
        },label: {
            Image(systemName: "minus.circle.fill")
        }).disabled(CardCount <= 1 )
    }
    
    var cardAdder : some View{
            Button(action: {
                if CardCount < emojis.count{
                    CardCount += 1
                }
              
            },label: {
                Image(systemName: "plus.circle.fill")
            }).disabled(CardCount >= emojis.count)
    }
    
}

struct CardView : View{
   
    var content : String
   @State var isFaceup : Bool  = true
    var base : RoundedRectangle = RoundedRectangle(cornerRadius: 12)
    var body: some View{
        ZStack{
         Group {
                base.foregroundColor(.white)
                 base.stroke(lineWidth: 3)
                 Text(content).font(.largeTitle)
            }
         .opacity(isFaceup ? 1 : 0)
                base.fill().opacity(isFaceup ? 0 : 1)
            
       
        }.onTapGesture {
            isFaceup.toggle()
        }
    }
}

#Preview {
    ContentView()
}
