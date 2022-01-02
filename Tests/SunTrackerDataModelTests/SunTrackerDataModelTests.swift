import XCTest
@testable import SunTrackerDataModel

final class SunTrackerDataModelTests: XCTestCase {
    
    func testCoreDataCloudKitDataModelName() throws {
        
        XCTAssertEqual(CoreDataManager.cloudKitDataModel, "SunTimeDataModel")
    }
    
    func testCoreDataModel() {
        
        // Future Tests to Write
        
       //  XCTAssertNotNil()
    }
}
