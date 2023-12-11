//
//  FirstTableViewCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 08.12.2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 130)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        var cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.dataSource = self
        cView.register(FirstCollectionCell.self, forCellWithReuseIdentifier: "FirstCollectionCell")
        cView.showsHorizontalScrollIndicator = false
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
        self.selectionStyle = .none
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
    }
}

extension FirstTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionCell", for: indexPath) as! FirstCollectionCell
        return cell
    }
    
    
}
