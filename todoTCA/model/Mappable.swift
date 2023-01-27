import Foundation

protocol Mappable {
    associatedtype T = IEntity
    func convertedToEntity() -> T?
}

protocol IEntity: Equatable, Identifiable {}
