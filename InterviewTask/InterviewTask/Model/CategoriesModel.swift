
import Foundation

// MARK: - Category Item Details Model
struct CategoryItemDetailsModel: Codable {
    let id: Int
    let imageName: String
    let itemName: String
}

// MARK: - Category Details Model
struct CategoryDetailsModel: Codable {
    let categoryName: String
    let categoryImage: String
    let items: [CategoryItemDetailsModel]
}

// MARK: - Categories List Model
struct CategoriesListModel: Codable {
    let categories: [CategoryDetailsModel]
}
