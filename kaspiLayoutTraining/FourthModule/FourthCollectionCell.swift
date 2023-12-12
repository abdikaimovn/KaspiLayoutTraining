//
//  FourthCollectionCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 12.12.2023.
//

import UIKit

class FourthCollectionCell: UICollectionViewCell {
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        verticalStack.addArrangedSubview(createSection())
        verticalStack.addArrangedSubview(createSection())
        contentView.addSubview(verticalStack)
        
        verticalStack.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
        }
    }
    
    private func createSection() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        let image = UIImageView()
        image.image = UIImage(named: "0012")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.layer.cornerCurve = .continuous
        
        let title = UILabel()
        title.text = "Рассрочка 0-0-12"
        title.font = UIFont(name: "Helvetica", size: 14)
        
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(15)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(10)
            make.centerY.equalTo(image.snp.centerY)
        }
        
        return view
    }
}
