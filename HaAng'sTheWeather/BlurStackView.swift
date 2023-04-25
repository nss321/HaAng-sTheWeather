//
//  BlurStackView.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/21.
//

import SwiftUI

struct BlurStackView<Header: View, Content: View>: View {
    
    var headerView: Header
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .frame(maxHeight: 45)
                .background(.ultraThinMaterial, in: IndivisualCorner(corners: bottomOffset < 35 ? .allCorners : [.topLeft, .topRight], radius: 12))
                .zIndex(1)
            
            Divider()
            
            contentView
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial, in: IndivisualCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
                .offset(y: topOffset >= 100 ? 0 : topOffset - 100)
                .zIndex(0)
                .clipped()
        }
        .offset(y: topOffset >= 100 ? 0 : -(topOffset - 100))
        .background(
            GeometryReader(content: { geomtry ->
                Color in
                
                let minY = geomtry.frame(in: .global).minY
                let maxY = geomtry.frame(in: .global).maxY
                
                DispatchQueue.main.async {
                    topOffset = minY
                    bottomOffset = maxY - 114
                }
                
                return Color.clear
            })
        )
        .padding()
    }
}

struct BlurStackView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
