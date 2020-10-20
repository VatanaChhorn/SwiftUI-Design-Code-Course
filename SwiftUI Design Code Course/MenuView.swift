//
//  MenuView.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 19/10/2020.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Vatana - 28% Complete")
                    .font(.caption)
                    .padding(.top)
                
                Color.white
                    .frame(width: 35, height: 6)
                    .cornerRadius(3.0)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color.black.opacity(0.08))
                    .cornerRadius(3.0)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                SettingView(title: "Accont", icon: "gear")
                SettingView(title: "Billing", icon: "creditcard")
                SettingView(title: "Sign Out", icon: "person.crop.circle")
            } .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.7587038981, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0.0, y: 20)
            .padding()
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct SettingView: View {
    
    @State var title : String
    @State var icon : String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size : 20, weight: .bold))
                .padding(.horizontal)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        } .padding(.top)
    }
}
