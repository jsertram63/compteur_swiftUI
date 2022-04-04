//
//  ContentView2.swift
//  compteur_swiftUI
//
//  Created by Lunack on 04/04/2022.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

/*
extension View {
    func alertTF(title:String,message:String, hintText: String, primaryTitle:String,
                 secondaryTitle:String, primaryAction: @escaping(String) -> (),
                 secondaryAction:@escaping() ->()){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .cancel, handler: { _ in
            if let text = alert.textFields?[0].text{
                primaryAction(text)
                
            }else {
                primaryAction("")
            }
        }))
        
        rootController().present(alert, animated: true, completion: nil)
        
    }
    
    func rootController() -> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
}
*/
