//
//  ContentView.swift
//  UI-134
//
//  Created by にゃんにゃん丸 on 2021/02/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("current page") var current = 1
    var body: some View {
        
       
        if current > totalpages{

            MainView()
        }

        else{
            WorkThrought()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        
        Text("Welocome")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.black)
    }
}

struct WorkThrought : View {
    @AppStorage("current page") var current = 1
    
    var body: some View{
        
        ZStack{
            
            if current == 1{
                
                ScreenView(image: "p1", title: "Step 1", detail: "ABC", bgcolor: Color(#colorLiteral(red: 0.2699777186, green: 0.703289032, blue: 1, alpha: 1)))
                    .transition(.scale)
                
            }
            
            if current == 2{
                ScreenView(image: "p2", title: "Step 2", detail: "EFG", bgcolor: Color(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)))
                    .transition(.scale)
                
                
            }
            
            if current == 3{
                
                ScreenView(image: "p3", title: "Step 3", detail: "HIJ", bgcolor: Color(#colorLiteral(red: 1, green: 0.1176794693, blue: 1, alpha: 1)))
                    .transition(.scale)
            }
            
           
            
           
            
           
        }
        .overlay(
            Button(action: {
                
                if current <= totalpages{
                    
                    current += 1
                }
                else{
                    
                    current = 1
                }
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.3),lineWidth: 4)
                               
                            Circle()
                                .trim(from: 0, to: CGFloat(current) / CGFloat(totalpages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                            
                        
                        }
                        .padding(-15)
                    
                    )
                
                
                
            })
            .padding(.bottom,20)
            ,alignment: .bottom
        )
        
        
    }
}

struct ScreenView: View {
    var image : String
    var title : String
    var detail : String
    var bgcolor : Color
    
    @AppStorage("current page") var current = 1
    var body: some View {
        VStack(spacing:15){
            
            HStack{
                if current == 1{
                    Text("Hello Member")
                        .font(.title)
                        .fontWeight(.semibold)
                        
                        .kerning(1.4)
                }
                
                else{
                    
                    
                    Button(action: {
                        
                        withAnimation(.easeInOut){
                            
                            
                                
                                current -= 1
                      
                            
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,8)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    
                    current = 4
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                    
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .padding(.top)
            
            Text(detail)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            
            Spacer(minLength: 120)
            
            
            
            
            
            
        }
        .background(bgcolor.opacity(0.3).cornerRadius(10).ignoresSafeArea())
    }
}
var totalpages = 3
