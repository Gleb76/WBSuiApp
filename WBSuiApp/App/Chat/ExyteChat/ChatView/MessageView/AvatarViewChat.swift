//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI

struct AvatarViewChat: View {

    let url: URL?
    let avatarSize: CGFloat

    var body: some View {
        CachedAsyncImage(url: url, urlCache: .imageCache) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle().fill(Color.gray)
        }
        .viewSize(avatarSize)
        .clipShape(Circle())
    }
}

struct AvatarViewChat_Previews: PreviewProvider {
    static var previews: some View {
        AvatarViewChat(
            url: URL(string: "https://placeimg.com/640/480/sepia"),
            avatarSize: 32
        )
    }
}
