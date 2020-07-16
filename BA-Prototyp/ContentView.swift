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
    
    var body: some View {
        VStack {
            
            image?.resizable()
                .scaledToFit()
            
            Button("Open Camera") {
                self.showImagePicker = true
            
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            Button("weiter"){
                image = MachDokumentSchick(image: image)
            }
            
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
