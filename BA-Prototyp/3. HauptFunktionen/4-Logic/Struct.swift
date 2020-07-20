//
//  Struct.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 20.07.20.
//

import Foundation

struct BoundingBox{
    var x: Float
    var y: Float
    var width: Float
    var height: Float
    
    init(x:Float, y:Float, width:Float, height:Float) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
}

struct Zelle: Identifiable{
    var id = UUID()
    var Inhalt:String
    var Bbox: BoundingBox
    var Header: Bool
    var Kategorie: Int
    
    init(Inhalt: String, x:Float, y:Float, width:Float, height:Float) {
        // Alle Inhalte eintragen
        // BBOX bestücken
        self.Bbox = BoundingBox(x: x, y: y, width: width, height: height)
        self.Inhalt = Inhalt
        // Tensorflow nutzen um Kategorie zu finden
        self.Kategorie = findKat(Inhalt: Inhalt)
        // Header Parameter standartmäßig auf false
        self.Header = false
    }
    mutating func changeHeader(new:Bool){
        self.Header = new
    }
    mutating func changeKat(new: Int){
        self.Kategorie = new
    }
}

struct Reihe: Identifiable{
    var id = UUID()
    var Array: [Zelle]
    
    init(Zellen: [Zelle]) {
        // Bekommt ein Array aus Zellen
        // sortiert das Array nach X nach Position
        self.Array = sortArray(Zellen: Zellen)
        // trägt diese in das self.Array ein
        // berechnet die eigene Durchschnittsposi in Y und trägt die eigene Position ein
    }
}

struct Tabelle: Identifiable{
    var id = UUID()
    var Array: [Reihe] = []
    
}

func sortTable(){
    
}

func sortArray(Zellen: [Zelle])->[Zelle]{
    return Zellen
}

func findKat(Inhalt: String)->Int{
    return 0 
}
