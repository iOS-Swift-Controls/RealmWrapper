import RealmSwift
import RealmWrapper

final class UserRealmManager: RealmManageable {
    
    static var shared: UserRealmManager = UserRealmManager()
    
    var isUseInMemory: Bool {
        return false
    }
    var schemaVersion: UInt64 {
        return 1
    }
    var fileName: String {
        return "user"
    }
    var objectTypes: [Object.Type]? {
        return [User.self]
    }
    
}
