//
//  ContentView.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/05.
//

import SwiftUI

struct ContentView: View {
    
    
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
                
                BlurStackView{
                    Text("현재 청명한 날씨입니다.")
                } contentView: {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
