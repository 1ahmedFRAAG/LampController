//
//  Home.swift
//  Lamp_Controller
//
//  Created by ahmed fraag on 08/05/2023.
//

import SwiftUI

struct Home: View {
    
    //    @Binding var isdark: Bool
    
    private var topedgePadding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    // circle width
    private var cWidth = UIScreen.main.bounds.width / 3
    
    
    @State var gradiantOPacity: Double = 0.0
    @State var angle: Double = 0
    
    var body: some View {
        VStack {
            customHeaderView()
            
            Text("Intensitey")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding()
            
            
            circlerController()
            
            
            Spacer(minLength: 0)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    @ViewBuilder
    func customHeaderView() -> some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            VStack(spacing: -50) {
                Image("lamp")
                    .resizable().renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .offset(y: -30)
               
                    
                
                LinearGradient(colors: [Color.yellow, Color.yellow.opacity(0)], startPoint: .top, endPoint: .bottom)
                    .clipShape(lightShape())
                    .frame(width: 150, height: 100)
                    .padding(.top, 10)
                    .opacity(gradiantOPacity)
                    
            }
            
            
            // action buttons
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "gear")
                        .font(.body)
                        .foregroundStyle(.gray)
                }
                
            }
            .padding()
            .padding(.top, topedgePadding)
            
            
            
        }
        .padding(.bottom)
    }
    
    @ViewBuilder
    func circlerController() -> some View {
        ZStack {
            Circle()
                .fill(.gray.opacity(0.12))
                .frame(width: cWidth, height: cWidth)
            
            ZStack {
                Circle()
                    .fill(RadialGradient(colors: [.white,.white.opacity(0.1)].reversed(), center: .center, startRadius: 0, endRadius: (cWidth - 45)/2  ))
                    .frame(width: cWidth - 45, height: cWidth - 45)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged(onChangeGester(value:))
                    )
                
                Circle().fill(.gray.opacity(0.6))
                    .frame(width: 20, height: 20)
                // move the slider to left
                    .offset(x: -(cWidth - 80) / 2)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged(onChangeGester(value:))
                    )
                    .rotationEffect(.init(degrees: -30))
                // add moving gester
                
                // set controller slider to start point max degree is 210
                
                
                
            }
            
            dots()
            
        }
        .padding()
    }
    
    @ViewBuilder
    func dots() -> some View {
        ForEach(0...40, id: \.self) { index in
            Rectangle()
                .fill(Color.primary.opacity(0.4))
                .frame(width: 2, height: (index % 4 == 0) ? 10 : 3)
                .offset(y: (cWidth - 20) / 2)
                .rotationEffect(.degrees(Double(index) * 6))
            
        }.rotationEffect(.degrees(60))
        
        ForEach(0...10, id: \.self) { index in
            Circle()
                .fill(.gray)
                .frame(width: 8, height: 8)
                .offset(x: -(cWidth + 32) / 2)
                .rotationEffect(.degrees(Double(index) * 24))
        }.rotationEffect(.degrees(-30))
    }
    func onChangeGester(value: DragGesture.Value) {
        let translation = value.location
        
        let vactor = CGVector(dx: translation.x, dy: translation.y)
        let radians = atan2(vactor.dy , vactor.dx )
        
        var angle = radians * 360 / .pi
        
        if angle < 0 || angle > 240{
            return

        }
        self.angle = Double(angle)
        self.gradiantOPacity = Double(angle) / 240

        
        
        
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


