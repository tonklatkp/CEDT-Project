//
//  SwiftUIView.swift
//  project
//
//  Created by admin on 6/22/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            Image("Image")
            VStack {
                
                Button("Start", action: { })
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
            }
        }
    }
    
}
#Preview {
    SwiftUIView()
}
