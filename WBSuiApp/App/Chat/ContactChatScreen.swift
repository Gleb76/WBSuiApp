//
//  ContactChatScreen.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 12.06.24.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker

struct ContactChatScreen: View {
    @EnvironmentObject var viewModel: ChatExampleViewModel
    let contact: MockUser
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("fontColor"))
                        Text(viewModel.shortName(contact.name))
                            .foregroundColor(Color("fontColor"))
                    }
                }
                Spacer()
                Button(action: { }) {
                    Image("searchChat")
                        .foregroundColor(.black)
                }
                Button(action: { }) {
                    Image("options")
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            ChatView(messages: viewModel.messages, didSendMessage: { message in
                            viewModel.send(draft: message)
                        })
                           .mediaPickerTheme(
                               main: .init(
                                   text: .white,
                                   albumSelectionBackground: .green,
                                   fullscreenPhotoBackground: .green
                               ),
                               selection: .init(
                                   emptyTint: .white,
                                   emptyBackground: .black.opacity(0.25),
                                   selectedTint: .green,
                                   fullscreenTint: .white
                               )
                           )
                           .chatTheme(ChatTheme(
                               colors: .init(
                                   grayStatus: .gray,
                                   errorStatus: .red,
                                   inputLightContextBackground: Color("profileDetails"),
                                   mainBackground: Color("profileDetails"),
                                   addButtonBackground: Color("avatarColor"),
                                   sendButtonBackground: Color("avatarColor"),
                                   myMessage: Color("avatarColor"),
                                   friendMessage: Color("backgroundColor"),
                                   textLightContext: Color("fontColor"),
                                   textMediaPicker: .white,
                                   recordDot: .red
                               ),
                               images: .init(
                                
                               )
                           ))
                           .environmentObject(viewModel)
                           .onAppear(perform: viewModel.onStart)
                           .onDisappear(perform: viewModel.onStop)
                       
                   }
                   .background(Color("backgroundColor"))
                   .navigationBarBackButtonHidden(true)
               }
           }


struct ContactChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatExampleViewModel(isOp: true)
        ContactChatScreen(contact: MockUser(uid: "Nastya", name: "Анастасия Иванова", avatar: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LUaiVVLEjwv843DzzydwzrdNf-UA8vuFusn83sNlnt3yShNOs5PtE1tsxv1YteD9RTrkLoDr5PCLle7KXxEEAnMa3rRfkW6BpF2qlN51UN395U74sWBDwCzkZx-JDWfKNNlWVYPQCAROecDXuAMzidCwaPkVOuMQiyP2RrwQanIRKLngpxH3DLTkd~TCgiMphmV4RoijrPkqrOZIJtQIb-mx842kjy1exnF7UxCiWPTdNGxqtY5rF5tqwW9CC93DS38dJN3A1Mvvda4E~oCqvy~dPrWhJiD2kLnfVd5rcSv2YBRXt5vV0SEnUn0-5vtnNuwxysqjSqyvB4uLOsLtjQ__")))
            .environmentObject(viewModel)
    }
}
