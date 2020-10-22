//
//  UpdateList.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 21/10/2020.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addNewUpdate() -> Void {
        store.updates.append(Update(title: "New List", subTitle: "New List Subtitle", image: Image("Card1"), date: "14.Oct"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach (store.updates) { item in
                    NavigationLink(destination: UpdateDetial(update: item)) {
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
                .onDelete(perform: { indexSet in
                    self.store.updates.remove(at: indexSet.first!)
                })
                .onMove(perform: { indices, newOffset in
                    self.store.updates.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarItems(leading:
                                    Button(action: {
                                        addNewUpdate()
                                    }, label: {
                                        Text("Add Updates")
                                    })
                                , trailing: EditButton() )
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
    Update(title: "SwiftUI Course", subTitle: "Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive", image: Image("Card1"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished. Demesne new manners savings staying had. Under folly balls death own point now men. Match way these she avoid see death. She whose drift their fat off. ", image: Image("Card2"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "Extremity direction existence as dashwoods do up. Securing marianne led welcomed offended but offering six raptures. Conveying concluded newspaper rapturous oh at. Two indeed suffer saw beyond far former mrs remain. Occasional continuing possession we insensible an sentiments as is. Law but reasonably motionless principles she. Has six worse downs far blush rooms above stood. ", image: Image("Card3"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an. ", image : Image("Card2"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "Good draw knew bred ham busy his hour. Ask agreed answer rather joy nature admire wisdom. Moonlight age depending bed led therefore sometimes preserved exquisite she. An fail up so shot leaf wise in. Minuter highest his arrived for put and. Hopes lived by rooms oh in no death house. Contented direction september but end led excellent ourselves may. Ferrars few arrival his offered not charmed you. Offered anxious respect or he. On three thing chief years in money arise of. ", image : Image("Card3"), date: "10, June"),
    Update(title: "SwiftUI Course", subTitle: "Moments its musical age explain. But extremity sex now education concluded earnestly her continual. Oh furniture acuteness suspected continual ye something frankness. Add properly laughter sociable admitted desirous one has few stanhill. Opinion regular in perhaps another enjoyed no engaged he at. It conveying he continual ye suspected as necessary. Separate met packages shy for kindness. ", image: Image("Card4"), date: "10, June")
]


