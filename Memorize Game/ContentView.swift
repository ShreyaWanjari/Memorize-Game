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
            HStack{
                ForEach(0..<CardCount , id : \.self  ){ item in
                    CardView(content: emojis[item] )
                }
            }.foregroundColor(.red)
            HStack{
                Button(action: {
                    if CardCount < emojis.count{
                        CardCount += 1
                    }
                  
                },label: {
                    Image(systemName: "plus.circle.fill")
                })
            
                Spacer()
                Button(action: {
                    if CardCount > 1{
                        CardCount -= 1
                    }else{
                        
                    }
                   
                },label: {
                    Image(systemName: "minus.circle.fill")
                })
            }.imageScale(.large)
                .font(.largeTitle)
          
        }
      
        .padding()
        
    }
}

struct CardView : View{
   
    var content : String
   @State var isFaceup : Bool  = true
    var base : RoundedRectangle = RoundedRectangle(cornerRadius: 12)
    var body: some View{
        ZStack{
            if isFaceup {
                base.foregroundColor(.white)
                 base.stroke(lineWidth: 3)
                 Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
       
        }.onTapGesture {
            isFaceup.toggle()
        }
    }
}

#Preview {
    ContentView()
}
