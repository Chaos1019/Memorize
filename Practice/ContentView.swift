//
//  ContentView.swift
//  Practice
//
//  Created by 骆超然 on 2021/11/7.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚲", "🚅", "🚁", "🚛", "🚗", "🚑", "🚓", "🚒", "✈️", "🚀", "🧹", "🚌", "🏍️", "🚄", "🚙", "🚎", "🛩", "🚟", "⛴", "🚉", "🛵", "🚂", "🏎", "🚡", "🦽"]
    @State var emojiCount = 1
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65.0))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
            
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }

    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
