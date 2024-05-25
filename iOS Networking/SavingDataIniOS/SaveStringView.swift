//
//  SaveStringView.swift
//  iOS Networking
//
//  Created by Khan on 25.05.2024.
//

import SwiftUI

struct SaveStringView: View {
    @State private var inputText: String = ""
    @State private var message: String = ""
    @State private var loadedText: String = ""
    var body: some View {
       
        VStack {
            
            TextField("Enter Text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            Button(action: {
                saveText()
            }, label: {
                Text("Save Text")
            })
            
            Button(action: {
                loadText()
            }, label: {
                Text("Load")
            })
            
            Text(message)
            Text(loadedText)
        }
    }
    
    func loadText() {
        
        guard let directory = getDocumentDirctory() else {
            loadedText = "Faile to Find directory"
            return
        }
        
        let fileURL = directory.appendingPathComponent("example.txt")
        
        
        do {
            loadedText = try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch {
            loadedText = "Failed to load text \(error.localizedDescription)"
        }
    }
    
    func saveText() {
      
        guard let directory = getDocumentDirctory() else {
            message = "Failed to find directory"
            return
        }
        
        let fileURL = directory.appendingPathComponent("example.txt")
        
        do {
            try inputText.write(to: fileURL, atomically: true, encoding: .utf8)
            message = "Text saved Successfully!"
        } catch {
            message = "Failed to save text \(error.localizedDescription)"
        }
    }
    
    func getDocumentDirctory() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths.first
    }
}

#Preview {
    SaveStringView()
}
