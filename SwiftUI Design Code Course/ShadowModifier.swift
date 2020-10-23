//
//  ViewModifier.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 23/10/2020.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
func body(content : Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1.0)
    }
}


