//
//  1 & 2 - Connect to API.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 16.07.20.
//

import Foundation
import SwiftUI
import Alamofire

let link = "http://192.168.178.34:5000"

/// ping to Server
/// - Input: /
/// - Returns: String mit der Antwort
func hi() -> Bool{
    print("👀...............Ist der Server da????")
    let sem = DispatchSemaphore.init(value: 0)
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
        exit(5)
        sem.signal()
      } else {
        let httpResponse = response as? HTTPURLResponse
        passt = true
        //print(httpResponse)
        sem.signal()
      }
    })

    dataTask.resume()
    sem.wait()
    print("✅...............Server ist da")
    return passt
}

/* Name:            get Boxes
 * Beschreibung:    Sendet ein Bild und erhält einen String mit der Antwort der AI
 * Input:           Image
 * Output:          JSON mit den Boxen und Labeln
*/

func getBoxes(Image: UIImage) -> Data{
    print("👀...............Sende Bild an KI")
    var antwort: Data? = nil
    let sem = DispatchSemaphore.init(value: 0)
    
    let zusatz = "/getBoxes"
    var Data = Image.pngData()!
    
    let image = UIImage.init(named: "myImage")

    //Parameter HERE
    let parameters = [
        "id": "429",
        "docsFor" : "visitplan"
    ]
    //Header HERE
    let headers:HTTPHeaders = [
        "Content-type": "multipart/form-data",
        "Content-Disposition" : "form-data"
    ]
    
    let imgData = Image.jpegData(compressionQuality: 0.7)!
    let url = (link+zusatz)
    
    AF.upload( multipartFormData: { multipartFormData in
            //Parameter for Upload files
            multipartFormData.append(imgData, withName: "file",fileName: "test.png" , mimeType: "image/png")
            
            for (key, value) in parameters
            {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, usingThreshold:UInt64.init(), method: .post, headers: headers)
        .responseJSON { response in
            antwort = response.data!
            sem.signal()
        }
    sem.wait()
    return antwort!
}

/* Name:            get painted
 * Beschreibung:    Sendet ein Bild und erhält ein Bild mit eingezeichneten Boxen
 * Input:           Image
 * Output:          Image
*/

func getPainted(Image: UIImage) -> UIImage{
    print("👀...............Sende Bild an KI")
    let sem = DispatchSemaphore.init(value: 0)
    var antwort: UIImage? = UIImage()
    
    let zusatz = "/getPainted/"

    //Parameter HERE
    let parameters = [
        "id": "429",
        "docsFor" : "visitplan"
    ]
    //Header HERE
    let headers:HTTPHeaders = [
        "Content-type": "multipart/form-data",
        "Content-Disposition" : "form-data"
    ]
    
    let imgData = Image.jpegData(compressionQuality: 0.7)!
    let url = (link+zusatz)
    
    AF.upload( multipartFormData: { multipartFormData in
            //Parameter for Upload files
            multipartFormData.append(imgData, withName: "file",fileName: "test.png" , mimeType: "image/png")
            
            for (key, value) in parameters
            {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, usingThreshold:UInt64.init(), method: .post, headers: headers)
        .responseJSON { response in
            antwort = UIImage(data: response.data! as Data)
            sem.signal()
        }
    
    sem.wait()
    print("✅...............fertiges Bild erhalten")
    return antwort!
}


/* Name:            getTable
 * Beschreibung:    Sendet ein Bild und erhält ein Bild der Tabelle
 * Input:           Image
 * Output:          Image
*/

func getTable(Image: UIImage) -> UIImage{
    print("👀...............Sende Bild an KI")
    let sem2 = DispatchSemaphore.init(value: 0)
    var antwort: UIImage? = UIImage()
    
    let zusatz = "/getTable/"

    //Parameter HERE
    let parameters = [
        "Warum?" : "TestApp"
    ]
    //Header HERE
    let headers:HTTPHeaders = [
        "Content-type": "multipart/form-data",
        "Content-Disposition" : "form-data"
    ]
    
    let imgData = Image.pngData()!
    let url = (link+zusatz)
    
    AF.upload( multipartFormData: { multipartFormData in
            //Parameter for Upload files
            multipartFormData.append(imgData, withName: "file",fileName: "test.png" , mimeType: "image/png")
            
            for (key, value) in parameters
            {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, usingThreshold:UInt64.init(), method: .post, headers: headers)
        .responseJSON { response in
            let tempData = response.data!
            antwort = UIImage(data: tempData)
            sem2.signal()
        }
    
    sem2.wait()
    print("✅...............Tabelle erhalten")
    return antwort!
}
