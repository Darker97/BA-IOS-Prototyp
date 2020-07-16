//
//  3-Tesseract1.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 10.07.20.
//

import Foundation
import SwiftUI
import Vision

/*
    Erhält ein Bild und Findet alle Wörter. Gibt die Markierung als Object zurück
    Input:      Bild
    Output:     Koordinaten Object (x,y,w,h)
 */

func FindWords(image: UIImage){
    var text: String
    
    let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
          let request = VNRecognizeTextRequest { (request, error) in
          guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
          for currentObservation in observations {
            let topCandidate = currentObservation.topCandidates(1)
            text = topCandidate.first!.string
                  
          }
      }
          
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try? requestHandler.perform([request])
}


