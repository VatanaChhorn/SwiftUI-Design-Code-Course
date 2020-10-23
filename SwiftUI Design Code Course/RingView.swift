//
//  RingView.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 23/10/2020.
//

import SwiftUI

struct RingView: View {
    
    var color1 = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    var color2 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var width : CGFloat = 88
    var height : CGFloat = 88
    var percentage : CGFloat = 88
    @Binding var show : Bool
    
    var body: some View {
        
        let multiplier = width / 44
        let progress = 1 - percentage / 100
        
        ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier)
                )
                .frame(width: width, height: height)
            Circle()
                .trim(from: self.show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    , style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .animation(Animation.easeInOut.delay(0.3))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .frame(width: self.width, height: self.height)
                .shadow(color: Color(color2).opacity(0.2), radius: 10 * multiplier, x: 0, y: 3 * multiplier)
 
            
            Text("\(Int(percentage))%")
                .font(.system(size: 14 * multiplier))
                .bold()
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView( show: .constant(true))
    }
}
