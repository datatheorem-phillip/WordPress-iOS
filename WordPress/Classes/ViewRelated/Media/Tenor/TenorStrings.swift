/// Extension on String containing the literals for the Tenor feature
extension String {
    // MARK: - Entry point: alert controller

    static var tenor: String {
        return NSLocalizedString("Tenor", comment: "One of the options when selecting More in the Post Editor's format bar")
    }

    // MARK: - Placeholder

    static var tenorPlaceholderTitle: String {
        return NSLocalizedString("Search to find GIFs to add to your Media Library!", comment: "Title for placeholder in Tenor picker")
    }

    static var tenorPlaceholderSubtitle: String {
        return NSLocalizedString("Powered by Tenor", comment: "Subtitle for placeholder in Tenor picker. `The company name 'Tenor' should always be written as it is.")
    }

    static var tenorSearchNoResult: String {
        return NSLocalizedString("No media matching your search", comment: "Phrase to show when the user searches for GIFs but there are no result to show.")
    }

    static var tenorSearchLoading: String {
        return NSLocalizedString("Loading GIFs...", comment: "Phrase to show when the user has searched for GIFs and they are being loaded.")
    }
}
