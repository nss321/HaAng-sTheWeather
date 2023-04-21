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
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .zIndex(1)
            
            Divider()
            
            contentView
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
        
    }
    
    struct BlurStackView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
