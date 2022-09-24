//
//  ContentView.swift
//  4ureyesonly
//
//  Created by Qiwei on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
            
            VStack{
                Image("chicken2")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Button("Choose Picture"){
                    self.showSheet = true
                }.padding() //action sheet is the bottoom button controls that come up
                    .actionSheet(isPresented: $showSheet){
                        
                    ActionSheet(title: Text("Select Photo"),
                    message: Text("Choose from"),
                    buttons:[
                        .default(Text("Photo Library")){
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")){
                            self.showImagePicker = true
                            self.sourceType = .camera
                             },
                             .cancel()
                    ])
                    }
                
            }
            
            .navigationBarTitle("4ureyesonly")
            
        }.sheet(isPresented: $showImagePicker){
            Text("MODAL")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
