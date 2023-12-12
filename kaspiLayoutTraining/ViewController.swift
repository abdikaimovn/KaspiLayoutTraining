//
//  ViewController.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 08.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor(hex: "#f1f1f1")
        field.placeholder = " Поиск по Kaspi.kz"
        field.layer.cornerRadius = 10
        field.layer.cornerCurve = .continuous
        field.font = UIFont(name: "Helvetica", size: 18)
        return field
    }()
    
    private var magnifierImage: UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "magnifyingglass")
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = .gray
        imgView.backgroundColor = .clear
        return imgView
    }
    
    private lazy var tableView: UITableView = {
        var table = UITableView()
        table.dataSource = self
        table.separatorStyle = .none
        table.backgroundColor = .white
        table.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
        table.register(SecondTableViewCell.self, forCellReuseIdentifier: "SecondTableViewCell")
        table.register(ThirdTableViewCell.self, forCellReuseIdentifier: "ThirdTableViewCell")
        table.register(FourthTableViewCell.self, forCellReuseIdentifier: "FourthTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor =  .white
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.height.equalTo(45)
        }
        
        magnifierImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        textField.leftView = magnifierImage
        textField.leftViewMode = .always
        magnifierImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(textField.snp.bottom)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as! ThirdTableViewCell
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
        default:
            break
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}
