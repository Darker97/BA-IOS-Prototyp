//
//  Debug View.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 16.07.20.
//

import SwiftUI

struct Fortschritt: Identifiable{
    var id = UUID()
    var Inhalt: String
    
    init(Inhalt: String){
        self.Inhalt = Inhalt
    }
}

struct Debug_View: View {
    @State var image: Image?
    @State var ShowImage: Image? = nil
    @State var show: Bool
    @State var working: UIImage
    @State private var Inhalt: [Fortschritt] = []
    @State private var Fortschritt = 0.0
    @State private var VerarbeitungIstFertig = false
    
    var body: some View{
        GeometryReader{ metrics in
            VStack(alignment: .center){
                ShowImage?.resizable()
                    .scaledToFit()
                    .frame(width: metrics.size.width * 0.9, height: metrics.size.height * 0.45)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Fortschritt:")
                        .bold()
                    List(Inhalt) { item in
                        Text(item.Inhalt)
                    }
                    ProgressView(value: Fortschritt)
                }
                .frame(width: metrics.size.width * 0.8, height: metrics.size.height * 0.45)
            }
            .frame(width: metrics.size.width, height: metrics.size.height)
            .onAppear {
                DispatchQueue.global().async {
                    // Bedingung wieder entfernen!!!
                    if (hi() == true){
                        
                        ShowImage = image
                        var Workingobject: UIImage = working
                        // load image NUR ZUR SCHAU
                        Workingobject = getPainted(Image: Workingobject)
                        ShowImage = Image(uiImage: Workingobject)
                        Inhalt.append(BA_Prototyp.Fortschritt(Inhalt: "✅  --- KI hat Tabelle gefunden"))
                        Fortschritt = 0.2
                        sleep(1)
                            
                        // Load Bild und setz an die Stelle vom ShowBild && Eintrag in den Inhalt
                        Workingobject = getTable(Image: working)
                        ShowImage = Image(uiImage: Workingobject)
                        Inhalt.append(BA_Prototyp.Fortschritt(Inhalt: "✅  --- KI hat Tabelle geladen"))
                        Fortschritt = 0.4
                        sleep(1)
                        
                        // Load Tesseract && Plot findings
                        working = Workingobject
                        Workingobject = PlotWords(image: Workingobject)
                        ShowImage = Image(uiImage: Workingobject)
                        Fortschritt = 0.6
                        sleep(1)
                        
                        // Load Tesseract && Eintrag in den Inhalt
                        let Text = FindWords(image: working)
                        Inhalt.append(BA_Prototyp.Fortschritt(Inhalt: "✅  --- KI hat den Text gefunden"))
                        Fortschritt = 0.8
                        sleep(1)
                        print(Text)
                        
                        
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
        }.padding().frame(alignment: .leading)
        
    }
}

struct Debug_View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Debug_View(image: Image("TestBilder"), show: false, working: UIImage())
        }
    }
}

