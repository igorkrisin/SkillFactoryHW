//
//  ItemCell.swift
//  TodoMVC
//
//  Created by Игорь Крысин on 07.02.2024.
//

import UIKit

protocol CellDelegate {
    func editCell(cell: ItemCell)
    
}

class ItemCell: UITableViewCell {
    
    var delegate: CellDelegate?
    
    var alert = UIAlertController()
    
    // Добавляем необходимые элементы интерфейса
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: "pencil"), for: .normal)
        btn.addTarget(self, action: #selector(moveToAlert), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func moveToAlert(_ sender: Any) {
        delegate?.editCell(cell: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        // Добавляем titleLabel к ячейке
        contentView.addSubview(titleLabel)
        
        //добавим кнопку в ячейку
        contentView.addSubview(changeBtn)
        
        // Настраиваем ограничения для titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        // Настраиваем ограничения для кнопки
        NSLayoutConstraint.activate([
            
            changeBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            changeBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            changeBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
