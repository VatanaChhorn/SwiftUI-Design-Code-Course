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
            
            ScrollView(.horizontal, showsIndicators: false) {
                WatchRingVIew()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 25)
            }
            
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



struct WatchRingVIew: View {
    var body: some View {
        HStack(spacing: 10.0) {
            HStack(spacing: 10.0) {
                RingView(color1: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), color2: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), width: 44, height: 44, percentage: 43, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("4 Minutes Left")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Watch 10 Minutes Today.")
                        .font(.caption)
                }
                
            } .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            RingView(color1: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), color2: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), width: 44, height: 44, percentage: 11, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            
            RingView(color1: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), color2: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), width: 44, height: 44, percentage: 97, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), width: 44, height: 44, percentage: 12, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
        }
    }
}
