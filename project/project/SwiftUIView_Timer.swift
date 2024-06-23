import SwiftUI

struct SwiftUIView_Timer: View {
    @State private var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                Image("Image")
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(timeRemaining) / 20)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    Text("\(timeRemaining)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.frame(width: 320)
                
            }
            .padding()
            List{
                Picker("Time",selection: $timeRemaining){
                    ForEach(0..<121){ number in
                        Text("\(number)")
                    }
                }.pickerStyle(.menu)
            }
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_Timer()
    }
}
