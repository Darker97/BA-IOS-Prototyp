//
//  Debug View.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 16.07.20.
//

import SwiftUI

struct Debug_View: View {
    @State var image: Image?
    @State var ShowImage: Image? = nil
    @State var show: Bool
    @State var working: UIImage
    @State private var Inhalt: [String] = []
    @State private var Fortschritt = 0.0
    @State private var VerarbeitungIstFertig = false
    
    var body: some View{
        ShowImage?.resizable()
            .scaledToFit()
        VStack{
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Hello World")
            }
            ProgressView(value: Fortschritt)
                .frame(width: 300.0)
            
        }
        .frame(width: 300.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
        .onAppear {
            DispatchQueue.global().async {
                if (hi() == true){
                    
                    ShowImage = image
                    var Workingobject: UIImage = working
                    // load image NUR ZUR SCHAU
                    Workingobject = getPainted(Image: Workingobject)
                    ShowImage = Image(uiImage: Workingobject)
                    Inhalt.append("✅  --------- KI hat Tabelle gefunden")
                    Fortschritt = 0.2
                        
                    // Load Bild und setz an die Stelle vom ShowBild && Eintrag in den Inhalt
                    Workingobject = getTable(Image: working)
                    ShowImage = Image(uiImage: Workingobject)
                    Inhalt.append("✅  --------- KI hat Tabelle geladen")
                    Fortschritt = 0.4
                    
                    // Load Tesseract && Plot findings
                    
                    Fortschritt = 0.6
                    
                    // Load Tesseract && Eintrag in den Inhalt
                    let Text = FindWords(image: Workingobject)
                    Inhalt.append("✅  --------- KI hat den Text gefunden")
                    Fortschritt = 0.8
                    //print(Text)
                    
                    
                    // Weiter zur Ausgabe
                    if(show == true){
                        //kurzes warten
                        sleep(5)
                        
                        Fortschritt = 1.0
                        // Warten oder gleich weiter zum Ergebnis
                    }
                    
                }
            }
        }
    }
}

struct Debug_View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Debug_View(image: nil, show: true, working: UIImage())
        }
    }
}

