//
//  Home.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 19/10/2020.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile : Bool = false
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(Font.system(size: 30).bold())
                    
                    Spacer()
                    
                    Button(action: {
                        self.showProfile.toggle()
                    }) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()                    .frame(width: 46, height: 46)
                            .clipShape(Circle())
                    }
                } .padding(.horizontal)
                .padding(.top, 15)
                
                Spacer()
            }
            
            MenuView()
                .offset(y: self.showProfile ? 0 : 600)
                .animation(Animation.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0))
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
