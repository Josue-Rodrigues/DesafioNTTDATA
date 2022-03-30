//
//  MainListViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 24/03/22.
//

import UIKit

class MainListViewController: UIViewController {
        
    var viewModel: MainListViewModelProtocol
    
    lazy var segmentedControl: SegmentedControlView = {
        
        let segmentedControl = SegmentedControlView()
        segmentedControl.clipsToBounds = true
        segmentedControl.layer.cornerRadius = 8
        
        return segmentedControl
    }()

    lazy var entryDetailView: EntryDetailView = {
        
        let entryDetailView = EntryDetailView()
        entryDetailView.clipsToBounds = true
        entryDetailView.layer.cornerRadius = 8
        
        return entryDetailView
    }()
    
    lazy var outputDetailView: OutputDetailView = {
        
        let outputDetailView = OutputDetailView()
        outputDetailView.clipsToBounds = true
        outputDetailView.layer.cornerRadius = 8
        
        return outputDetailView
    }()
    
    lazy var releasesTableView: UITableView = {
        let releasesTableView = UITableView()
        releasesTableView.backgroundColor = .white
        // Adicionando/Registrando nossas celulas dentro de nossa TableView
        releasesTableView.register(ReleasesTableViewCell.self, forCellReuseIdentifier: ReleasesTableViewCell.identifier)
        
        return releasesTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBar()
        //---------------------------------------------------------------
        self.settingTableViewProtocols(delegate: self, dataSource: self)
        self.segmentedControl.delegate(delegate: self)
        //---------------------------------------------------------------
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingSegmentedControlConstraint()
        self.settingEntryDetailViewConstraint()
        self.settingOutputDetailViewConstraint()
        self.settingReleasesTableViewCellConstraint()
//        viewModel.updateView = { [weak self] in
//            self?.releasesTableView.reloadData()
//        }
        self.viewModel.loadData()
    }
    
    // Função para setUp das caracterista da navigationController
    func setNavigationBar(){
        // Setando o title de minha NavigationBar
        navigationItem.title = "Meus gastos"
        // Deixando o titulo do Navigation em LargeTitle (Aumentando a fonte)
        navigationController?.navigationBar.prefersLargeTitles = true
        // Adicionando um BarButton com seleção de imagem personalizada
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Adicionar"), style: .plain, target: self, action: #selector(tappedAddReleaseButton))
    }
    
    // Função de seleção do Botão de adicionar
    @objc private func tappedAddReleaseButton() {
        viewModel.tappedAddReleaseButton()
    }
    
    private func settingsBackGround() {
        self.view.backgroundColor = .white
    }
    
    // Função para configuração do delegate e dataSource em nossa tableView
    public func settingTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        self.releasesTableView.delegate = delegate
        self.releasesTableView.dataSource = dataSource
    }
    
    func settingsSuperView() {
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.entryDetailView)
        self.view.addSubview(self.outputDetailView)
        self.view.addSubview(self.releasesTableView)
    }
    
    init(viewModel:MainListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Metodo de criação e configuração das Constraints (Framework - SNAPKIT)
    func settingSegmentedControlConstraint() {
        self.segmentedControl.snp.makeConstraints { make in
            make.bottom.equalTo(self.entryDetailView.snp.top).offset(-14.5)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(32)
        }
    }
    
    func settingEntryDetailViewConstraint() {
        self.entryDetailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(205)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(-8)
            make.height.equalTo(124)
        }
    }
    
    func settingOutputDetailViewConstraint() {
        self.outputDetailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(205)
            make.right.equalToSuperview().inset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(8)
            make.height.equalTo(124)
        }
    }
    
    func settingReleasesTableViewCellConstraint() {
        self.releasesTableView.snp.makeConstraints { make in
            make.top.equalTo(self.entryDetailView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// Colocando no HomeViewController em conformidade com os protocolos de Delegate e DataSource
extension MainListViewController: UITableViewDelegate, UITableViewDataSource {

    // Função que determina a quantidade de celulas que terá a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    // Função para criação do Title da TableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(section: section)
    }

    // Função para ajuste e edição da fonte do Title da TableView
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        viewModel.setUpHeaderView(section: section, view: view)
    }

    // Função para ajuste da altura do titulo da TableView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 41
    }
    
    // Função de criação da Celula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ReleasesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ReleasesTableViewCell.identifier, for: indexPath) as? ReleasesTableViewCell
        cell?.setUpCell(data: viewModel.getReleaseDetail(row: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Criando e editando função de arraste da TableViewCell - Direita para esquerda - DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        viewModel.edintingStyleCellRight(editingStyle: editingStyle, tableView: tableView, indexPath: indexPath)
    }
    
    // Criando e editando função de arraste da TableViewCell - esquerda para direita - EDIT
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        viewModel.editingStyleCellLeft(tableView: tableView)
    }

    // Função para determinar o tamanho da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension MainListViewController: SegmentedControlProtocol{
    func actionSegmentedControl(sender: UISegmentedControl) {
        viewModel.actionSegmentedControl(sender: sender)
    }
}
