
  

## Coachmaker

  

Coach marks are temporary messages that educate users through new or unfamiliar product experiences. They can be chained into a sequence to form a tour.

  

<a  href="https://spectrum.adobe.com/page/coach-mark/"> Adobe Said </a> [👨‍🎓](https://emojipedia.org/man-student/)

  

  ![coachmaker](https://img.shields.io/pub/v/coachmaker.svg) ![enter image description here](https://badges.bar/coachmaker/likes) ![enter image description here](https://badges.bar/coachmaker/popularity) ![enter image description here](https://badges.bar/coachmaker/pub%20points) ![enter image description here](https://img.shields.io/github/stars/muhammadsaddamnur/coachmaker.svg?style=flat&logo=github&colorB=deeppink&label=stars)  ![enter image description here](https://img.shields.io/badge/license-MIT-purple.svg) 
  
Stt..... this package simple to use 🤫

  

  

## Demo 😎

  

**Full Demo**<p>

  

![Full Demo](https://media.giphy.com/media/nTVvgbNGsQg1Zv83IV/giphy.gifhttps://media.giphy.com/media/WIURSHVcoKGV8YWR1w/giphy.gif)

  

  

**Pageview Slider**<p>

  

![Pageview Slider](https://media.giphy.com/media/0UcTUY865F0Rxk73Va/giphy.gif)

  

  

**Single Page**<p>

  

![Single Page](https://media.giphy.com/media/Ve85kqYGuRAdlcJ8AF/giphy.gif)

  

**Landscape Page**<p>

![landscape](https://media.giphy.com/media/wULeJi3tq26TmBWorv/giphy.gif)

  

## Usage 🍽️

  

  

Time to fight🥊 :

  

  

**#1.** add `coachmaker` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

  

  

**#2.** import package on your file, `import 'package:coachmaker/coachmaker.dart';`

  

  

**#3.** Wrap your widget with `CoachPoint`

  

  

> Example :

  

>

  

```dart
CoachPoint(
	initial: '1',
	child: Container(
	          color: Colors.red,
              height: 50,
              width: 100,
              child: Text(
                  'Sorot aku kakak',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
           ),
   ),
),
```

  

**Create a `initial` with a unique name unique name*

  

**#4.** Call this method for show coachmaker

  

![initial](https://github.com/muhammadsaddamnur/coachmaker/blob/main/example/images/initial.png?raw=true)

  

> Example :

  

>

  

```dart
FloatingActionButton(
          onPressed: () {
            CoachMaker(context,
                    ///coachmaker will show from index 0 to n of initialList
                    ///
                    initialList: [
                      ///initial name of CoachPoint from previous example ☝️ (inital: '1') 
                      ///
                      CoachModel(
                          initial: '1',
                          title: 'Indonesia',
                          maxWidth: 400,
                          ///if subtitle length > 1 will show pageview slider
                          ///
                          subtitle: [
                            '1. Aceh',
                            '2. Jakarta',
                            '3. Bali',
                            '4. Papua',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      ///other initials name available
                      ///
                      CoachModel(
                          initial: '2',
                          title: 'Burung perkutut, burung kuthilang',
                          maxWidth: 400,
                          alignment: Alignment.centerRight,
                          subtitle: [
                            'kamu kentut enggak bilang bilang ',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                    ],
                    nextStep: CoachMakerControl.next,
                    buttonOptions: CoachButtonOptions(
                        buttonTitle: 'Lanjut',
                        buttonStyle: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            elevation: MaterialStateProperty.all(0))))
                .show();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
),
```

  

**#5.** Running your project 🚗

  

  

**Full example :**  [Example Coachmaker](https://github.com/muhammadsaddamnur/coachmaker/tree/main/example)

  
  

## List Controller

Now you can auto scroll of list and coach the item

  

2 way to use it :

**#1 Using Index**

  

![same height of list](https://media.giphy.com/media/RhYMtF5qCB56ip3KnX/giphy.gif)

  

used when all list items are the ***same height size*** .

  

```dart
CoachModel(
  initial: '60',
  title: 'Nomer 60',
  maxWidth: 400,
  subtitle: [
    'Tuh kan loncat',
  ],
  scrollOptions: ScrollOptions(
    scrollController: _scrollController,
    isLast: true
  ),
  header: Image.asset(
    'images/logo.png',
    height: 50,
    width: 50,
  )
),
```

confused? you can check this [Example Here](https://github.com/muhammadsaddamnur/coachmaker/blob/main/example/lib/scrollExample.dart)

  

**#2 Using Manual Height**

![Manual Height](https://media.giphy.com/media/0iVBSiUCceG0mJrTJL/giphy.gif)

  

Sometimes, maybe your list item haven't same height, you can using **manualHeight** for sliding to item

```dart
CoachModel(
  initial: '1',
  title: 'Burung kakak tua',
  maxWidth: 400,
  subtitle: [
    'Burung kakak tua\nHinggap di jendela\nNenek sudah tua\nGiginya tinggal dua',
  ],
  header: Image.asset('images/logo.png',
    height: 50,
    width: 50,
  ),
  scrollOptions: ScrollOptions(
    scrollController: _scrollController,
    manualHeight: 600
  ),
),
```

confused? you can check this [Example Here](https://github.com/muhammadsaddamnur/coachmaker/blob/main/example/lib/scrollManualHeightExample.dart)

  

## Contribution 🆘

  

If you find any errors or want to add improvements, you can open a issue or develop the fix and open a pull request. Thank you!

  

  

## Support Me 🙏

  

<a  href="https://www.buymeacoffee.com/saddamnur">![buymeacoffee.com/saddamnur](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-1.svg)</a>

  

<b> Bisa pake Gopay, Dana, Link Aja, OVO, dan QRIS loh gaes.... </b>

<b>klik gambar dibawah ya </b>

<a  href="https://saweria.co/saddamnur">![enter image description here](https://raw.githubusercontent.com/muhammadsaddamnur/float_bubble/main/saweria.png)</a>