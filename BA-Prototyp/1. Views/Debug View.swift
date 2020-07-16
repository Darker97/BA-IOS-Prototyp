//
//  Debug View.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 16.07.20.
//

import SwiftUI

struct Debug_View: View {
    @State var image: Image?
    @State var show: Bool
    @State private var Inhalt: [String] = []
    @State private var Fortschritt = 0.0
    
    var body: some View{
        VStack{
            Text("Hello World")
            ProgressView(value: Fortschritt)
        }
    }
}

struct Debug_View_Previews: PreviewProvider {
    static var previews: some View {
        Debug_View(image: nil, show: true)
    }
}
