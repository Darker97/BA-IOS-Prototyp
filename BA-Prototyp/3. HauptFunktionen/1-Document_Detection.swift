//
//  1-Document_Detection.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 10.07.20.
//

import Foundation
import SwiftUI

/*
    Findet in einem Bild ein Dokument und gibt ein Aufbereittetes Bild zurück
    Input:      Bild
    Output:     Bild
 */

// AUSGELAGERT AN DIE API

func MachDokumentSchick(image: Image) -> Image{
    var NewImage = FindeDocument(image: image)
    NewImage = Aufbereitung(image: NewImage)
    
    return NewImage
}

//
private func FindeDocument(image: Image) -> Image{
    return image
}

// Nimmt ein Bild und bereitet es auf
private func Aufbereitung(image: Image) -> Image{
    return image
}
