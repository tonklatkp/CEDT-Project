import SwiftUI

struct SwiftUIView_Timer: View {
    var timer2: CGFloat
    @State var timeRemaining: CGFloat = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ZStack {
                Image("Image")
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    
                    Circle()
                        .trim(from: 0, to: timeRemaining/timer2 )
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    Text("\(Int(timeRemaining))")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.frame(width: 320)
                
            }
            .padding()
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
        .onAppear {
            timeRemaining = timer2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_Timer(timer2: 20)
    }
}
