//
//  API-Funktionen.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 11.07.20.
//

import Foundation
import SwiftUI
import Alamofire

public PublicImage: Image


func SendAndRequest(image:Image)->Image{
    
    return image
}

func SendAndRequest(image:Image){
    
}

func requestSenden(link:String, image:Image)-> Image{
    
    Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(image, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                } //Optional for extra parameters
        }, to:link) { (result) in
        switch result {
            case .success(let upload, _, _):

            upload.uploadProgress(closure: { (progress) in
                print("Upload Progress: \(progress.fractionCompleted)")
            })

            upload.response { (request, response, data, error) in
                return UIImage(data: data, scale:1)
                }
            }

        case .failure(let encodingError):
            print(encodingError)
        }
    }
}
