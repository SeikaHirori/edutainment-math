#  Edutainment Math

Objective: Create an edutainment app that tests players on multiplication.

**Reflection:**
- Post: *TBA*

***House Keeping***

Project specifications:
- https://www.hackingwithswift.com/guide/ios-swiftui/3/3/challenge

Index for Checklist:
- [ ] = TO-DO
- [x] = COMPLETED
___

** Checklist | Challenge Specifications (CS) **

- [x]  The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.

- [x] The player should be able to select how many questions they want to be asked: 5, 10, or 20.

- [x] You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
    - My note:
        - ~~Generate random values, and put into dictionary it doesn't exists~~
            - Using struct Question now
        - Need to create function for creating set of questions

- [x] Start with an App template, then add some state to determine whether the game is active or whether you’re asking for settings.

- [x] Generate a range of questions based on the user’s settings.

- [x] Show the player how many questions they got correct at the end of the game, then offer to let them play again.


- [ ] Stylize game with colours and animations
- [ ] Enable other math operation questions.
