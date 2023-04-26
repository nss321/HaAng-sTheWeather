//
//  ForecastView.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/21.
//

import SwiftUI

struct ForecastView: View {
    
    var time: String
    var celcius: String
    var imageName: String
    
    var body: some View {
        VStack {
            Text(time)
                .fontWeight(.bold)
            Image(systemName: imageName)
                .font(.title3)
                .symbolVariant(.fill)
                .symbolRenderingMode(.multicolor)
                .frame(height: 30)
            Text("\(celcius)")
        }
        .foregroundColor(.white)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(time: "지금", celcius: "13", imageName: "moon.stars.fill")
    }
}
