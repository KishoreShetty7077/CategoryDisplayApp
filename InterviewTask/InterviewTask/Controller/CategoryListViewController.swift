//
//  CategoryListViewController.swift
//  Task
//
//  Created by Kishore B on 3/9/24.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var categories: [CategoryDetailsModel] = []
    var selectedIndex = 0
    var searchBar: UISearchBar?
    var filteredItems: [CategoryItemDetailsModel] = []
    var isSearching = false
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        let index = sender.currentPage
        let rect = CGRect(x: CGFloat(index) * categoriesCollectionView.frame.width, y: 0, width: categoriesCollectionView.frame.width, height: categoriesCollectionView.frame.height)
        categoriesCollectionView.scrollRectToVisible(rect, animated: true)
    }
    
    // MARK: - Data Fetching
    private func fetchData() {
        Task {
            do {
                categories = try await fetchCategoriesFromFile()
                updateUI()
            } catch {
                print("Error fetching categories: \(error)")
            }
        }
    }
    
    // MARK: - UI Update
    private func updateUI() {
        DispatchQueue.main.async {
            self.pageControl.numberOfPages = self.categories.count
            self.pageControl.currentPage = 0
            self.categoriesTableView.reloadData()
            self.categoriesCollectionView.reloadData()
        }
    }
    
    // MARK: - Async Fetch Categories
    private func fetchCategoriesFromFile() async throws -> [CategoryDetailsModel] {
        guard let url = Bundle.main.url(forResource: "Categories", withExtension: "json") else {
            throw NSError(domain: "Invalid file path", code: 404, userInfo: nil)
        }
        
        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(CategoriesListModel.self, from: data)
        return decodedData.categories
    }
}
