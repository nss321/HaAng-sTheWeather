//
//  IndivisualCorner.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/25.
//

import SwiftUI

struct IndivisualCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))        
        return Path(path.cgPath)
    }
}

