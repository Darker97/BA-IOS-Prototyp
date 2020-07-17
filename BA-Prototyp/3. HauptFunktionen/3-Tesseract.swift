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

func FindWords(image: UIImage) -> [String]{
    var Ziel_text: [String] = []
    
    let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
          let request = VNRecognizeTextRequest { (request, error) in
          guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
          for currentObservation in observations {
            let topCandidate = currentObservation.topCandidates(1)
            for i in topCandidate{
                Ziel_text.append(i.string)
            }
          }
      }
          
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try? requestHandler.perform([request])
    
    return Ziel_text
}


func PlotWords(image: UIImage) -> UIImage{
    var result:UIImage = UIImage()
    
    let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
      let request = VNRecognizeTextRequest { (request, error) in
        guard let results = request.results as? [VNRecognizedTextObservation] else { return }
        UIGraphicsBeginImageContextWithOptions(image.size, false, 1.0)
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        for i in results{
            
            
            var rect = i.boundingBox
            
            let x=rect.origin.x*image.size.width
            let w=rect.width*image.size.width
            let h=rect.height*image.size.height
            let y=image.size.height*(1-rect.origin.y)-h
            let conv_rect=CGRect(x: x, y: y, width: w, height: h)
            
            let c=UIGraphicsGetCurrentContext()!
                      c.setStrokeColor(UIColor.red.cgColor)
                      c.setLineWidth(0.01*image.size.width)
                      c.stroke(conv_rect)

            result = UIGraphicsGetImageFromCurrentImageContext()!
        }
        UIGraphicsEndImageContext()
      }
          
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try? requestHandler.perform([request])
    
    return result
}
