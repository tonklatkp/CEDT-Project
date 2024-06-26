//
//  SwiftUIView.swift
//  project
//
//  Created by admin on 6/22/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var timer = 0
    @State var timeSum = 0
    @State var timeList:[Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Image")
                VStack {
                    Picker("Time",selection: $timer){
                        ForEach(1..<121){ number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.menu)
                    .scaleEffect(2.0)
                    NavigationLink("Start") {
                        SwiftUIView_Timer(timer2: CGFloat(timer), timeSum: $timeSum, timeList: $timeList)
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    NavigationLink("My Progress"){
                        SwiftUIView_evo(timeList: $timeList, timeSum: $timeSum)
                    }.font(.title3)
                }
            }
        }
        
    }
}
#Preview {
    SwiftUIView()
}
