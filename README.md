
# Project Title

Accessibility and Myo Band Drawing using ML

# Design Statement

Ability for a person with limited hand movement and usability to be able to use a mouse on a computer or train it to be used in any application. In our case, a drawing program. 

## Members

* Markus Hudobnik
* Ryan Craig

## Sensors/Programs

* Myo Band
* Wekinator
* Myo Connecter
* Myo Mapper
* Processing
* Java

### How To Set Up

To get started you will need to download [Myo Connect](https://www.myo.com/start). This allows you to connect to the Myo band and walks you through the set up process. After you are connected it is highly encouraged to make a [custom profile](https://support.getmyo.com/hc/en-us/articles/203829315-Creating-a-custom-calibration-profile-for-your-Myo-armband). This allows the band to better respond to your hand gestures.

After you have a custom profile you should download [Myo Mapper](http://www.wekinator.org/examples/#Myo_Armband_EMGmuscle_sensing_and_movement). This allows you to extract features that you want to send to Wekinator. There was an issue with at least the Mac version when trying to send hand pose. We made a fix and the source code is found [here](https://github.com/Oasis14/MyoMapper). If you want the compiled version just contact Ryan.

With your Myo band connected open up MyoMapper. In the feature selector, check Scaled and Hand Pose to ML. Once the the options are selected, close out of the features window and click on start. When the calibration and scaling screen shows up reset the origin to a comfortable position. After you click start data will send to Wekinator. For the input change the message to /myo1 and inputs to 4. For our puts we created 3 regression outputs and 1 classification.

After Wekinator is set up start the paint program. The program excepts 3 regressions and 1 classifications. The first two regressions control the x and y position of the brush. The last regression is for the brush width. The classification is the color of the paint.  

### Feature Extractor
* Yaw - The yaw is when you hand is moving left to right across your body
* Pitch - The pitch is up and down with your arm.
* Roll - The roll is the movement of turning you palm to the sky or ground.
* Hand Pose - The hand gesture wave out, wave in, fist, and resting are used to control our colors.

### Machine Learning model
Using MyoMapper the yaw, pitch and roll are scaled to send a value between 0 and 1. Also using MyoMapper we are able to set the origin per person to make it a more comfortable experience. The yaw controls where the brush is on the x and the pitch controls the y. The arm rotated up will have a fine point while rolling it over will make the point larger. The classification although isn't necessary needed gives each hand a pose number and lets the paint program know what color to use.

### Ideas for future improvements
Ideas to improve would be:
* Custom Gestures
* Multiple Myo Bands for control
* Have it work on calf or forearm

### Demo video

[Demo](vimeo.com/257027096)
