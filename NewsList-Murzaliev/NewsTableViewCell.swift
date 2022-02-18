//
//  NewsTableViewCell.swift
//  NewsList-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //MARK: - Создание элементов кастомной ячейки
    
    private lazy var layoutScreen: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var newsTitle: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textColor = .black
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var newsDue: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 10, weight: .regular)
        view.textColor = .lightGray
        return view
    }()

    override func layoutSubviews() {
        setSubViews()
    }
    
    private func setSubViews() {
        
        addSubview(layoutScreen)
        layoutScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutScreen.addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(4)
            make.height.equalTo(layoutScreen.frame.height - 10)
            make.width.equalTo(layoutScreen.frame.height - 10)
        }
        
        layoutScreen.addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.equalTo(newsImage.snp.right).offset(5)
            make.height.equalTo(50)
            make.width.equalTo(layoutScreen.frame.width - 90)
        }
        
        layoutScreen.addSubview(newsDue)
        newsDue.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(100)
            make.top.equalTo(newsTitle.snp.bottom).offset(1)
            make.left.equalTo(newsTitle.snp.left)
        }
    }
    
    //MARK: - Метод для заполнения ячейки с помощью заданной модели
    
    func fill(model: NewsModel) {
        newsImage.image = UIImage(named: model.newsImage)
        newsTitle.text = model.newsTitle
        newsDue.text = model.newsDue
       }
}
