//
//  TableViewCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 11.12.2023.
//

import UIKit
import SnapKit

class ThirdTableViewCell: UITableViewCell {
    private let headerLine: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(hex: "#f1f1f1")
        return view
    }()
    
    private let footerLine: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(hex: "#f1f1f1")
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "magnum")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Magnum"
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Продукты питания с бесплатной доставкой"
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    
    private let arrowRightImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.right")
        img.contentMode = .scaleAspectFit
        img.tintColor = .black
        return img
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
        contentView.addSubview(headerLine)
        headerLine.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(1)
        }
        
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(15)
            make.size.equalTo(40)
        }
        
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(verticalStack)
        verticalStack.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(10)
            make.top.equalTo(logoImageView.snp.top)
            make.bottom.equalTo(logoImageView.snp.bottom)
        }
        
        contentView.addSubview(arrowRightImage)
        arrowRightImage.snp.makeConstraints { make in
            make.left.equalTo(verticalStack.snp.right).offset(10)
            make.right.equalToSuperview().inset(15)
            make.centerY.equalTo(verticalStack.snp.centerY)
        }
        
        contentView.addSubview(footerLine)
        footerLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

}
