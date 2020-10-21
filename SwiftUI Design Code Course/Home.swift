//
//  Home.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 19/10/2020.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile : Bool = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile : $showProfile)
            .padding(.top, 40)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0.0, y: 25)
            .offset(x: 0, y: self.showProfile ? -450 + self.viewState.height : 0 )
            .rotation3DEffect(
                Angle(degrees: self.showProfile ? -10 : 0),
                axis: (x: 10.0, y: 0.0, z: 0.0)
            )
            .scaleEffect(self.showProfile ? 0.9 : 1 )
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: self.showProfile ? 0 : screen.height)
                .offset(y : self.viewState.height)
                .animation(Animation.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0))
                .onTapGesture(count: 1, perform: {
                    self.showProfile.toggle()
                })
            
                .gesture(DragGesture()
                            .onChanged({ (value) in
                                self.viewState = value.translation
                            })
                            .onEnded({ (value) in
                                if self.viewState.height > 50 {
                                    self.showProfile = false
                                }
                                self.viewState = .zero
                            })
                )
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile : Bool
    var body: some View {
        Button(action: {
            self.showProfile.toggle()
        }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()                    .frame(width: 46, height: 46)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
