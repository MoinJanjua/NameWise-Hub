import UIKit
import AVFoundation // Import this
import PDFKit

class SearchNameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var exportBtn: UIButton!
    @IBOutlet weak var Searchbview: UIView!
    @IBOutlet weak var mView: UIView!
    
    var sectionColors: [UIColor] = [
         .gray
    ]

    var isFromHomeName = String()
    var isCountryName = String()
   
    var names = [Records]()
    var filteredNames = [Records]()
    var isSearching = false
    
    var sectionTitles = [String]()
    var groupedNames = [String: [Records]]()
    var AllData : [Records] = []
    var speechSynthesizer = AVSpeechSynthesizer() // Add the speech synthesizer
    var currentSpeakerButton: UIButton? // Track the current speaker button to manage its state
    var currentUtterance: AVSpeechUtterance? // Track the current utterance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyCornerRadiusToBottomCorners(view: mView, cornerRadius: 35)
        
        TableView.delegate = self
        TableView.dataSource = self
        SearchBar.delegate = self
        speechSynthesizer.delegate = self // Set delegate for the speech synthesizer

        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = 120

        TitleLbl.text = isFromHomeName
       // , history: $0.history
        if isFromHomeName == "Prophet Name" {
            names = prophets.map { Records(name: $0.name, meanings: $0.meanings) }
        } else if isFromHomeName == "Sahaba Name" {
            names = maleSahaba.map { Records(name: $0.name, meanings: $0.meanings) }
        } else if isFromHomeName == "Historical Name" {
            names = historicalNames.map { Records(name: $0.name, meanings: $0.meanings) }
        } else if isFromHomeName == "Unique Name" {
            names = uniqueMaleNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Girl" {
            if isCountryName == "Christian Name" {
                    names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
            }
            else  if isCountryName == "HinduName" {
                names = hinduGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "AfricanName" {
                names = africanGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "PersianName" {
                names = persianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "GreekName" {
                names = greekGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "ChineseName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "JapaneseName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "KoreanName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "RomanName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "ArmenianName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "SikhName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "FilipinoName" {
                names = filipinoGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else  if isCountryName == "JewishName" {
                names = christianGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
            else
            {
                names = muslimGirlNames.map { Records(name: $0.name, meanings: $0.meanings) }
            }
              
        }
        else if isFromHomeName == "Christian" {
                names = christianBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Hindu" {
                names = hinduBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "African" {
                names = africanBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Persian" {
                names = persianBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Greek" {
                names = greekBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Chinese" {
                names = chineseBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Japanese" {
                names = japaneseBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Korean" {
                names = koreanBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Roman" {
                names = romanBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Armenian" {
                names = armenianBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Sikh" {
                names = sikhBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Filipino" {
                names = filipinoBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        else if isFromHomeName == "Jewish" {
                names = jewishBoyNames.map { Records(name: $0.name, meanings: $0.meanings) }
        }
        
        
        groupedNames = groupNamesByAlphabet(names: names)
        sectionTitles = Array(groupedNames.keys).sorted()
        filteredNames = names
    }

    @IBAction func BackBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    func groupNamesByAlphabet(names: [Records]) -> [String: [Records]] {
        var groups = [String: [Records]]()
        
        for prophet in names {
            let firstLetter = String(prophet.name.prefix(1)).uppercased()
            if groups[firstLetter] != nil {
                groups[firstLetter]?.append(prophet)
            } else {
                groups[firstLetter] = [prophet]
            }
        }
        
        return groups
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = sectionTitles[section]
        return groupedNames[sectionKey]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchNameTableViewCell
        
        let sectionKey = sectionTitles[indexPath.section]
        let prophet = groupedNames[sectionKey]?[indexPath.row]

        cell.NameLable.text = prophet?.name
        cell.MeaningLabel.text = prophet?.meanings.joined(separator: ", ")

        // Set up the action for the speaker button
        cell.speakerButtonAction = { [weak self] in
            guard let prophet = prophet else { return }
            self?.handleSpeakerButtonTapped(for: cell.Speakertbtn, text:prophet.name)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKey = sectionTitles[indexPath.section]
        if let selectedRecord = groupedNames[sectionKey]?[indexPath.row] {
            // Instantiate the DetailViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            // Pass the selected name and meaning to the DetailViewController
            detailVC.name = selectedRecord.name
            detailVC.meaning = selectedRecord.meanings.joined(separator: ", ") // Combine meanings
            
            // Present the DetailViewController
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalTransitionStyle = .crossDissolve
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionTitles.firstIndex(of: title) ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = sectionColors[section % sectionColors.count] // Use modulo to ensure the color index is within bounds

           let headerLabel = UILabel(frame: CGRect(x: 16, y: 5, width: tableView.frame.size.width, height: 30))
           headerLabel.textColor = .white
           headerLabel.text = sectionTitles[section]
           headerLabel.font = UIFont.boldSystemFont(ofSize: 16)

           headerView.addSubview(headerLabel)

           return headerView
       }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 30
       }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredNames = names
        } else {
            isSearching = true
            filteredNames = names.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }

        groupedNames = groupNamesByAlphabet(names: filteredNames)
        sectionTitles = Array(groupedNames.keys).sorted()

        TableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        filteredNames = names

        groupedNames = groupNamesByAlphabet(names: names)
        sectionTitles = Array(groupedNames.keys).sorted()

        TableView.reloadData()
    }

    // MARK: - Text to Speech
    func handleSpeakerButtonTapped(for button: UIButton, text: String) {
        if speechSynthesizer.isSpeaking {
            if currentSpeakerButton == button {
                // If the same button is pressed again, stop the current speech
                speechSynthesizer.stopSpeaking(at: .immediate)
                button.setImage(UIImage(named: "circle_play"), for: .normal)
                currentSpeakerButton = nil // Reset the current speaker button when stopping
            } else {
                // Stop the previous utterance and start a new one
                speechSynthesizer.stopSpeaking(at: .immediate)
                currentSpeakerButton?.setImage(UIImage(named: "circle_play"), for: .normal)
        
                //speak(text: text)
                button.setImage(UIImage(named: "circle_stop"), for: .normal)
                currentSpeakerButton = button
            }
        } else {
            // If not speaking, start a new utterance
            speak(text: text)
            button.setImage(UIImage(named: "circle_stop"), for: .normal)
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
        currentSpeakerButton?.setImage(UIImage(named: "circle_play"), for: .normal)
        currentSpeakerButton = nil // Reset the current speaker button when done
    }
 
    // Create a PDF from your data (adjust this method to match your content)
      func createPDF() -> Data {
          let pdfMetaData = [
              kCGPDFContextCreator: "App Name",
              kCGPDFContextAuthor: "Your Name"
          ]
          let format = UIGraphicsPDFRendererFormat()
          format.documentInfo = pdfMetaData as [String: Any]

          let pageWidth = 8.5 * 72.0
          let pageHeight = 11 * 72.0
          let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

          let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
          let data = renderer.pdfData { (context) in
              context.beginPage()
              
              let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
              let titleString = NSAttributedString(string: "Exported Names and Meanings", attributes: titleAttributes)
              titleString.draw(at: CGPoint(x: 50, y: 20))
              
              var yOffset: CGFloat = 60
              
              for section in sectionTitles {
                  if let sectionNames = groupedNames[section] {
                      let sectionTitleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
                      let sectionTitle = NSAttributedString(string: section, attributes: sectionTitleAttributes)
                      sectionTitle.draw(at: CGPoint(x: 50, y: yOffset))
                      yOffset += 30
                      
                      for record in sectionNames {
                          let nameString = NSAttributedString(string: "Name: \(record.name)", attributes: nil)
                          nameString.draw(at: CGPoint(x: 50, y: yOffset))
                          yOffset += 20
                          
                          let meaningString = NSAttributedString(string: "Meaning: \(record.meanings.joined(separator: ", "))", attributes: nil)
                          meaningString.draw(at: CGPoint(x: 50, y: yOffset))
                          yOffset += 40
                          
                          if yOffset > pageHeight - 100 {
                              context.beginPage()
                              yOffset = 50
                          }
                      }
                  }
              }
          }
          return data
      }
  
        // Helper to get documents directory
        func getDocumentsDirectory() -> URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }

        // Alert to notify the user where the PDF was saved
        func showPDFSavedAlert(path: URL) {
            let alert = UIAlertController(title: "PDF Exported", message: "PDF successfully saved at \(path.lastPathComponent)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

    @IBAction func ExportPdfButton(_ sender: Any) {
        let pdfData = createPDF()

        // Get the path to the app's Documents directory
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pdfPath = documentDirectory.appendingPathComponent("names_list.pdf")

        do {
            // Write the PDF data to the file
            try pdfData.write(to: pdfPath)
            print("PDF saved to: \(pdfPath)")
            
            // Check iOS version and use appropriate initializer
            if #available(iOS 14.0, *) {
                let documentPicker = UIDocumentPickerViewController(forExporting: [pdfPath])
                documentPicker.delegate = self
                present(documentPicker, animated: true, completion: nil)
            } else {
                let documentPicker = UIDocumentPickerViewController(urls: [pdfPath], in: .exportToService)
                documentPicker.delegate = self
                present(documentPicker, animated: true, completion: nil)
            }
        } catch {
            print("Failed to save PDF: \(error)")
        }
    }

}
// Extend the view controller to handle the document picker delegate methods
extension SearchNameViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let url = urls.first {
            print("File saved to: \(url)")
        }
    }
//    func sharePDF(pdfFilePath: URL) {
//        let activityVC = UIActivityViewController(activityItems: [pdfFilePath], applicationActivities: nil)
//        activityVC.popoverPresentationController?.sourceView = self.view
//        self.present(activityVC, animated: true, completion: nil)
//    }
}
