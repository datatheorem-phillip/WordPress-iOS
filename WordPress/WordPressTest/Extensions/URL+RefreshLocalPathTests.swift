import XCTest
import Nimble

@testable import WordPress

class URLRefreshLocalPathTests: XCTestCase {
    
    var localUser: String = {
        let splitedApplicationDirectory = FileManager.default.urls(for: .applicationDirectory, in: .allDomainsMask).first!.absoluteString.split(separator: "/")
        return String(splitedApplicationDirectory[2])
    }()
    
    let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask).first!
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
    
    func testCorrectlyRefreshUUIDForCachedAssets() {
        let oldUrl = URL(string: "file:///Users/\(localUser)/Library/Developer/CoreSimulator/Devices/E690FA1D-AE36-4267-905D-8F6E71F4FA31/data/Containers/Data/Application/79D64D5C-6A83-4290-897E-794B7CC78B9F/Library/Caches/Media/thumbnail-p16-1792x1792.jpeg")
        
        let refreshedUrl = oldUrl?.refreshLocalPath()
        
        expect(refreshedUrl?.absoluteString)
            .to(equal(cacheDirectory.appendingPathComponent("Media/thumbnail-p16-1792x1792.jpeg").absoluteString))
    }
    
    func testCorrectlyRefreshUUIDForAssetsInDocumentsFolder() {
        let oldUrl = URL(string: "file:///Users/\(localUser)/Library/Developer/CoreSimulator/Devices/E690FA1D-AE36-4267-905D-8F6E71F4FA31/data/Containers/Data/Application/79D64D5C-6A83-4290-897E-794B7CC78B9F/Documents/Media/thumbnail-p16-1792x1792.jpeg")
        
        let refreshedUrl = oldUrl?.refreshLocalPath()
        
        expect(refreshedUrl?.absoluteString)
            .to(equal(documentDirectory.appendingPathComponent("Media/thumbnail-p16-1792x1792.jpeg").absoluteString))
    }
    
    func testDoesntChangeRemoteURLs() {
        let url = URL(string: "https://wordpress.com/")
        
        let refreshedUrl = url?.refreshLocalPath()
        
        expect(refreshedUrl).to(equal(url))
    }
}
