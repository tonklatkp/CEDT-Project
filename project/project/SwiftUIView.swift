//
//  SwiftUIView.swift
//  project
//
//  Created by admin on 6/22/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State var timer = 0
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Image")
                VStack {
                    Picker("Time",selection: $timer){
                        ForEach(0..<121){ number in
                            Text("\(number)")
                            
                        }
                    }
                    .pickerStyle(.menu)
                    .scaleEffect(2.0)
                    NavigationLink("Start") {
                        SwiftUIView_Timer(timer2: CGFloat(timer))
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                }
            }
        }
        
    }
}
#Preview {
    SwiftUIView()
}
