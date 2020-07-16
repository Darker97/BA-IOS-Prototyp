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
    @State private var show: Bool = false
    @State private var BildIstDa: Bool = true
    
    
    var body: some View {
        VStack {
            
            image?.resizable()
                .scaledToFit()
            
            Button("Open Camera") {
                self.showImagePicker = true
                self.BildIstDa = false
            
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            NavigationLink(destination: Debug_View(image: image, show: show)) {
                    Text("weiter")
            }.accessibility(hidden: BildIstDa)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            Toggle(isOn: $show) {
                Text("Show debug?")
            }.toggleStyle(SwitchToggleStyle())
                
            
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
