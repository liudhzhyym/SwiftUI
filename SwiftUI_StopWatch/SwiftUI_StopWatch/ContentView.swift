//
//  ContentView.swift
//  SwiftUI_StopWatch
//
//  Created by bakhaan on 2021/02/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isStart = false
    
    @State private var time: Double = 0
    
    var humanReadableTime: String {
        let sec = Int(time) % 60
        let min = Int(time) / 60
        let milliSec = time.truncatingRemainder(dividingBy: 1)
        let milliString = String(format: "%.2f", milliSec).split(separator: ".").last ?? "0"
        
        return "\(String(format: "%02d", min))" + ":" + "\(String(format: "%02d", sec))" + ":" + milliString
    }
    
    var timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                ClockTick()
                
                ClockNumber()
                
                SecondHand(sec: time)
                MinuteHand(sec: time)
                
                CenterCircle()
                
                MilliClockTick()
                    .offset(y: 50)
                HundredMilliSecHand(sec: time)
                    .offset(y: 50)
                CenterCircle()
                    .offset(y: 50)
            }
            .padding(.bottom, 120)

            StartStopButton(isStard: $isStart)
                .padding(.bottom, 20)
            
            Text(humanReadableTime)
                .font(.largeTitle)
        }
        .onReceive(timer, perform: { _ in
            withAnimation {
                if isStart {
                    self.time += 0.01
                }
            }
        })
    }
}

struct StartStopButton: View {
    
    @Binding var isStard: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            Button(action: {
                isStard = true
            }, label: {
                Text("Start")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(Color.orange)
            })
            
            Button(action: {
                isStard = false
            }, label: {
                Text("Stop")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(Color.orange.opacity(0.5))
            })
        }
    }
}

struct CenterCircle: View {
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
    }
}

struct ClockTick: View {
    
    var tickCount = 60
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount) { tick in
                Rectangle()
                    .frame(width: 1, height: tick % 5 == 0 ? 20 : 10)
                    .offset(y: 100)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360 ))
            }
        }
    }
}

struct MilliClockTick: View {
    
    var tickCount = 10
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount) { tick in
                Rectangle()
                    .frame(width: 1, height: 10)
                    .offset(y: 30)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360 ))
            }
        }
    }
}

struct ClockNumber: View {
    
    var tickCount = 60
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount) { tick in
                if tick % 5 == 0 {
                    ZStack {
                        Text("\(tick)")
                            .rotationEffect(.degrees( Double(tick) / Double(tickCount) * -360 ))
                    }
                    .offset(y: -130)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360 ))
                }
            }
        }
    }
}

struct SecondHand: View {
    
    var sec: Double
    
    private var height: CGFloat = 80
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.orange)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 * 360 ))
    }
}

struct MinuteHand: View {
    
    var sec: Double
    
    private var height: CGFloat = 60
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 / 60 * 360 ))
    }
}

struct HundredMilliSecHand: View {
    
    var sec: Double
    
    private var height: CGFloat = 25
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 * 60 * 360 ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
