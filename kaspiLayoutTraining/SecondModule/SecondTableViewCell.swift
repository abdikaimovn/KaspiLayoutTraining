//
//  SecondTableViewCell.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 08.12.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    private let lineView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(hex: "#f1f1f1")
        return view
    }()
    
    private let horizontalStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let secondHorizontalStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let verticalStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        return stack
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
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(160)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(10)
        }
        
        horizontalStack.addArrangedSubview(createModuleView())
        horizontalStack.addArrangedSubview(createModuleView())
        horizontalStack.addArrangedSubview(createModuleView())
        horizontalStack.addArrangedSubview(createModuleView())
        
        secondHorizontalStack.addArrangedSubview(createModuleView())
        secondHorizontalStack.addArrangedSubview(createModuleView())
        secondHorizontalStack.addArrangedSubview(createModuleView())
        secondHorizontalStack.addArrangedSubview(createModuleView())

        
        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(secondHorizontalStack)
        verticalStack.distribution = .fillEqually
        
        contentView.addSubview(verticalStack)
        verticalStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(lineView.snp.bottom).offset(5)
        }
    }
    
    private func createModuleView() -> UIView{
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.snp.makeConstraints { make in
            make.size.equalTo(70)
        }
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "qr")
        imageView.backgroundColor = .clear
        
        let title = UILabel()
        title.text = "Kaspi QR"
        title.textAlignment = .center
        title.textColor = .black
        title.font = UIFont(name: "Helvetica", size: 12)
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(35)
        }
        
        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        return view
    }
}
