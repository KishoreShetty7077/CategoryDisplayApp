//
//  CategoryListViewController + UITableView.swift
//  InterviewTask
//
//  Created by Kishore B on 9/6/24.
//

import UIKit

// MARK: - UITableViewDelegate and UITableViewDataSource
extension CategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredItems.count : (selectedIndex < categories.count ? categories[selectedIndex].items.count : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.itemTableViewCell, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let item = isSearching ? filteredItems[indexPath.row] : categories[selectedIndex].items[indexPath.row]
        cell.configureData(with: item)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.headerSearchTableViewCell) as? HeaderSearchTableViewCell else {
            return UIView()
        }
        
        searchBar = cell.searchBar
        if isSearching {
            searchBar?.becomeFirstResponder()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
}
