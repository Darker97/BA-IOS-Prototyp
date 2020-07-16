//
//  1 & 2 - Connect to API.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 16.07.20.
//

import Foundation
import SwiftUI

let link = ""

/// ping to Server
/// - Input: /
/// - Returns: String mit der Antwort
func hi() -> Bool{
    var passt = false
    
    let zusatz = "/hi"
    let url = URL(string: link + zusatz)!

    let postData = NSData(data: "".data(using: String.Encoding.utf8)!)

    let request = NSMutableURLRequest(url: NSURL(string: link + zusatz)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.httpBody = postData as Data

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error)
      } else {
        let httpResponse = response as? HTTPURLResponse
        passt = true
        print(httpResponse)
      }
    })

    dataTask.resume()
    return passt
}

/* Name:            get Boxes
 * Beschreibung:    Sendet ein Bild und erhält einen String mit der Antwort der AI
 * Input:           Image
 * Output:          JSON mit den Boxen und Labeln
*/

func getBoxes(Image: UIImage) -> UIImage{
    var antwort: UIImage? = nil
    
    let zusatz = "/getBoxes"

    let request = NSMutableURLRequest(url: NSURL(string: link + zusatz)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
    
    var Data = Image.pngData()

    let task = URLSession.shared.uploadTask(with: request as URLRequest, from: Data) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }
        antwort = UIImage(data: data!)
    }
    task.resume()
    return antwort!
}

/* Name:            get painted
 * Beschreibung:    Sendet ein Bild und erhält ein Bild mit eingezeichneten Boxen
 * Input:           Image
 * Output:          Image
*/

func getPainted(Image: UIImage) -> UIImage{
    var antwort: UIImage? = nil
    
    let zusatz = "/getPainted"

    let request = NSMutableURLRequest(url: NSURL(string: link + zusatz)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
    
    var Data = Image.pngData()

    let task = URLSession.shared.uploadTask(with: request as URLRequest, from: Data) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }
        antwort = UIImage(data: data!)
    }
    task.resume()
    return antwort!
}


/* Name:            getTable
 * Beschreibung:    Sendet ein Bild und erhält ein Bild der Tabelle
 * Input:           Image
 * Output:          Image
*/

func getTable(Image: UIImage) -> UIImage{
    var antwort: UIImage? = nil
    let zusatz = "/getTable"

    let request = NSMutableURLRequest(url: NSURL(string: link + zusatz)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
    
    var Data = Image.pngData()

    let task = URLSession.shared.uploadTask(with: request as URLRequest, from: Data) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }
        antwort = UIImage(data: data!)
    }
    task.resume()
    return antwort!
}
