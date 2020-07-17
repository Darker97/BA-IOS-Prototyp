//
//  ContentView.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 09.07.20.
//

import SwiftUI


struct ContentView: View {
  
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var working: UIImage = UIImage()
    @State private var show: Bool = true
    @State private var BildIstDa: Bool = true
    
    
    var body: some View {
        NavigationView{
            VStack {
                
                image?.resizable()
                    .scaledToFit()
                
                VStack(spacing: 3.0) {
                    Button("Open Camera") {
                        self.showImagePicker = true
                        self.BildIstDa = false
                    
                    }.padding(.vertical, 10.0)
                        .frame(width: 150.0, height: 50.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    VStack{
                        NavigationLink(destination: Debug_View(image: image, show: show, working: working)) {
                            Text("Weiter")
                        }
                            .padding(.vertical, 10.0)
                            .frame(width: 100.0, height: 50.0)
                            //.accessibility(hidden: BildIstDa)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    Toggle(isOn: $show) {
                        Text("Show debug?")
                    }.frame(width: 200.0, height: 100.0).toggleStyle(SwitchToggleStyle())
                }.frame(width: 300.0, height: 300.0, alignment: .bottom)
                
            }.sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, working: self.$working)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
