//
//  CategoryListViewController + UISearchBar.swift
//  InterviewTask
//
//  Created by Kishore B on 9/6/24.
//

import UIKit

// MARK: - UISearchBarDelegate
extension CategoryListViewController: UISearchBarDelegate {

    // MARK: - UISearchBar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = !searchText.isEmpty
        filteredItems = isSearching ? categories[selectedIndex].items.filter { $0.itemName.lowercased().contains(searchText.lowercased()) } : []
        categoriesTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearch()
    }

    // MARK: - Helper Methods
    private func resetSearch() {
        isSearching = false
        filteredItems.removeAll()
        searchBar?.text = ""
        categoriesTableView.reloadData()
        view.endEditing(true)
    }
}
