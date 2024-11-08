//
//  NameListViewController.swift
//  NameSpectrum Hub
//
//  Created by Unique Consulting Firm on 28/09/2024.
//

import UIKit
import AVFoundation 

class NameListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var SearchBar: UISearchBar!

        
    var speechSynthesizer = AVSpeechSynthesizer() // Add the speech synthesizer
    var currentSpeakerButton: UIButton? // Track the current speaker button to manage its state
    var currentUtterance: AVSpeechUtterance? // Track the current utterance
    var list = [Country]() // The list of countries (passed from previous screen)
    var filteredNamesBySection = [String: [Name]]() // Dictionary for filtered names
    var isSearching = false // Boolean to track if searching is active

    var isFromBoy = false
    var isFromhistory = false
    var isFromUnique = false
    var sections = [String]() // To store the section titles (alphabet letters)
    var namesBySection = [String: [Name]]() // Dictionary of names organized by section
    
    var isFromHomeName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        SearchBar.delegate = self
        speechSynthesizer.delegate = self // Set delegate for the speech synthesizer

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
        
        for country in list {
            let namesToOrganize: [Name]
            
            // Choose boy or girl names based on the flag
            if isFromUnique
            {
                namesToOrganize = country.uniqueNames
            }
            else if isFromhistory
            {
                namesToOrganize = country.historicalNames
            }
            else if isFromBoy 
            {
                namesToOrganize = country.boyNames
            } 
            else
            {
                namesToOrganize = country.girlNames
            }
            
            // Organize names by the first letter
            for name in namesToOrganize {
                let firstLetter = String(name.name.prefix(1)).uppercased()
                if namesBySection[firstLetter] != nil {
                    namesBySection[firstLetter]?.append(name)
                } else {
                    namesBySection[firstLetter] = [name]
                }
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
                // If the same button is pressed again, stop the current speech
                speechSynthesizer.stopSpeaking(at: .immediate)
                button.setImage(UIImage(named: "play"), for: .normal)
                currentSpeakerButton = nil // Reset the current speaker button when stopping
            } else {
                // Stop the previous utterance and start a new one
                speechSynthesizer.stopSpeaking(at: .immediate)
                currentSpeakerButton?.setImage(UIImage(named: "play"), for: .normal)
        
                //speak(text: text)
                button.setImage(UIImage(named: "stop"), for: .normal)
                currentSpeakerButton = button
            }
        } else {
            // If not speaking, start a new utterance
            speak(text: text)
            button.setImage(UIImage(named: "stop"), for: .normal)
            currentSpeakerButton = button
        }
    }
    
    func speak(text: String) {
           let utterance = AVSpeechUtterance(string: text)
           utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
           utterance.rate = 0.5
           currentUtterance = utterance // Store the current utterance
           speechSynthesizer.speak(utterance)
       }

       // Stop the sound when the utterance finishes
       func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
           currentSpeakerButton?.setImage(UIImage(named: "play"), for: .normal)
           currentSpeakerButton = nil // Reset the current speaker button when done
       }



    // Number of sections (based on first letters)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchNameTableViewCell
        
        let sectionKey = isSearching ? Array(filteredNamesBySection.keys.sorted())[indexPath.section] : sections[indexPath.section]
        
        if let names = isSearching ? filteredNamesBySection[sectionKey] : namesBySection[sectionKey] {
            let nameItem = names[indexPath.row]
            cell.NameLable.text = nameItem.name
            cell.MeaningLabel.text = nameItem.meaning
           // cell.aniamatedView.isHidden = true
        }
        
        cell.speakerButtonAction = {
            let names = self.isSearching ? self.filteredNamesBySection[sectionKey] : self.namesBySection[sectionKey]
            let nameItem = names?[indexPath.row]
            guard let name = nameItem?.name else { return }
            self.handleSpeakerButtonTapped(for: cell.Speakertbtn, text:name)
        }


        return cell
    }

    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    // This method is called when the user types in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // If the search bar is empty, reset the search state
            isSearching = false
            filteredNamesBySection.removeAll()
        } else {
            // Filter names by the search text
            isSearching = true
            filterNames(for: searchText)
        }
        
        // Reload the table view to reflect the search results
        TableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset search when the cancel button is clicked
        isSearching = false
        searchBar.text = ""
        TableView.reloadData()
    }

}
