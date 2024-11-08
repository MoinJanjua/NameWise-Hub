//
//  Name&HistoryViewController.swift
//  NameSpectrum Hub
//
//  Created by Maaz on 08/10/2024.
//
import UIKit
import AVFoundation

class Name_HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var SearchBar: UISearchBar!

    var speechSynthesizer = AVSpeechSynthesizer()
    var currentSpeakerButton: UIButton?
    var currentUtterance: AVSpeechUtterance?

    // Declare the property to hold the list of NameAndHistory
    var list: [NameAndHistory] = [] // The list of NameAndHistory (passed from the previous screen)
    
    var filteredNamesBySection = [String: [NameAndHistory]]() // Dictionary for filtered names
    var isSearching = false // Boolean to track if searching is active

    var sections = [String]() // To store the section titles (alphabet letters)
    var namesBySection = [String: [NameAndHistory]]() // Dictionary of names organized by section
   // var maindata = String()
    var groupedNames = [String: [NameAndHistory]]()
    
    var isFromHomeName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self

        SearchBar.delegate = self
        speechSynthesizer.delegate = self

        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = 100

        // Organize names by sections
        organizeNamesIntoSections()
        
        TitleLbl.text = isFromHomeName
        
      
    }

    @IBAction func BackBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    // Organize the names into sections based on the first letter
    func organizeNamesIntoSections() {
        namesBySection.removeAll() // Clear previous namesBySection data

        for nameAndHistory in list {
            let firstLetter = String(nameAndHistory.name.prefix(1)).uppercased()
            if namesBySection[firstLetter] != nil {
                namesBySection[firstLetter]?.append(nameAndHistory)
            } else {
                namesBySection[firstLetter] = [nameAndHistory]
            }
        }

        // Sort section titles alphabetically
        sections = namesBySection.keys.sorted()

        // Sort names within each section alphabetically
        for (key, _) in namesBySection {
            namesBySection[key]?.sort { $0.name < $1.name }
        }

        // Reload the table view to display the organized names
        TableView.reloadData()
    }

    func filterNames(for searchText: String) {
        filteredNamesBySection.removeAll() // Clear previous filtered results

        for (section, names) in namesBySection {
            // Filter names in each section by the search text
            let filteredNames = names.filter { $0.name.lowercased().contains(searchText.lowercased()) }

            // Only add the section if there are any matching names
            if !filteredNames.isEmpty {
                filteredNamesBySection[section] = filteredNames
            }
        }
    }

    func handleSpeakerButtonTapped(for button: UIButton, text: String) {
        if speechSynthesizer.isSpeaking {
            if currentSpeakerButton == button {
                speechSynthesizer.stopSpeaking(at: .immediate)
                button.setImage(UIImage(named: "play"), for: .normal)
                currentSpeakerButton = nil
            } else {
                speechSynthesizer.stopSpeaking(at: .immediate)
                currentSpeakerButton?.setImage(UIImage(named: "play"), for: .normal)
                button.setImage(UIImage(named: "stop"), for: .normal)
                currentSpeakerButton = button
            }
        } else {
            speak(text: text)
            button.setImage(UIImage(named: "stop"), for: .normal)
            currentSpeakerButton = button
        }
    }

    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        currentUtterance = utterance
        speechSynthesizer.speak(utterance)
    }

    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearching ? filteredNamesBySection.keys.count : sections.count
    }

    // Number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = isSearching ? Array(filteredNamesBySection.keys.sorted())[section] : sections[section]
        return isSearching ? filteredNamesBySection[sectionKey]?.count ?? 0 : namesBySection[sectionKey]?.count ?? 0
    }

    // Header title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return isSearching ? Array(filteredNamesBySection.keys.sorted())[section] : sections[section]
    }

    // Cell for each name
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNH", for: indexPath) as! NameHistoryTableViewCell
        
        let sectionKey = isSearching ? Array(filteredNamesBySection.keys.sorted())[indexPath.section] : sections[indexPath.section]
        
        if let names = isSearching ? filteredNamesBySection[sectionKey] : namesBySection[sectionKey] {
            let nameItem = names[indexPath.row]
            cell.NameLable.text = nameItem.name
            cell.MeaningLabel.text = nameItem.meanings.joined(separator: ", ") // Assuming meanings is an array
           // cell.aniamtedView.isHidden = false
        }
        
        cell.speakerButtonAction = {
            let names = self.isSearching ? self.filteredNamesBySection[sectionKey] : self.namesBySection[sectionKey]
            let nameItem = names?[indexPath.row]
            guard let name = nameItem?.name else { return }
            self.handleSpeakerButtonTapped(for: cell.Speakertbtn, text: name)
        }

        return cell
    }

    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKey = sections[indexPath.section]
        if let selectedRecord = namesBySection[sectionKey]?[indexPath.row] {
            // Instantiate the DetailViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailNHViewController") as! DetailNHViewController
            
            // Pass the selected name and meaning to the DetailViewController
            detailVC.name = selectedRecord.name
            detailVC.meaning = selectedRecord.meanings.joined(separator: ", ") // Combine meanings
            detailVC.history = selectedRecord.history
            // Present the DetailViewController
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalTransitionStyle = .crossDissolve
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    // This method is called when the user types in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredNamesBySection.removeAll()
        } else {
            isSearching = true
            filterNames(for: searchText)
        }
        
        TableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        TableView.reloadData()
    }
}
