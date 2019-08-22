import XCTest
import Nimble

@testable import WordPress

class AbstractPostRefreshLocalMediaPathsTests: XCTestCase {
    let currentUUIDs = UUID.extract(from: FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask).first!.absoluteString)
    
    func testUpdateAllLocalMediaPaths() {
        let post = PostBuilder()
            .with(remoteStatus: .failed)
            .with(snippet: "<img src=\"file:///Users/wapuu/Library/Developer/CoreSimulator/Devices/E690FA1D-AE36-4267-905D-8F6E71F4FA31/data/Containers/Data/Application/79D64D5C-6A83-4290-897E-794B7CC78B9F/Library/Caches/Media/thumbnail-p16-1792x1792.jpeg\" class=\"size-full\" data-wp_upload_id=\"x-coredata://58514E00-46E2-4896-AAA1-A80722671857/Media/p16\">")
            .build()
        
        post.refreshLocalMediaPaths()
        
        expect(post.content)
            .to(equal("<img src=\"file:///Users/wapuu/Library/Developer/CoreSimulator/Devices/\(currentUUIDs[0].uuidString)/data/Containers/Data/Application/\(currentUUIDs[1].uuidString)/Library/Caches/Media/thumbnail-p16-1792x1792.jpeg\" class=\"size-full\" data-wp_upload_id=\"x-coredata://58514E00-46E2-4896-AAA1-A80722671857/Media/p16\">"))
    }
    
    func testUpdateAllLocalMediaPathsButDoesNotChangeRemotePaths() {
        let post = PostBuilder()
            .with(remoteStatus: .failed)
            .with(snippet: "<img src=\"file:///Users/wapuu/Library/Developer/CoreSimulator/Devices/E690FA1D-AE36-4267-905D-8F6E71F4FA31/data/Containers/Data/Application/79D64D5C-6A83-4290-897E-794B7CC78B9F/Library/Caches/Media/thumbnail-p16-1792x1792.jpeg\" class=\"size-full\" data-wp_upload_id=\"x-coredata://58514E00-46E2-4896-AAA1-A80722671857/Media/p16\"><p>Lorem ipsum</p><img src=\"https://wordpress.com/\">")
            .build()
        
        post.refreshLocalMediaPaths()
        
        expect(post.content)
            .to(equal("<img src=\"file:///Users/wapuu/Library/Developer/CoreSimulator/Devices/\(currentUUIDs[0].uuidString)/data/Containers/Data/Application/\(currentUUIDs[1].uuidString)/Library/Caches/Media/thumbnail-p16-1792x1792.jpeg\" class=\"size-full\" data-wp_upload_id=\"x-coredata://58514E00-46E2-4896-AAA1-A80722671857/Media/p16\"><p>Lorem ipsum</p><img src=\"https://wordpress.com/\">"))
    }
}

