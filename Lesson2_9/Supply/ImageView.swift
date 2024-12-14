//
//  ImageView.swift
//  Lesson2_9
//
//  Created by Evgeny Mastepan on 13.12.2024.
//

import UIKit

class ImageView: UIImageView {
    init(round: CGFloat = 0) {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = round
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


