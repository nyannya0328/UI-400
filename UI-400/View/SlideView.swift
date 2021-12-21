//
//  SlideView.swift
//  UI-400
//
//  Created by nyannyan0328 on 2021/12/21.
//

import SwiftUI

struct SlideView: View {
    @Binding var currentTab : String
    
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack(spacing:13){
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Text("Girl")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                   
                    
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                
                
                
                VStack(alignment:.leading, spacing:15){
                    
                    TabCardView(icon: "theatermasks.circle.fill", title: "Home")
                    
                    
                    TabCardView(icon: "safari.fill", title: "Discover")
                    
                    TabCardView(icon: "applewatch", title: "Devices")
                    
                    TabCardView(icon: "person.fill", title: "Profile")
                    
                    TabCardView(icon: "gearshape.fill", title: "Settings")
                    
                    TabCardView(icon: "info.circle.fill", title: "About")
                    
                    TabCardView(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    
                    TabCardView(icon: "rectangle.portrait.and.arrow.right", title: "Log Out")
                    
                    
                    
                }
                
                .padding()
                .padding(.top,50)
                
                
            }
            .frame(width: getRect().width / 1.6)
            .frame(maxWidth:.infinity,alignment: .leading)
            
            
            
            
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
     
    }
    
    @ViewBuilder
    func TabCardView(icon : String,title : String)->some View{
        
        Button {
            
            if title == "Log Out"{
                
                
                
            }
            
            else{
                
                
                withAnimation{
                    
                    currentTab = title
                }
                
                
            }
              
            
            
        } label: {
            
            
            HStack(spacing:10){
                
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 40 : nil, height: 50)
                    .foregroundColor(currentTab == title ? Color("Purple") : (title == "Log Out" ? Color("Orange") : Color.white))
                    .background(
                        ZStack{
                            
                            
                            if currentTab == title{
                                
                                
                                Color.white.clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABANIMATON", in: animation)
                                    
                            }
                        }
                    
                    
                    )
                
                
                Text(title)
                    .font(.callout.bold())
                    .foregroundColor(currentTab == title ? .white : (title == "Log Out" ? Color("Orange") : Color.white))
                  
                
            
                    
                
                
            }
           
            .padding(.trailing,20)
            .background(
                ZStack{
                    
                    
                    if currentTab == title{
                        
                        
                        Color("Purple").clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABANIMATON2", in: animation)
                            
                    }
                }
            
            
            )
            
           
            
            
        }
        .offset(x: currentTab == title ? 10 : 0)

        
        
        
        
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            return .zero
        }
        
        return safeArea
    }
}
