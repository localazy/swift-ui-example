
final class ContentViewModel: ObservableObject {
    @Published var didLoadLocalizedStrings: Bool = false
    init() {
        NotificationCenter.default.publisher(for: .localazyStringsLoaded)
            .map { _ in true }
            .assign(to: &$didLoadLocalizedStrings)
    }
}
