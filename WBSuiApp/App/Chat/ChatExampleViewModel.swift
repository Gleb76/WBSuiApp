//
//  WBSuiApp
//
//  Created by Глеб Клыга on 12.06.24.
//


import Foundation
import ExyteChat
import UIKit
import ExyteMediaPicker
import Combine

final class ChatExampleViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isOp: Bool
    
    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    init(isOp: Bool, interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
        self.isOp = isOp
    }
    
    func send(draft: DraftMessage) {
        interactor.send(draftMessage: draft)
    }
    
    func sendToUser() {
        isOp = true
    }
    
    func receiveFromUser() {
        isOp = false
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)
        
        interactor.connect()
    }
    
    func onStop() {
        interactor.disconnect()
    }
    
    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
    
    func shortName(_ name: String) -> String {
        var newName = ""
        for symbol in name {
            if String(symbol) == " " {
                newName += String(symbol)
                newName += String(name[name.index(after: name.firstIndex(of: symbol)!)])
                newName += "."
                break
            } else {
                newName += String(symbol)
            }
        }
        return newName
    }
}

