//
//  UpdateDetial.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 21/10/2020.
//

import SwiftUI

struct UpdateDetial: View {
    
    var update = updateData[0]
    
    var body: some View {
        
        List {
            VStack (spacing : 20) {
                update.image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(update.subTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            } .navigationBarTitle(update.title)
        } .listStyle(PlainListStyle())
    }
}

struct UpdateDetial_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetial()
    }
}
