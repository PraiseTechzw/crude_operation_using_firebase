# Todo App ne Firebase (Zvinhu Zvekuita)

![App Screenshot](https://via.placeholder.com/300x600?text=Todo+App+Screenshot) 
*<!-- Isa screenshot yako pano -->*

Yakagadzirwa naFlutter uye Firebase Firestore. Iyi ndiyo yakapfava Todo App inoshandisa Firebase backend. Ine Shona mhinduro uye mazwi akashandurwa.

## Zvinoshandiswa (Features)
- **CRUD Operations**:
  - Wedzera zvinhu zvitsva (Create)
  - Verenga zvese zvawakanyora (Read)
  - Chinja mamiriro ezvinhu (Update)
  - Dzima zvinhu (Delete)
- Kuvandudzwa kwenguva chaiyo (Real-time updates)
- Shona mazwi mumainterface
- Checkbox yekuratidza kuti zvaitwa
- Zvinyorwa zvinorongwa zvichibva panguva yazvakanyorwa
- Dialog yekuwedzera zvinhu zvitsva

## Kuseta (Installation)

### Unoda (Requirements)
- Flutter SDK (v3.0.0 kana nyowani)
- Firebase account
- Android/iOS simulator kana device

### Nzira yekuseta (Setup Steps)

1. **Dhonza repository iyi or clone (kuisa mulaptop mako)**
```bash
git clone https://github.com/PraiseTechzw/crude_operation_using_firebase.git
```

2. **Isa dependencies**
```bash
flutter pub get
```

3. **Seta Firebase**
- Gadzira Firebase project mu [Firebase Console](https://console.firebase.google.com/)
- Wedzera Android/iOS app kune project yako
- Dhonza uye isa Firebase configuration files
- Vhura Firestore database uye gadzira collection inonzi `todos`

4. **Tanga app**
```bash
flutter run
```

## Mashandisiro (Usage)

1. **Kuwedzera Chinhu Chitsva**
- Dzvanya + button
- Nyora zita (Title) netsanangudzo (Description)
- Dzvanya "Wedzera"

2. **Kushandura Mamiriro**
- Dzvanya checkbox kuti uchinje kuti zvaitwa kana kusati

3. **Kudzima Chinhu**
- Dzvanya tsvimbo yekudzima (delete icon)

## Dependencies
- [firebase_core](https://pub.dev/packages/firebase_core): ^2.15.1
- [cloud_firestore](https://pub.dev/packages/cloud_firestore): ^4.9.1

## Shona Mazwi Akashandiswa
| Shona           | English         |
|-----------------|-----------------|
| Zvinhu Zvekuita | Todo Items      |
| Wedzera         | Add             |
| Kanzura         | Cancel          |
| Tsanangudzo     | Description     |
| Dzima           | Delete          |

## Kupa Rubatsiro (Contributing)
1. Fork repository iyi
2. Gadzira branch yako (`git checkout -b feature/username`)
3. Savera zvaunenge waita (`git commit -m 'Added new feature'`)
4. Push kune branch yako (`git push origin feature/username`)
5. Gadzira Pull Request

## License
[MIT License](https://choosealicense.com/licenses/mit/)

## Kutenda (Acknowledgements)
- Firebase team nekunaka kwe backend service
- Flutter team nekunaka kwe framework
- VaShona vese vakabatsira mukushandura mazwi
```

**Gwaro reFirestore Security Rules (for testing):**
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

**Yambiro:** Shandura mitemo yekuchengetedza (security rules) usati waendesa kuproduction!

---

⚠️ **Chokwadi chekuti:**  
- Waisa Firebase configuration files zvakarurama  
- Wakagadzira Firestore collection inonzi `todos`  
- Wakaisa zvakanaka Firestore security rules
```

This README includes:
- Bilingual documentation (Shona/English)
- Setup instructions
- Usage guide
- Feature list
- Contribution guidelines
- License information
- Important warnings about security rules
- Vocabulary translation table

You can customize it further by:
1. Adding real screenshots
2. Including links to your live demo
3. Adding more detailed technical documentation
4. Including acknowledgments for specific contributors
5. Adding troubleshooting section