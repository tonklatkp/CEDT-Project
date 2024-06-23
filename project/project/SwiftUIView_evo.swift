//
//  ContentView.swift
//  appProject
//
//  Created by Admin on 22/6/2567 BE.
//

import SwiftUI
import Charts

struct SwiftUIView_evo: View {
    
    struct timeChart:Identifiable{
        var time:Int
        var count:Int
        var id = UUID()
    }
    
    @State var timeChartList:[timeChart] = []
    @State var tableCount:[[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
    var tableImage:[String] = ["bacteria","fish","lizard","monkey","human"]
    @Binding var timeList:[Int]
    @Binding var timeSum:Int
    
    func update(){
        timeChartList.removeAll()
        var maxTime = timeSum
        for i in 1...120{
            timeChartList.append(timeChart(time: i, count: timeList[i]))
            if(timeList[i] != 0){
                maxTime=max(maxTime, i)
            }
        }
        for i in 0...2{
            for j in 0...2{
                if(maxTime>=120){
                    tableCount[i][j]=4
                    maxTime-=120
                }
                else if(maxTime>=90){
                    tableCount[i][j]=3
                    maxTime-=90
                }
                else if(maxTime>=60){
                    tableCount[i][j]=2
                    maxTime-=60
                }
                else if(maxTime>=30){
                    tableCount[i][j]=1
                    maxTime-=30
                }
            }
        }
    }

    var body: some View {
        List{
            VStack{
                HStack{
                    Spacer()
                    Image(tableImage[tableCount[0][0]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[0][1]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[0][2]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Image(tableImage[tableCount[1][0]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[1][1]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[1][2]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Image(tableImage[tableCount[2][0]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[2][1]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Image(tableImage[tableCount[2][2]]).resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                    Spacer()
                }
            }
            Section("CHART"){
                HStack{
                    Chart{
                        ForEach(timeChartList) { time in
                            BarMark(x: .value("time", time.time), y: .value("count", time.count))
                        }
                    }
                    .frame(height: 200)
                    Text("Count").rotationEffect(.degrees(90)).font(.caption2)
                }
                Text("Time(min)").font(.caption2)
            }
        }.onAppear{
            update()
        }
    }
}

//#Preview {
//    SwiftUIView_evo()
//}
