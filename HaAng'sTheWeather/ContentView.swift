//
//  ContentView.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var topOffset: CGFloat = 0
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("포항시")
                        .font(.title)
                    Text("12°")
                        .font(.system(size: 80, weight: .thin))
                    Text("청명함")
                        .font(.title3)
                    HStack {
                        Text("최고:18°")
                            .font(.title3)
                        Text("최저:12°")
                            .font(.title3)
                    }
                }
                
                VStack(spacing: 0) {
                    Text("현재 청명한 날씨입니다.")
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .zIndex(1)
                    Divider()
                    HStack {
                        VStack {
                            Text("지금")
                            Image(systemName: "moon.stars.fill")
                            Text("12°")
                        }
                        VStack {
                            Text("오후 10시")
                            Image(systemName: "moon.stars.fill")
                            Text("12°")
                        }
                        VStack {
                            Text("오후 11시")
                            Image(systemName: "moon.stars.fill")
                            Text("12°")
                        }
                        VStack {
                            Text("오전 12시")
                            Image(systemName: "moon.stars.fill")
                            Text("12°")
                        }
                    }
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                        .zIndex(0)
                        .clipped()
                }
                .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
                .background(
                    GeometryReader(content: { geomtry ->
                        Color in
                        
                        let minY = geomtry.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            topOffset = minY
                        }
                        
                        return Color.clear
                    })
                )
                .padding()
                
                VStack {
                    HStack {
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보")
                    }
                    Divider()
                    HStack {
                        Text("오늘")
                        Image(systemName: "sun.max.fill")
                        Text("12°")
                        Text("18°")
                    }
                    HStack {
                        Text("토")
                        Image(systemName: "sun.max.fill")
                        Text("10°")
                        Text("16°")
                    }
                    HStack {
                        Text("일")
                        Image(systemName: "cloud.fill")
                        Text("8°")
                        Text("7°")
                    }
                    HStack {
                        Text("월")
                        Image(systemName: "cloud.fill")
                        Text("9°")
                        Text("16°")
                    }
                }
                .padding()
                .background(.purple)
                .opacity(0.8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
