//
//  SwiftUIView.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import SwiftUI

struct SwiftUIView: View {
    let imojis: [String] = ["💙", "💚", "💜", "🧡", "💙", "💚", "💜", "🧡", "💙", "💚", "💜", "🧡", "💙", "💚", "💜", "🧡", "💙", "💚", "💜", "🧡"]
    
    @State var imojiCount = 0
    
    var removeButton: some View {
        Button {
            if imojiCount >= 1 {
                imojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        
    }
    
    var addButton: some View {
        Button {
            if imojiCount < imojis.count {
                imojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(imojis[0...imojiCount], id: \.self, content: ({ imoji in
                    CardView(content: imoji)
                        .foregroundColor(.orange)
                        .padding()
                })
                )
            }
            HStack(alignment: .center, spacing: 41) {
                addButton
                Text("Shuffle")
                removeButton
            }
            .padding(.horizontal)
        }.font(.largeTitle)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    let rectangleShape = RoundedRectangle(cornerRadius: 25.0)
    let content: String
    
    var body: some View {
        ZStack(alignment: .center) {
            // viewBuilder
            if isFaceUp {
                rectangleShape                .fill()
                    .foregroundColor(.white)
                rectangleShape                .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(content)
            } else {
                rectangleShape                .fill()
                    .foregroundColor(.blue)
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .preferredColorScheme(.dark)
        SwiftUIView()
            .preferredColorScheme(.light)
    }
}
