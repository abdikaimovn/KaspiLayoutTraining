//
//  FirstCollectionCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 08.12.2023.
//

import UIKit

class FirstCollectionCell: UICollectionViewCell {
    private var itemImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "first")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.layer.cornerCurve = .continuous
        return image
    }()
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = .gray
        label.text = "4 декабря - 31 декабря"
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(itemImage)
        itemImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(10)
            make.height.equalTo(90)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(itemImage.snp.left)
            make.top.equalTo(itemImage.snp.bottom).offset(10)
        }
    }
}
