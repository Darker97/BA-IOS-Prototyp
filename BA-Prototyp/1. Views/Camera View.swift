//
//  Camera View.swift
//  BA-Prototyp
//
//  Created by Christian Baltzer on 10.07.20.
//

import UIKit
import SwiftUI

struct PhotoCaptureView: View {
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var working: UIImage
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, working: $working)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")), working: .constant(UIImage()))
    }
}
#endif
