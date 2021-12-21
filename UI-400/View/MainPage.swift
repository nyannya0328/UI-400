//
//  MainPage.swift
//  UI-400
//
//  Created by nyannyan0328 on 2021/12/21.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab : String = "Home"
    
    @State var showSlide : Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            
            SlideView(currentTab: $currentTab)
            
            CustomTabView(showSlide: $showSlide,currentTab: $currentTab)
                .cornerRadius(showSlide ? 20 : 0)
                .rotation3DEffect(.init(degrees: showSlide ? -10 : 0), axis: (x: 0, y: 2, z: 0),anchor: .trailing)
                .offset(x: showSlide ? getRect().width / 1.6 : 0)
                .ignoresSafeArea()
            
            
        }
        .preferredColorScheme(.dark)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
