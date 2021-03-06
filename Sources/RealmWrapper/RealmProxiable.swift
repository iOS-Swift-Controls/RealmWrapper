import RealmSwift

public protocol RealmProxiable {
    associatedtype RealmManager where RealmManager: RealmManageable
    var rm: RealmManager { get }
}

public extension RealmProxiable {
    
    var rm: RealmManager {
        return RealmManager()
    }
    
    func query<T: Object>(_ type: T.Type = T.self, filter: String? = nil, sortProperty: String? = nil, ordering: OrderingType = .ascending) -> RealmQuery<T> {
        guard let realm = try? Realm(configuration: rm.createConfiguration()) else {
            fatalError("RealmProxiable not find to database")
        }
        var results = realm.objects(type)
        if let filter = filter {
            results = results.filter(filter)
        }
        if let sortProperty = sortProperty {
            results = results.sorted(byKeyPath: sortProperty, ascending: ordering == .ascending)
        }
        
        return RealmQuery(results: results)
    }
    
}
