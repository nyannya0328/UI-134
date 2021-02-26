//
//  MainView.swift
//  UI-134
//
//  Created by にゃんにゃん丸 on 2021/02/26.
//

import SwiftUI
var gra = LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .topTrailing, endPoint: .bottomTrailing)

struct MainView: View {
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
@State var currentpage = 1
    var body: some View {
        
        ScrollView(.init()){
            
            TabView{
                GeometryReader{proxy in
                    
                    let screen = proxy.frame(in:.global)
                    let offset = screen.minX
                    let scale = 1 + (offset / screen.width)
                    
                    TabView(selection:$currentpage){
                        
                        ForEach(1...5,id:\.self){index in
                            
                            Image("img\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getrect().width, height: getrect().height)
                                .cornerRadius(1)
                                .modifier(VeritcalTabviewModifier(screen: screen))
                                .tag(index)
                                
                                
                                
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .rotationEffect(.init(degrees: 90))
                    .frame(width: screen.width)
                    .scaleEffect(scale >= 0.88 ? scale : 0.88,anchor:.center)
                    .offset(x: -offset)
                    .blur(radius: (1-scale) * 20)
                }
               DetatilView(currentpage: $currentpage)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
        .background(Color.black)
        .ignoresSafeArea()
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
struct DetatilView : View {
    @Binding var currentpage : Int
    
    
    var body: some View{
        
        VStack(spacing:15){
            
            Text("Detatils")
                .font(.title)
                .fontWeight(.semibold)
                .kerning(1.5)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,edges?.top ?? 15)
            
            
            Image("img\(currentpage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(15)
            VStack(alignment:.leading,spacing:13){
                
                
                Text("Linea Power")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("By ABC")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,30)
            
            
            Button(action: {}) {
                
                Text("Down Load Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.green.opacity(0.3),lineWidth: 5)
                    
                    )
                
            
                
            }
            .padding(.vertical)
            
            Button(action: {}) {
                
                Text("Click Here")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red.opacity(0.3),lineWidth: 5)
                    
                    )
                
            
                
            }
            
            Button(action: {}) {
                
                Text("Create Your Account")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.purple.opacity(0.3),lineWidth: 5)
                    
                    )
                
            
                
            }
            .padding(.top,20)
            
            
            
            
            Spacer()
        }
        .padding()
        .background(gra.ignoresSafeArea())
        
        
    }
}


extension View{
    
    func getrect() -> CGRect{
        
        
        return UIScreen.main.bounds
    }
}

struct VeritcalTabviewModifier : ViewModifier{
    
    var screen : CGRect
    
    func body(content: Content) -> some View {
        return content
            .frame(width: screen.width, height: screen.height)
            .rotationEffect(.init(degrees: -90))
            .frame(width: screen.height, height: screen.width)
    }

}

var edges = UIApplication.shared.windows.first?.safeAreaInsets
