//
//  ViewController.swift
//  NewsList-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let newsTable: UITableView = {
        let view = UITableView()
        return view
    }()
    
    //MARK: - Создание коллекции данных по заданной модели
    
    private lazy var news: [NewsModel] = [
        NewsModel(newsImage: "logo1", newsTitle: "В ЕС хотят мирно разрешить конфликт на Украине, заявила глава МИД Германии", newsDue: "4 minutes ago"),
        NewsModel(newsImage: "logo2", newsTitle: "Россия 'highly likely' вторгнется на Украину, заявила глава МИД Британии", newsDue: "6 minutes ago"),
        NewsModel(newsImage: "logo3", newsTitle: "Войска Южного и Западного ВО возвращаются в места дислокации после учений", newsDue: "7 minutes ago"),
        NewsModel(newsImage: "logo4", newsTitle: "Глава Госсовета Италии напомнил о главном посыле Мюнхенской речи Путина", newsDue: "8 minutes ago"),
        NewsModel(newsImage: "logo5", newsTitle: "Болгары высмеяли Байдена за назначение даты 'вторжения' России на Украину", newsDue: "10 minutes ago"),
        NewsModel(newsImage: "logo1", newsTitle: "В ЕС хотят мирно разрешить конфликт на Украине, заявила глава МИД Германии", newsDue: "4 minutes ago"),
        NewsModel(newsImage: "logo2", newsTitle: "Россия 'highly likely' вторгнется на Украину, заявила глава МИД Британии", newsDue: "6 minutes ago"),
        NewsModel(newsImage: "logo3", newsTitle: "Войска Южного и Западного ВО возвращаются в места дислокации после учений", newsDue: "7 minutes ago"),
        NewsModel(newsImage: "logo4", newsTitle: "Глава Госсовета Италии напомнил о главном посыле Мюнхенской речи Путина", newsDue: "8 minutes ago"),
        NewsModel(newsImage: "logo5", newsTitle: "Болгары высмеяли Байдена за назначение даты 'вторжения' России на Украину", newsDue: "10 minutes ago"),
        NewsModel(newsImage: "logo1", newsTitle: "В ЕС хотят мирно разрешить конфликт на Украине, заявила глава МИД Германии", newsDue: "4 minutes ago"),
        NewsModel(newsImage: "logo2", newsTitle: "Россия 'highly likely' вторгнется на Украину, заявила глава МИД Британии", newsDue: "6 minutes ago"),
        NewsModel(newsImage: "logo3", newsTitle: "Войска Южного и Западного ВО возвращаются в места дислокации после учений", newsDue: "7 minutes ago"),
        NewsModel(newsImage: "logo4", newsTitle: "Глава Госсовета Италии напомнил о главном посыле Мюнхенской речи Путина", newsDue: "8 minutes ago"),
        NewsModel(newsImage: "logo5", newsTitle: "Болгары высмеяли Байдена за назначение даты 'вторжения' России на Украину", newsDue: "10 minutes ago"),
        NewsModel(newsImage: "logo1", newsTitle: "В ЕС хотят мирно разрешить конфликт на Украине, заявила глава МИД Германии", newsDue: "4 minutes ago"),
        NewsModel(newsImage: "logo2", newsTitle: "Россия 'highly likely' вторгнется на Украину, заявила глава МИД Британии", newsDue: "6 minutes ago"),
        NewsModel(newsImage: "logo3", newsTitle: "Войска Южного и Западного ВО возвращаются в места дислокации после учений", newsDue: "7 minutes ago"),
        NewsModel(newsImage: "logo4", newsTitle: "Глава Госсовета Италии напомнил о главном посыле Мюнхенской речи Путина", newsDue: "8 minutes ago"),
        NewsModel(newsImage: "logo5", newsTitle: "Болгары высмеяли Байдена за назначение даты 'вторжения' России на Украину", newsDue: "10 minutes ago")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        
    }
    
    private func setViews() {
        newsTable.delegate = self
        newsTable.dataSource = self
        
        view.addSubview(newsTable)
        newsTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //MARK: - Добавление элементов в UINavigationBar
        
        let labelImage = UIImageView(image: UIImage(named: "rsslogo"))
        labelImage.contentMode = .scaleAspectFit
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)

        let leftImage = UIImage(systemName: "heart", withConfiguration: largeConfig)
        let rightImage = UIImage(systemName: "arrowshape.turn.up.right", withConfiguration: largeConfig)
        let leftButton = UIButton(type: .system)
        leftButton.setImage(leftImage, for: .normal)
        let rightButton = UIButton(type: .system)
        rightButton.setImage(rightImage, for: .normal)
        
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(35)
            make.height.equalTo(30)

        }
        
        navigationController?.navigationBar.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(35)
            make.height.equalTo(30)

        }
    
        navigationController?.navigationBar.addSubview(labelImage)
        labelImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            
        }
        
        
    }


}

//MARK: - Делегаты главной таблицы новостей

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = NewsTableViewCell()
        let model = news[index]
              
        cell.fill(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 12
    }
    
    
}
