//
//  ContentView.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if offset >= 20 {
                        Text("포항시")
                            .font(.title)
                    } else {
                        VStack {
                            Text("포항시")
                                .font(.title)
                            HStack {
                                Text("12°")
                                    .font(.title3)
                                Text("청명함")
                                    .font(.title3)
                            }
                        }
                    }
                    Text("12°")
                        .font(.system(size: 80, weight: .thin))
                    Text("청명함")
                        .font(.title3)
                        .opacity(setOpacity())
                    HStack {
                        Text("최고:18°")
                            .font(.title3)
                            .opacity(setOpacity())
                        Text("최저:12°")
                            .font(.title3)
                            .opacity(setOpacity())
                    }
                }
                .offset(y: -offset+20)
                .background(
                    GeometryReader(content: { geomtry ->
                        Color in
                        
                        let minY = geomtry.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            offset = minY
                        }
                        
                        return Color.clear
                    })
                )
                
                BlurStackView{
                    Text("현재 청명한 날씨입니다.")
                } contentView: {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForecastView(time: "지금", celcius: "12", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 12시", celcius: "12°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 1시", celcius: "11°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 2시", celcius: "11°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 3시", celcius: "11°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 4시", celcius: "11°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 5시", celcius: "11°", imageName: "moon.stars.fill")
                            ForecastView(time: "오전 5:41", celcius: "일출", imageName: "sunrise.fill")
                            
                        }
                    }
                    //                    HStack {
                    //                        VStack {
                    //                            Text("지금")
                    //                            Image(systemName: "moon.stars.fill")
                    //                            Text("12°")
                    //                        }
                    //                        VStack {
                    //                            Text("오후 10시")
                    //                            Image(systemName: "moon.stars.fill")
                    //                            Text("12°")
                    //                        }
                    //                        VStack {
                    //                            Text("오후 11시")
                    //                            Image(systemName: "moon.stars.fill")
                    //                            Text("12°")
                    //                        }
                    //                        VStack {
                    //                            Text("오전 12시")
                    //                            Image(systemName: "moon.stars.fill")
                    //                            Text("12°")
                    //                        }
                    //                    }
                }
                
                
                BlurStackView{
                    HStack {
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보")
                    }
                } contentView: {
                    VStack {
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
                }
            }
        }
    }
    
    func setOpacity() -> CGFloat {
        if offset < 20 {
            return offset / 20
        } else {
            return 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
