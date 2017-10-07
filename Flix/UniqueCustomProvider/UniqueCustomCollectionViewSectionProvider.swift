//
//  UniqueCustomCollectionViewSectionProvider.swift
//  Flix
//
//  Created by DianQK on 06/10/2017.
//  Copyright © 2017 DianQK. All rights reserved.
//

import UIKit
import RxSwift

open class UniqueCustomCollectionViewSectionProvider: AnimatableSectionCollectionViewProvider, StringIdentifiableType, Equatable {
    
    open let identity: String
    open let collectionElementKindSection: UICollectionElementKindSection
    
    public typealias Cell = UICollectionReusableView
    public typealias Value = UniqueCustomCollectionViewSectionProvider

    public let isHidden = Variable(false)
    
    open var sectionSize: (() -> CGSize)?
    
    open let contentView = UIView()
    
    public init(identity: String, collectionElementKindSection: UICollectionElementKindSection) {
        self.identity = identity
        self.collectionElementKindSection = collectionElementKindSection
    }
    
    public static func ==(lhs: UniqueCustomCollectionViewSectionProvider, rhs: UniqueCustomCollectionViewSectionProvider) -> Bool {
        return true
    }
    
    open func configureSupplementaryView(_ collectionView: UICollectionView, sectionView: Cell, indexPath: IndexPath, value: Value) {
        sectionView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: sectionView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor).isActive = true
    }
    
    open func genteralSection() -> Observable<Value?> {
        return self.isHidden.asObservable()
            .map { [weak self] isHidden in
                return isHidden ? nil : self
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeInSection section: Int, value: Value) -> CGSize? {
        return sectionSize?()
    }

}
