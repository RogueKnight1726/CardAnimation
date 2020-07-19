# CardAnimation

After examining the video that was given to me, the observations I made are as follows:

The set of three cards must be animated according to the pan gesture location value.
The animation must contain a small delay, and the delay must be different for each of the card.
The animation must also have a damping effect to it. And therefore a UIView animate method with delay, spring and damping would be the best choice to recreate this animation.
During the drag animation, a UIVisualEffect must be used below the cards to create the blurred effect.
During the drag animation the cards hold their rotation values.
Upon tapping the top most card, the cards below must do a perspective rotate around the X axis, simulating a 3D rotation effect. CoreAnimation with a 3D rotation transform looked best to be used for this.
The detail controller comes up from the bottom, like a presented controller, but only stays at the bottom half of the screen. I would need to implement a custom transition for this, and support both swipe to dismiss and tap outside to dismiss.

			 

Implementation:

Used my own BaseView and BaseImageView (UIView)subclass to create the cards. Both of these subclasses are highly reusable and support curved corner radius with shadow and border colour.

Applied a pan gesture on the entire view of the controller, and implemented a simple UIView.animate method to change the centre value of the cards. Added damping and spring values as I required.(Commit : 1b2732827457c36e4188c99d5e6645bb0aac66fb)

Applied CGAffineTransform rotation transform to cardTwo and cardThree, after changing the anchor point to mimic the card rotation as given in the question. Applied the same animation to the cards as the first card.

Controller transition is handled with PartialScreenPresentationController and a Dismisser class. My experience with custom transition comes from trying to mimic Pinterest application several years ago. Some reference was required to refresh my memory.

The DetailController extends the entire screen. A half size view is inside that controller to mimic the controller extending only till half of the screen.This is added so that I can add a tap gesture outside of the bounds of the halfView to dismiss the controller. A swipe gesture is also added to the halfView to dismiss if the y offset of the swipe gesture is more than 100pts. CGAffineTransform added to animate the swipe interaction. (Commit: 8c4bb69962183afd505866a14f96f9922d3582aa)

Added CoreAnimation 3D transforms to the cards in HomeController to rotate the cards around the X Axis. My experience with the 4x4 matrix and 3D transform mainly comes from working in SceneKit. (Commit : 43eaee18a275e63c5b7662529a83d75af88f7a29)

Some minor aesthetics changes were implemented thereafter.

The development was done in iPhone XR. The primary objective is to support the layout in all iPhone devices. Therefore, the card coded measurement of the views and transform was divided with the view.frame’s dimensioned and converted to multiplier values and added in constraint values and transform values.(Commit: fbf5f50e7ea8682033745177cea6237c6a510b03)

Tested in iPhone 8, iPhone 11 Pro max simulators and iPhone XR device.

Image credit:
backgroundImage
<a href="https://www.freepik.com/free-photos-vectors/background">Background vector created by rawpixel.com - www.freepik.com</a>

<a href='https://www.freepik.com/free-photos-vectors/background'>Background vector created by vector_corp - www.freepik.com</a>
<a href='https://www.freepik.com/free-photos-vectors/background'>Background vector created by pikisuperstar - www.freepik.com</a>
<a href='https://www.freepik.com/free-photos-vectors/background'>Background vector created by pikisuperstar - www.freepik.com</a>
<a href='https://www.freepik.com/free-photos-vectors/people'>People vector created by pch.vector - www.freepik.com</a>
