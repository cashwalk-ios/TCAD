import SwiftUI

public struct PersonGridView: View {
    let entity: HumanResultEntity
    var action: () -> Void

    public init(
        entity: HumanResultEntity,
        action: @escaping () -> Void = {}
    ) {
        self.entity = entity
        self.action = action
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Button(action: action) {
                if #available(iOS 15.0, *) {
                    CachedAsyncImage(
                        url: entity.picture,
                        urlCache: .imageCache,
                        content: { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                        },
                        placeholder: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundColor(.clear)
                                .scaledToFit()
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                        }
                    )
                } else {
                    // Fallback on earlier versions
                }
            }
            VStack(alignment: .leading) {
                Text(entity.name)
                    .font(.system(size: 22, weight: .bold, design: .serif))

                Text(entity.location)
                    .font(.system(size: 18, weight: .medium, design: .default))

                Text(entity.cell)
                    .font(.system(size: 14, weight: .regular, design: .default))

            }
        }
    }
}
