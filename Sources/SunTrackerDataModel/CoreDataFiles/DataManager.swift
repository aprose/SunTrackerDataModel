//
//  DataManager.swift
//  WatchTheSun WatchKit Extension
//
//  Created by user178036 on 26.12.20.
//

import Foundation
import CoreData

public class CoreDataManager: ObservableObject {
    
    static var cloudKitDataModel = "SunTimeDataModel"
    public static var shared = CoreDataManager()
    
    private init() {
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    public var context: NSManagedObjectContext {  // (1)
        get {
            return self.persistentContainer.viewContext
        }
    }
    
    var persistentContainer: NSPersistentContainer = { // (2)
        
        
        let bundle = Bundle.module
        let modelURL = bundle.url(forResource: CoreDataManager.cloudKitDataModel, withExtension: ".momd")!
        let model = NSManagedObjectModel(contentsOf: modelURL)!
        
        // let container = NSPersistentContainer(name: "SunTimeDataModel")
    
        // Use CloudKit for Testing
        let container = NSPersistentCloudKitContainer(name: CoreDataManager.cloudKitDataModel, managedObjectModel: model)

        
        container.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                print("SetUp Core Data with Cloudkit Error: \(error?.localizedDescription as Any) ")
                return
            }
            print("Store is here: \(String(describing: storeDescription.url))")
        }
        return container
    }()
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

extension NSManagedObjectContext {

    /// Only performs a save if there are changes to commit.
    /// - Returns: `true` if a save was needed. Otherwise, `false`.
    @discardableResult public func saveIfNeeded() throws -> Bool {
        guard hasChanges else { return false }
        try save()
        return true
    }
}


public extension UVInformation {
    
    public static func insert(in context: NSManagedObjectContext, currentUVatDateTime: Date?, currentUV: Double, maxUVatDateTime: Date?, maxUV: Double, skinOne: Int32, skinTwo: Int32, skinThree: Int32, skinFour: Int32, skinFive: Int32, skinSix: Int32, lat: Double, long: Double) {
        
        let UVInfoReceived = UVInformation(context: context)
        UVInfoReceived.currentUVatDateTime = currentUVatDateTime
        UVInfoReceived.currentUV = currentUV
        UVInfoReceived.maxUVatDateTime = maxUVatDateTime
        UVInfoReceived.maxUV = maxUV
        UVInfoReceived.maxTimeSkinTypeOne = skinOne
        UVInfoReceived.maxTimeSkinTypeTwo = skinTwo
        UVInfoReceived.maxTimeSkinTypeThree = skinThree
        UVInfoReceived.maxTimeSkinTypeFour = skinFour
        UVInfoReceived.maxTimeSkinTypeFive = skinFive
        UVInfoReceived.maxTimeSkinTypeSix = skinSix
        UVInfoReceived.latitude = lat
        UVInfoReceived.longitude = long
        
        context.perform {
            let result = try? context.saveIfNeeded()
            print("Core Data saved result \(String(describing: result))")
        }
        
    }
    
    
    
}




//final class ModelData: ObservableObject {
//
//    @Published var myExposures: [temp] = [temp]()
//
//    init() {
//
//        myExposures = load("landmarkData.json")
//    }
//
//    func loadFromNetwork() -> Void {
//        // To Load Data from Network
//    }
//
//    func load<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//            else {
//                fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//
//
//
//}

 



