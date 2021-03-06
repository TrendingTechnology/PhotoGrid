//
//  PhotoGridTests.swift
//  PhotoGridTests
//
//  Created by Lucas Silveira on 01/03/21.
//

import XCTest
import Photos
@testable import PhotoGrid

class PhotoStoreTests: XCTestCase {
    
    var photoStore: PhotoStore!
    var photoLibraryService: PhotoLibraryService!
    
    override func setUp() {
        photoLibraryService = PhotoLibraryService()
        photoStore = PhotoStore(photoLibraryService: photoLibraryService)
        photoLibraryService.delegate = photoStore
    }

    func testMakePhoto() {
        let asset = PHAsset()
        let image = UIImage(imageLiteralResourceName: "1")
        
        let photo = Photo(id: UUID().description, image: image)
        let generatedPhoto = photoStore.makePhoto(identifier: asset.localIdentifier, image: image)
        
        XCTAssertEqual(photo.image, generatedPhoto.image)
    }
    
    func testSaveImageToUserDefaults() {
        let identifier = "91B1C271-C617-49CE-A074-E391BA7F843F/L0/001"
        
        photoStore.saveImageIdentifierToUserDefaults(identifier: identifier)
        XCTAssertEqual(photoStore.localImageIdentifiers.first, identifier)
    }
    
    func testSaveImageToLibrary() {
        // TODO
    }
    
    func testDeletingImageFromLibrary() {
        // TODO
    }
}
