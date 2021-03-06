//
//  TestView.swift
//  iOSFinal
//
//  Created by CK on 2021/5/12.
//
/*
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseStorageSwift//要有swift的,才有result
import Kingfisher
import FirebaseFirestoreSwift
import Firebase
/*
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
*/

import SwiftUI

struct TestView: View
{
    @State private var goCharacterView = false
    @State private var uiImage: UIImage?
    @State private var changeFace = "face1"
    @State private var changeBody = "body1"
    @State private var changeHair = "hair1"
    @State private var num = 0
    @State private var hairNum = 0
    @State private var bodyNum = 0
    @State private var faceNum = 0
    @State private var hairTotal = 8
    @State private var bodyTotal = 6
    @State private var faceTotal = 11
    @State private var characterName = ""
    @State private var genderSelect = ""
    var gender = ["男", "女"]
    
    @Binding var searchRoomName: String
    
    
    
    func createCharacter() {//創造角色
        let db = Firestore.firestore()
        
        let userData = Character(name: characterName, gender: genderSelect,start: 0 )
        do {
            let documentReference = try db.collection("UserData").addDocument(from: userData)
            do {
                try db.collection("UserData").document(characterName).setData(from: userData)
                
            } catch {
                print(error)
            }
            print(documentReference.documentID)
        } catch {
            print(error)
        }
    }
    
    var demoView: some View {
        ZStack{
            Image(changeBody)
                .resizable()
                .frame(width: 250, height: 300)
                .scaledToFill()
            Image(changeHair)
                .resizable()
                .frame(width: 250, height: 300)
                .scaledToFill()
                
                //.offset(x:0,y:35)
            
            Image(changeFace)
                .resizable()
                .frame(width: 250, height: 300)
                .scaledToFill()
                //.clipShape(Circle())
                //.scaleEffect(0.55)
                //.offset(x:17,y:53)
            
            
        }
    }
    var body: some View {
        VStack{
            HStack{
                Image("角色設定title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("來設定遊戲角色吧!")
                    .font(.largeTitle)
            }
            HStack{
                
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                }
                VStack{
                    HStack {
                        
                        Button(action: {
                            if faceNum > 1{
                                faceNum -= 1
                            }
                            changeFace = "bearFace\(faceNum)"
                            uiImage = demoView.snapshot()
                            //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                        }, label: {
                            Image(systemName: "chevron.backward.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                        })
                        Text("face")
                        Button(action: {
                            
                            if faceNum < faceTotal{
                                faceNum += 1
                                
                            }
                            changeFace = "bearFace\(faceNum)"
                            uiImage = demoView.snapshot()
                            //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                            
                            
                        }, label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                        })
                        
                    }
                    HStack {
                        
                        Button(action: {
                            if bodyNum > 1{
                                bodyNum -= 1
                            }
                            changeBody = "bearBody\(bodyTotal)"
                            uiImage = demoView.snapshot()
                            //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                        }, label: {
                            Image(systemName: "chevron.backward.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                        })
                        Text("body")
                        Button(action: {
                            
                            if bodyNum < bodyTotal{
                                bodyNum += 1
                            }
                            changeBody = "bearBody\(bodyNum)"
                            uiImage = demoView.snapshot()
                            // UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                            
                            
                        }, label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                            
                        })
                        
                    }
                    HStack {
                        
                        Button(action: {
                            if hairNum > 1{
                                hairNum -= 1
                            }
                            changeHair = "bearHair\(hairNum)"
                            uiImage = demoView.snapshot()
                            //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                        }, label: {
                            Image(systemName: "chevron.backward.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                        })
                        Text("hair")
                        Button(action: {
                            
                            if hairNum < hairTotal{
                                hairNum += 1
                                
                            }
                            changeHair = "bearHair\(hairNum)"
                            uiImage = demoView.snapshot()
                            //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                            
                            
                        }, label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.purple)
                        })
                        
                    }
                    Button(action: {
                        changeFace = ["bearFace1","bearFace2","bearFace3","bearFace4","bearFace5","bearFace6"].randomElement()!
                        changeBody = ["bearBody1","bearBody2","bearBody3","bearBody4","bearBody5","bearBody6"].randomElement()!
                        changeHair = ["bearHair1", "bearHair2", "bearHair3", "bearHair4", "bearHair5", "bearHair6", "bearHair7", "bearHair8"].randomElement()!
                        uiImage = demoView.snapshot()
                        //UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                    }, label: {
                        Text("隨機")
                    })
                }
                
                
            }
            HStack{
                Image("角色設定icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 50)
                TextField("請輸入名稱",text:$characterName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
            }
            HStack{
                Image("角色設定icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 50)
                //**tag/SegmentedPickerStyle() tag string
                Picker(selection: $genderSelect, label: Text("性別")) {
                    Text(gender[0]).tag("男")
                    Text(gender[1]).tag("女")
                    
                }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                .shadow(radius: 5)
                //Text("\(genderSelect)")
                
            }
            Spacer()
            Button(action:{//新增角色
                createCharacter()
                uiImage = demoView.snapshot()
                UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                
                uploadPhoto(image: uiImage!) { result in
                    switch result {
                    case .success(let url):
                        setUserPhoto(url: url)
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        
                        changeRequest?.displayName = "\(characterName)"
                        changeRequest?.commitChanges(completion: { error in
                            guard error == nil else {
                                print(error?.localizedDescription)
                                return
                            }
                            goCharacterView = true
                            
                        })
                        //goCharacterView = true
                        print("success")
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            } , label: {
                
                Text("確定")
                    .font(.largeTitle)
            })
            
        }.onAppear(perform:{
            changeFace = "face1"
            changeBody = "body1"
            changeHair = "hair1"
            uiImage = demoView.snapshot()
        }
        )
        .fullScreenCover(isPresented: $goCharacterView, content: {
            CharacterView(roomName: "", searchRoomPassword: "", crearhRoomPassword: "")
        })
        
        
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(searchRoomName: .constant(""))
    }
    
}
 */*/
