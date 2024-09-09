# CategoryDisplayApp

A Swift-based iOS application that showcases categories and items in a user-friendly interface. This project demonstrates the use of UITableView, UICollectionView, UISearchBar, and Swift Concurrency for data handling and UI updates. The app fetches data from a local JSON file and displays it in both a table view and a collection view.

Features
1.Category Display: Shows a list of categories with images in a collection view.
2.Item Details: Displays items belonging to a selected category in a table view.
3.Search Functionality: Allows users to search through items by name.
4.Pagination: Uses UIPageControl for navigating between different categories.

Architecture
1.Models: Defines data structures for categories and items.
2.UI Components: Utilizes UICollectionView and UITableView to present data.
3.Data Handling: Fetches and decodes JSON data asynchronously.

Technologies Used
1.Swift
2.UIKit
3.Swift Concurrency (async/await)
4.URLSession for network requests
5.UICollectionView and UITableView for UI
6.UISearchBar for search functionality
