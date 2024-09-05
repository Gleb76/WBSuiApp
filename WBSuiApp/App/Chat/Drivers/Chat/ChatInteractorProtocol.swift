//
//  WBSuiApp
//
//  Created by Глеб Клыга on 12.06.24.
import Foundation
import Combine
import ExyteChat

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[MockMessage], Never> { get }
    var senders: [MockUser] { get }
    var otherSenders: [MockUser] { get }

    func send(draftMessage: DraftMessage)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}
