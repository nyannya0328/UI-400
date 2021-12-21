//
//  CustomTabView.swift
//  UI-400
//
//  Created by nyannyan0328 on 2021/12/21.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var showSlide : Bool
    @Binding var currentTab : String
    
    var body: some View {
       
        
        VStack{
            
            
            HStack{
                
                Button {
                    withAnimation{
                        
                        showSlide = true
                    }
                    
                } label: {
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                        .opacity(showSlide ? 0 : 1)
                    
                    
                    
                }
                
                
                Spacer()
                
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                
            }
           
            .overlay(
            
                Text(currentTab)
                    .font(.title)
                    .foregroundColor(.white)
            
            )
            .padding([.horizontal,.top])
            .padding(.top,getSafeArea().top)
            
            
            TabView(selection: $currentTab) {
                
                
                Text("Home")
                   
                    .tag("Home")
                
             
                Text("Discover")
                    .tag("Discover")
                
                Text("Devices")
                    .tag("Devices")
                
                Text("Profile")
                    .tag("Profile")
                
                Text("Settings")
                    .tag("Settings")
            
                
                
                
                
            }
            
            
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .overlay(
            
            
            Button(action: {
            
                withAnimation{
                    
                    showSlide = false
                }
                
            }, label: {
                
                
                Image(systemName: "xmark")
                    .font(.title)
                    .opacity(showSlide ? 1 : 0)
                    .foregroundColor(.white)
                
                
                
                
                
                
            })
                .padding()
                .padding(.top)
        
        
            ,alignment: .topLeading
        )
        .background(Color.black)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
