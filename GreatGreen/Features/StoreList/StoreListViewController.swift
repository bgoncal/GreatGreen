//
//  ViewController.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class StoreListViewController: BaseViewController {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: StoreListViewModel!
    let customFlowLayout = CustomFlowLayout()
    let initialColumnNumber: Float = 2.0
    let detailsScreenId = "details"
    let collectionCell = "cell"
    var searching = false
    let productService = ProductService(api: ApiService(),
                                        decoder: JSONDecoder(), parser: ParseService(decoder: JSONDecoder()),
                                        productListObj: General.productListMock, productDetailsObj: General.productDetailsMock)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StoreListViewModel(productService: productService,
                                       products: [ProductList.Product](),
                                       delegate: self)
        viewModel.getProductsPaginated()
        setupCollection(numberOfColumns: initialColumnNumber)
    }
    
    func setupCollection(numberOfColumns: Float) {
        customFlowLayout.setup(numberOfColumns: numberOfColumns)
        productsCollection.collectionViewLayout = customFlowLayout
    }
    
    @IBAction func refresh(_ sender: Any) {
        viewModel.getProductsPaginated()
    }
}

// MARK: - Store Delegate
extension StoreListViewController: StoreListDelegate {
    @objc func reloadCollection() {
        productsCollection.reloadData()
    }
}

// MARK: - Search Bar
extension StoreListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let query = searchBar.text {
            viewModel.filterProducts(query: query)
        }
    }
}

// MARK: - Collection View
extension StoreListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell,
                                                         for: indexPath) as? StoreListCollectionViewCell {
            cell.setup(product: viewModel.filteredProducts[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == viewModel.filteredProducts.count, let searchText = searchBar.text, searchText.isEmpty {
            viewModel.getProductsPaginated()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let details = storyboard?.instantiateViewController(withIdentifier: detailsScreenId) as? ProductDetailsViewController {
            details.viewModel = ProductDetailsViewModel(product: viewModel.filteredProducts[indexPath.row],
                                                        productService: productService, delegate: details)
            navigationController?.present(details, animated: true)
        }
    }
}
