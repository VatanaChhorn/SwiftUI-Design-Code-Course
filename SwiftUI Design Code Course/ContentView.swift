//
//  ContentView.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 17/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomCardShow = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: self.show ? 20 : 0 )
                .opacity(self.showCard ? 0.4 : 1 )
                .offset(y: self.showCard ? -200 : 0)
                .animation(Animation.default.delay(0.1)
                           //                            .speed(2).repeatCount(3, autoreverses: false)
                )
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: self.showCard ? -180 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect( showCard ? 1 : 0.9)
                .rotationEffect(.degrees( self.show ? 0 : 10))
                .rotationEffect(.degrees(self.showCard ? -10 : +10 ))
                .rotation3DEffect(
                    .degrees(showCard ? 0 :  10),
                    axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: self.showCard ? -140 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect( showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: self.show ? 0 : 5))
                .rotationEffect(.degrees(self.showCard ? -5 : +5 ))
                .rotation3DEffect(
                    .degrees(showCard ? 0 :  5),
                    axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            cardView()
                .frame(width:showCard ? 375 :  340 , height: 220)
                .background(Color.black)
                //                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 :  20, style: .continuous))
                .shadow(radius: 20)
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .offset( y: self.showCard ? -100 : 0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    //                    self.show.toggle()
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture().onChanged {
                        value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    
                    .onEnded({ (value) in
                        self.viewState = .zero
                        self.show = false
                    })
                )
            
            BottomCardView(show: $showCard)
                .offset(x: 0, y: self.showCard ? 360 :  1000)
                .offset(y: bottomCardShow.height)
                .blur(radius: self.show ? 20 : 0 )
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.bottomCardShow = value.translation
                            if bottomCardShow.height < -300 {
                                self.bottomCardShow.height = -300
                            }
                        })
                        .onEnded({ (value) in
                            
                            if bottomCardShow.height < -200 {
                                bottomCardShow.height = -300
                            } else if bottomCardShow.height > 200 {
                                self.showCard = false
                                self.bottomCardShow = .zero
                            }
                            else {
                                self.bottomCardShow = .zero
                            }
                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct cardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("UI Design")
                        .font(Font.title.smallCaps())
                        .foregroundColor(.white)
                    Text("Certificate")
                        .font(.subheadline)
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Logo1"))
            }
            .padding()
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Card1"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    
    @Binding var show : Bool
    
    var body: some View {
        VStack (spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Vatana has achieved the UI Design Course.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack(spacing: 20.0) {
                RingView(color1: #colorLiteral(red: 0.1707445383, green: 0.7233839631, blue: 0.8806011081, alpha: 1), color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), width: 88, height: 88, percentage: 74, show: $show)
                    
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI Course").fontWeight(.bold)
                    Text("Finished 10 out of 12 Sections")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
            }
            
            
            
            Spacer()
        }
        .padding(.top, 10).padding(.horizontal, 20)
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(30)
        .shadow(radius: 20 )
    }
}
