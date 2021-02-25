//
//  CardView.swift
//  SlotsApp
//
//  Created by Phong Le on 18/02/2021.
//

import SwiftUI

struct CardView: View {
    @Binding var nameCard:String
    @Binding var background:Color
    
    private let transition: AnyTransition = AnyTransition.slide
    
    var body: some View {
        VStack {
            if nameCard == "apple" {
                Image(nameCard)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            } else if nameCard == "cherry" {
                Image(nameCard)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            } else {
                Image(nameCard)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
        }
        .background(background.opacity(0.6))
        .cornerRadius(20)
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            nameCard: Binding.constant("apple"),
            background: Binding.constant(Color.green)
        )
    }
}
