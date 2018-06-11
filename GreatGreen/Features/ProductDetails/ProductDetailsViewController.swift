//
//  ProductDetailsViewController.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import Cosmos

class ProductDetailsViewController: BaseViewController {

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var relatedContainer: UIView!
    let collectionCell = "imageCell"
    
    var viewModel: ProductDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        viewModel.getProductDetail(productId: viewModel.product.productId)
    }
    
    private func setupContent() {
        productName.text = viewModel.product.productName
        productPrice.text = viewModel.getPrice()
        productDescription.text = viewModel.product.productText?.htmlToString
        rating.rating = (viewModel.product.reviewInformation?.reviewSummary.reviewAverage ?? 0 ) / 2
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.modalPresentationStyle = .formSheet
        self.view.superview?.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        self.view.bounds = CGRect(x: 0, y: -30, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    @IBAction func closeClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Product Delegate
extension ProductDetailsViewController: ProductDetailsDelegate {
    @objc func reloadCollection() {
        setupContent()
        imageCollection.reloadData()
    }
}

// MARK: - CollectionView
extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.product.productImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as? ImageCollectionViewCell {
            cell.setup(imageUrl: viewModel.product.productImages?[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
