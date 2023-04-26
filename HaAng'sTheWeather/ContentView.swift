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
                        .foregroundColor(.white)
                        .opacity(setOpacity())
                    Text("청명함")
                        .font(.title3)
                        .opacity(setOpacity())
                    HStack {
                        Text("최고:18°")
                            .font(.title3)
                        Text("최저:12°")
                            .font(.title3)
                    }
                    .opacity(setOpacity())
                }
                .foregroundColor(.white)
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
                        .foregroundColor(.white)
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
                }
                
                BlurStackView{
                    HStack {
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보")
                    }
                    .foregroundColor(.white)
                } contentView: {
                    ForEach(forecast) { dayForcast in
                        VStack {
                            HStack {
                                Text(dayForcast.day)
                                Image(systemName: dayForcast.imageName)
                                    .symbolRenderingMode(.multicolor)
                                Text("\(dayForcast.lowTemperature.description)"+"°")
                                
                                ZStack {
                                    Capsule()
                                        .foregroundColor(.white)
                                    GeometryReader { proxy in
                                        Capsule()
                                            .fill(.linearGradient(Gradient(colors: [.blue, .yellow]),
                                                                  startPoint: .leading, endPoint: .trailing))
                                            .frame(width: dayForcast.arrange)
                                    }
                                }
                                Text("\(dayForcast.highTemperature.description)"+"°")
                            }
                        }
                    }
                }
                
                HStack {
                    BlurStackView {
                        HStack {
                            Image(systemName: "thermometer.medium")
                            Text("체감 온도")
                        }
                    } contentView: {
                        VStack(alignment: .leading){
                            Text("6°")
                                .font(.title)
                            Spacer()
                            Text("바람으로 인해 더 신선하게 느껴지겠습니다.")
                        }
                    }
                    
                    BlurStackView {
                        HStack{
                            Image(systemName: "humidity")
                            Text("습도")
                        }
                    } contentView: {
                        VStack(alignment: .leading){
                            Text("70%")
                                .font(.title)
                            Spacer()
                            Text("현재 이슬점이 2° 입니다.")

                        }
                    }
                    
                }
            }
        }
    }
    
    func setOpacity() -> CGFloat {
        if offset < 10 {
            return offset / 10
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
