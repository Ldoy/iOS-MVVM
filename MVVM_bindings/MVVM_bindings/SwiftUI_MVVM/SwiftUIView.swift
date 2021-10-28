//
//  SwiftUIView.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import SwiftUI

struct SwiftUIView: View {
    let imojis: [String] = ["💙", "💚", "💜", "🧡"]
    
    @State var imojiCount = 0
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(imojis[0...imojiCount],
                            id: \.self,
                            content: { imoji in
                        CardView(content: imoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    )
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 41) {
                addButton
                Text("Shuffle")
                removeButton
            }
            .padding(.horizontal)
        }.font(.largeTitle)
    }
    
    var removeButton: some View {
        Button {
            if imojiCount > 0 {
                imojiCount -= 1
                print(imojiCount)
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        
    }
    
    var addButton: some View {
        Button {
            if imojiCount < imojis.count - 1{
                imojiCount += 1
                print(imojiCount)
            }
        } label: {
            Image(systemName: "plus.circle")
        }
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
                rectangleShape
                    .fill()
                    .foregroundColor(.white)
                rectangleShape                .strokeBorder(lineWidth: 8)
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
