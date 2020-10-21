//
//  UpdateList.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 21/10/2020.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { item in
                NavigationLink(destination: Text(item.subTitle)) {
                    HStack {
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 5)
                        
                        VStack (alignment: .leading, spacing: 8 ){
                            Text(item.title)
                                .font(Font.system(.headline).bold())
                                .font(.system(size: 34))
                                .foregroundColor(.black)
                            
                            Text(item.subTitle)
                                .lineLimit(2)
                                .font(Font.system(.headline))
                                .font(.system(size: 24))
                                .foregroundColor(.secondary)
                        } .padding()
                    }
                }
            }
            .navigationBarTitle(Text("Update"))
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update : Identifiable {
    let id = UUID ()
    let title : String
    let subTitle : String
    let image : Image
    let date: String
}

let updateData = [
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image: Image("Card1"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image: Image("Card2"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image: Image("Card3"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image : Image("Card2"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image : Image("Card3"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "asdklfjklalkdhalfhlagllkahsghalgjklgaw", image: Image("Card4"), date: "10, June")
]


