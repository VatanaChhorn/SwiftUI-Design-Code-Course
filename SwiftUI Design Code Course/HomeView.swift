//
//  HomeView.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 21/10/2020.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    @State var showUpdate : Bool = false 
    
    var body: some View {
        VStack  {
            HStack {
                Text("Watching")
                    .font(Font.system(size: 30).bold())
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {
                    
                    self.showUpdate.toggle()
                    
                } ) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16))
                        .imageScale(.medium)
                        .frame(width: 46, height: 46)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0.0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            } .padding(.horizontal)
            .padding(.top, 15)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sectionData) { item in
                        
                        GeometryReader { geometryValue in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometryValue.frame(in: .global).minX - 30 ) / -20),
                                    axis: (x: 0, y: 10, z: 0.0)
                                )
                        } .frame(width: 270, height: 270)
                    }
                    .padding(.top)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 60)
                }
            }
            
            
            Spacer()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section : Section
    
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .frame(width: 160, alignment: .leading)
                    .lineLimit(3)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(section.logo)
                    .resizable()
                    .frame(width: 46, height: 46, alignment: .center)
            } .padding(.horizontal)
            .padding(.top)
            
            Text(section.subTitle.uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding(.horizontal)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .frame(width: 300, height: 265, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(section.color)
        .cornerRadius(20)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
    }
}

struct Section : Identifiable {
    var id = UUID()
    var title : String
    var subTitle : String
    var logo : String
    var image : Image
    var color : Color
}

let sectionData = [
    Section(title: "Prototyping In SwiftUI", subTitle: "21 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")) ,
    Section(title: "UIDesign using Figma", subTitle: "18 Sections", logo: "Logo2", image: Image("Card2"), color: Color("card2")),
    Section(title: "Swift UIKIT Course", subTitle: "30 Sections", logo: "Logo3", image: Image("Card3"), color: Color("card3")),
    Section(title: "App Marketing Course", subTitle: "10 Sections", logo: "Logo3", image: Image("Card4"), color: Color("card4")),
    Section(title: "UIDesign Theory", subTitle: "3 Sections", logo: "Logo2", image: Image("Card5"), color: Color("card5"))
]


