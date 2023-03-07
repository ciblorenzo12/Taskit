//
//  SwiftUIView.swift
//  Taskit
//
//  Created by Caleb Barranco on 12/15/22.
//

import SwiftUI
import Firebase

struct SwiftUIView <DragGesture : Gesture> : View  {
    @State var namesSend = ""
    @State var namesArr : [String] = []
    let gesture_ : DragGesture
        var body:some View {
            
            VStack{
               
                Button("Caleb \n Manager") {
                    
                }
              
                .frame(width: 200, height: 50).foregroundColor(Color.black).background(Color.blue).blendMode(/*@START_MENU_TOKEN@*/.normal/*@END_MENU_TOKEN@*/).cornerRadius(50).position(x: 200,y: 40).gesture(gesture_
                )
                
                
               
                
            }
                      
        }
        
        
        
        func Send(){
            
            let datab = Firestore.firestore()
            datab.collection("Names").document().setData(["Names":namesSend])
            
        }
        func Retrieve(){
            
            let datab = Firestore.firestore()
            datab.collection("Names").addSnapshotListener{(snap,err) in
                 
                if err != nil{
                    
                    print("Opps")
                    return
                }
                for i in snap!.documentChanges{
                    _ = i.document.documentID
                    _ = i.document.get("names")
                    DispatchQueue.main.async {
                        namesArr.append(namesSend)
                    }
                }
                
                
            }
            
        }
  
        
        
        
    }
    
    


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(gesture_:DragGesture())
    }
    
    
}


