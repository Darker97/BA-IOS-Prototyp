//
//  Front.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 20.07.20.
//

import Foundation
import SwiftUI

struct TabellenAnzeige:View{
    @State var NewTabelle: Tabelle
    
    var body: some View{
        ScrollView(.horizontal) {
            ScrollView{
                HStack{
                    ForEach(NewTabelle.Array){ i in
                        Group{
                            VStack{
                                ForEach(i.Array){ cel in
                                    NavigationLink(destination: DetailView(cell: cel)) {
                                        Group{
                                            Text(cel.Inhalt)
                                        }
                                        .padding(.vertical, 10.0)
                                        .frame(width: 100.0, height: 50.0)
                                        .background(Color.green)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TabellenAnzeige_Previews: PreviewProvider {
    static var previews: some View {
        TabellenAnzeige(NewTabelle: Tabelle() )
    }
}

struct DetailView: View{
    
    @State var cell: Zelle
    
    var body: some View{
        Text("Übersicht")
        VStack{
            Text(cell.Inhalt)
            Text("Die Zelle ist ein Header: ")
            //Text(cell.Header)
            
            Text("Die Zelle ist Kategorie: ")
            // Text(cell.Kategorie)
        }
    }
}
