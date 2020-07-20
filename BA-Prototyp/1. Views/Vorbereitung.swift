//
//  Vorbereitung.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 20.07.20.
//

import Foundation
import SwiftUI

struct Vorbereitung: View{
    
    @State private var ErsteZeile: Bool = true
    @State private var ErsteSpalte: Bool = false
    @State var NewTabelle: Tabelle
    
    var body: some View{
        VStack {
            Toggle(isOn: $ErsteZeile) {
                Text("Enthält die erste Zeile Überschriften?")
            }
            Toggle(isOn: $ErsteSpalte) {
                Text("Enthält die erste Spalte Überschriften?")
            }
            Spacer()
            NavigationLink(destination: TabellenAnzeige(NewTabelle: NewTabelle )) {
                Text("Weiter")
            }
                .padding(.vertical, 10.0)
                .frame(width: 100.0, height: 50.0)
                //.accessibility(hidden: BildIstDa)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
    }
}


