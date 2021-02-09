//
//  ContentView.swift
//  SwiftUI_Calculator
//
//  Created by bakhaan on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var geometryCircleHeight: CGFloat = 50
    
    @State private var display: String = "0"
    
    @State private var isTyping = false
    
    var core = CalcCore()
    
    let data = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer(minLength: 50)
            
            Text(display)
                .font(.largeTitle)
                .padding(.horizontal, 10)
                .frame(width: UIScreen.main.bounds.size.width, alignment: .trailing)
            
            ForEach(0..<4) { indexI in
                HStack(spacing: 10) {
                    ForEach(0..<4) { indexJ in
                        // 버튼 형태
                        Button(action: {
                            calcAction(symbol: data[indexI][indexJ])
                        }, label: {
                            CalcButton(buttonName: data[indexI][indexJ])
                                .aspectRatio(1, contentMode: .fit)
                        })
                        // tapGesture 형태
//                        CalcButton(buttonName: data[indexI][indexJ])
//                            .aspectRatio(1, contentMode: .fit)
//                            .onTapGesture(count: 1, perform: {
//                                calcAction()
//                            })
                    }
                }
                .padding(.horizontal, 10)
            }
            
            // Last Line
            HStack(spacing: 10) {
                GeometryReader(content: { geometry in
                    
                    Capsule()
                        .foregroundColor(.orange)
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        .overlay (
                            Text(data[4][0])
                                .font(.largeTitle)
                        )
                        .onAppear {
                            self.geometryCircleHeight = geometry.size.height
                        }
                        .onTapGesture {
                            calcAction(symbol: data[4][0])
                        }
                })
                
                CalcButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        calcAction(symbol: data[4][1])
                    }
                CalcButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        calcAction(symbol: data[4][2])
                    }
            }
            .aspectRatio(CGSize(width: geometryCircleHeight * 4 + 30, height: geometryCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 10)
    }
    
    // Button Action
    func calcAction(symbol: String) {
        print(symbol)
        
        if Int(symbol) != nil {
            if isTyping {
                display += symbol
            } else {
                isTyping = true
                display = symbol
            }
            
            if core.rememberSymbol == nil {
                core.digit1 = Double(display)
            } else {
                core.digit2 = Double(display)
            }
            
        } else {
            if symbol != "=" {
                core.rememberSymbol = symbol
            }
            
            if symbol == "AC" {
                core.digit1 = nil
                core.digit2 = nil
                core.calculateResult = nil
                core.rememberSymbol = nil
                display = "0"
            }
            
            if symbol == "%" {
                display = "\(String(describing: core.calcLogic()!))"
                core.digit1 = Double(display)
            }
            
            if symbol == "=" {
                display = "\(String(describing: core.calcLogic()!))"
            }
            
            isTyping = false
        }
    }
}

struct CalcButton: View {
    
    var buttonName = ""
    
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .overlay(
                Text(buttonName)
                    .font(.largeTitle)
                    .foregroundColor(.black)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
