//
//  ContentView.swift
//  SlotsApp
//
//  Created by Phong Le on 18/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "cherry", "star"]
    @State private var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @State private var backgrounds = [
        Color.white, Color.white, Color.white,
        Color.white, Color.white, Color.white,
        Color.white, Color.white, Color.white
    ]
    @State private var credits = 0
    @State private var win = false
    
    var body: some View {
        ZStack {
            // background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45.0)) // xoay 45 độ
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                
                VStack {
                    Spacer()
                    //Title
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("SwiftUI Slots")
                            .bold()
                            .foregroundColor(.white)
                            
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }.scaleEffect(2)
                    
                    Spacer()
                }
                    
                VStack {
                    Text("Credits: " + String(self.credits))
                        .foregroundColor(.black)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .background(self.win ? Color.green.opacity(0.7) : Color.white.opacity(0.7))
                        .animation(.none)
                        .cornerRadius(20)
                        .scaleEffect(self.win ? 1.2 : 1)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    Spacer()
                }
                
                // cards
                HStack {
                    Spacer();
                    
                    CardView(
                        nameCard: self.$symbols[self.numbers[0]],
                        background: self.$backgrounds[0]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[1]],
                        background: self.$backgrounds[1]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[2]],
                        background: self.$backgrounds[2]
                    )
                    
                    Spacer();
                }
                
                HStack {
                    Spacer();
                    
                    CardView(
                        nameCard: self.$symbols[self.numbers[3] % 3],
                        background: self.$backgrounds[3]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[4] % 3],
                        background: self.$backgrounds[4]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[5] % 3],
                        background: self.$backgrounds[5]
                    )
                    
                    Spacer();
                }
                
                HStack {
                    Spacer();
                    
                    CardView(
                        nameCard: self.$symbols[self.numbers[6] % 3],
                        background: self.$backgrounds[6]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[7] % 3],
                        background: self.$backgrounds[7]
                    )
                    CardView(
                        nameCard: self.$symbols[self.numbers[8] % 3],
                        background: self.$backgrounds[8]
                    )
                    
                    Spacer();
                }
                
                Spacer()
            
                VStack {
                    Spacer()
                    //buton
                    Button(action: {
        
                        self.onRandomCard()
                        self.checkWin()
                        
                    }, label: {
                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding(.horizontal, 20)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                    Spacer()
                }
            }
        }
        .animation(.easeOut)
    }
     
    func onRandomCard() {
        // setup background
        // method map in array
        self.backgrounds = self.backgrounds.map{ _ in Color.white }
        
        //random
        self.numbers = self.numbers.map { _ in Int.random(in: 0..<3) }
    }
    
    func checkWin() {
        self.win = false
        
        // row
        if self.isMatch(0, 1, 2) {
            self.credits += 10
        }
        if self.isMatch(3, 4, 5) {
            self.credits += 10
        }
        if self.isMatch(6, 7, 8) {
            self.credits += 10
        }
        //column
        if self.isMatch(0, 3, 6) {
            self.credits += 10
        }
        if self.isMatch(1, 4, 7) {
            self.credits += 10
        }
        if self.isMatch(2, 5, 8) {
            self.credits += 10
        }
        
        // left cross
        if self.isMatch(0, 4, 8) {
            self.credits += 10
        }
        
        // right cross
        if self.isMatch(2, 4, 6) {
            self.credits += 10
        }
    }
    
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        if self.numbers[index1] == self.numbers[index2] &&
            self.numbers[index2] == self.numbers[index3]{

            // update credits and background when u win
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            
            self.win = true
            
            return true
        }

        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
