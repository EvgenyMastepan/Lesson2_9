//
//  CellView.swift
//  Lesson2_9
//
//  Created by Evgeny Mastepan on 12.12.2024.
//

import UIKit

class CellView: UICollectionViewCell {
    static let identifier: String = "CellView"
    let ourIndent:CGFloat = 15
    
    lazy var screenWidth = UIScreen.main.bounds.width - 4 * ourIndent
    lazy var userImage = ImageView(round: 22)
    lazy var userNameLabel = LabelView(font: .systemFont(ofSize: 20, weight: .bold))
    lazy var mainImage = ImageView()
    lazy var dateLabel = LabelView(font: .systemFont(ofSize: 14, weight: .light))
    lazy var titulTextLabel = LabelView(font: .systemFont(ofSize: 22, weight: .bold))
    lazy var bigTextLabel = LabelView(font: .systemFont(ofSize: 16, weight: .regular))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .systemGray6
        contentView.addSubviews(userImage, userNameLabel, mainImage, dateLabel, titulTextLabel, bigTextLabel)
        setConstraints()
    }
    private func setConstraints() {
        let imageRatio = mainImage.image?.getRatio() ?? 0
        print (imageRatio)
        let imageHeight =  imageRatio * screenWidth
        print (screenWidth)
        print (imageHeight)
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ourIndent),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            userImage.heightAnchor.constraint(equalToConstant: 44),
            userImage.widthAnchor.constraint(equalToConstant: 44),
            
            mainImage.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: ourIndent),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            mainImage.widthAnchor.constraint(equalToConstant: screenWidth),
            mainImage.heightAnchor.constraint(equalToConstant: imageHeight),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: ourIndent),
            userNameLabel.heightAnchor.constraint(equalToConstant: 25),
            userNameLabel.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            
            dateLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ourIndent),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            dateLabel.heightAnchor.constraint(equalToConstant: 17),
            
            titulTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            titulTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            titulTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            titulTextLabel.heightAnchor.constraint(equalToConstant: 27),
            
            bigTextLabel.topAnchor.constraint(equalTo: titulTextLabel.bottomAnchor),
            bigTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            bigTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            bigTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ourIndent)
            
            
        ])
    }
    
    func setupCell(data: Card) {
        userImage.image = UIImage(named: data.userImage)
        userNameLabel.text = data.userName
        mainImage.image = UIImage(named: data.image)
        dateLabel.text = data.date
        titulTextLabel.text = data.titulText
        bigTextLabel.text = data.bigText
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
