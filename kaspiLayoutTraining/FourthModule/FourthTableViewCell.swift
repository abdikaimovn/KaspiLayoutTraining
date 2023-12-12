//
//  FourthTableViewCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 12.12.2023.
//

import UIKit
import SnapKit

class FourthTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.dataSource = self
        cView.showsHorizontalScrollIndicator = false
        cView.backgroundColor = .clear
        cView.register(FourthCollectionCell.self, forCellWithReuseIdentifier: "FourthCollectionCell")
        return cView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
            $0.height.equalTo(130)
        }
    }
}

extension FourthTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthCollectionCell", for: indexPath) as! FourthCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
}
