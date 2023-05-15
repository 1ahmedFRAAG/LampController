//
//  LightShape.swift
//  Lamp_Controller
//
//  Created by ahmed fraag on 15/05/2023.
//

import SwiftUI


struct lightShape: Shape {
    func path(in rect: CGRect) -> Path {

        
        return Path { path in
            
            let height = rect.height
            let width = rect.width
            
            path.move(to: CGPoint(x: width/2 - 38, y: 0))
            
            let toPoint = CGPoint(x: width/2, y: -10)
            let cont1 = CGPoint(x: width/2 - 38, y: 0)
            let cont2 = CGPoint(x: width/2 - 38, y: -10)
            
            path.addCurve(to: toPoint, control1: cont1, control2: cont2)
            
            let toPoint2 = CGPoint(x: width/2 + 38, y: 0)
            let cont3 = CGPoint(x: width/2 + 38, y: -10)
            let cont4 = CGPoint(x: width/2 + 38, y: 0)
            path.addCurve(to: toPoint2, control1: cont3, control2: cont4)
            
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))

            
        }
         
        
    }
}
