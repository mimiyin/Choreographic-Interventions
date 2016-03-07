# Syllabus - Work in Progress

- Spring 2016, Mondays, 7PM-9:30PM in Studio 1 @[111 2nd Avenue](https://goo.gl/maps/FfVoDSMxNSN2) 
- Mimi Yin, mimi.yin@nyu.edu
- [Office Hours Signup](https://itp.nyu.edu/inwiki/Signup/Mimi)

###Course Structure | [See introductory description below.](#course-description)
Over the course of the semester, we will cover 4 topic areas: Pathways, Shape, Space and Sound+Text. Topics will be introduced through movement-based improvisation exercises. Computational strategies will be examined through code examples and custom software tools. For each topic, students will create a small movement study in 2 stages: the first analog, the second computational with the aim of fully exploring how technology "intervened" and changed the choreographic process.

The class will culminate in a showing of student work. Final projects can either be in the form of a tool to aid in movement practice, an interactive installation or a live performance. 

Because course topics are organized around movement concepts, technical topics will be introduced and built upon week to week. 
- What do cameras see? RGB, IR, Kinect, Mocap...
- Skeletons and Depth Maps
- Blob and Face detection
- Basic programming concepts: Variables, Conditionals, Loops, Arrays, Objects
- Basic drawing + animation in Processing
- 2D v. 3D
- Squares v. Circles: Cartesian and Polar Coordinates
- Calculating Velocity and Acceleration
- Using Random and Noise
- Simple math for mapping values
- Manipulating Images, Video, Text, and Sound

"Soft Skills" we will practice:
- Sketching (as in drawing on paper) choreographic ideas.
- Defining rule sets for movement.
- Deconstructing choreography into parameters for code.
- Extracting choreographic ideas from code.

###Resources
- [Download Processing](https://www.processing.org/download/)
- [Learning Processing 2nd Edition - The Book](http://learningprocessing.com/) by Dan Shiffman
- [Learning Processing - Videos](http://learningprocessing.com/videos/)
- [Learning Processing - Examples](https://github.com/shiffman/LearningProcessing)
- [Processing Reference](https://processing.org/reference/)
- [Open Processing](http://openprocessing.org) in Firefox!
- Select chapters from [The Viewpoints Book](http://www.amazon.com/The-Viewpoints-Book-Practical-Composition/dp/1559362413) | [PDF](http://www.bam.org/media/4813887/anne-bogart-and-tina-landau-the-viewpoints-book.pdf)
- Select chapters from [Dynamic Alignment Through Imagery](http://www.amazon.com/Dynamic-Alignment-Through-Imagery-Edition/dp/0736067892) | [Google Books](https://books.google.com/books?id=CBwV_g8DhEMC&lpg=PA2&ots=nRQ2JS3SWv&dq=dynamic%20alignment%20chapters&pg=PP1#v=onepage&q&f=false)
- [Forsythe Technique Videos on Youtube](https://www.youtube.com/user/GrandpaSafari/videos)
- More to come!

###Dance students checking stuff out of ITP ER:
   - Check it out under my name
   - Bring your NYU ID
   - netid
   - Nxxxx id number

## Week 1: Introduction + Pathways

###The [dramaturgy](https://en.wikipedia.org/wiki/Dramaturgy) of numbers.
- What is the dramatic content in numbers?
   - [The Myth of Sisyphus](https://en.wikipedia.org/wiki/The_Myth_of_Sisyphus)
   - [Zeno's Paradox](http://platonicrealms.com/encyclopedia/zenos-paradox-of-the-tortoise-and-achilles)
   - [Prime numbers](https://en.wikipedia.org/wiki/Prime_number)
   - [Poeme Symphonique by Gyorgy Ligeti](https://www.youtube.com/watch?v=-mUv705xj3U)

### What does it mean to be in conversation with technology?
- In 2016, what do we mean when we say technology?
- Unison --> [Call-and-Response](https://www.youtube.com/playlist?list=PLwgpQxdj6S9N0vhf-_m1OAmZn4llXBsWS) --> Steering --> Counterpoint --> Serendipity
- Why use technology at all? From [Gesamtkunstwerk](https://en.wikipedia.org/wiki/Gesamtkunstwerk) to the [I Ching](https://en.wikipedia.org/wiki/I_Ching).

### Technology
 - Why Processing? 
 - Why Java?
 - Why Kinect v2? [v1 versus v2](http://zugara.com/how-does-the-kinect-2-compare-to-the-kinect-1)

##Pathways
How does the ability to visualize pathways change them?
- What defines a path? Forsythe: [Avoidance](https://www.youtube.com/watch?v=cqGyFiEXXIQ) | [Line](https://www.youtube.com/watch?v=aOd0PtgS8KU)
- Unison v. Dialogue | [Body Navigation](http://ole.kristensen.name/works/body-navigation/)
- Improv: "Draw" on the floor. Turn it into a duet.
- Code: Anatomy of a Sketch. X-Y Space. Drawing shapes. Mouse and keyboard interaction. Switch/Case. Variables. random().

##### Week 1 Assignment
- Book studio time.
- Spend time on your own playing with and trying to understand the *draw_mouse* example in the Week 1 / Class folder.
   - Make use of the [Processing Reference](http://processing.org/reference/)
   - Talk about it as a group. Help each other understand it.
- What does it means to "draw" on the floor?
	- Explore the full spectrum of conversation from unison to serendipity.
	- Play with the *draw_mouse* example to create a 30s floor drawing phrase.
- Document your phrase. Write a short paragraph that answers the question: How does the drawing drive the choreography?
- Upload the version of the *draw_mouse* example you used to create your 30s floor drawing.

##### Week 1 Reading : Do the reading that is most helpful to you.
- If you want to learn more about choreography: 
   - Read chapter 2 of [Viewpoints](http://www.bam.org/media/4813887/anne-bogart-and-tina-landau-the-viewpoints-book.pdf). What does a framework for movement look like? What are the parameters of choreography?
- If you need more on programming: 
   - Read chapters 1-5 of Learning Processing
   - [Watch videos](http://learningprocessing.com/videos/) for chapters 1-5

## Week 2 Pathways: Drawing on air. 
- Tech: Introduction to PCS, Kinect and Skeletons!
- Process: How to [decode code to have a conversation about it](https://github.com/mimiyin/Choreographic-Interventions/wiki/Decoding-Code).
- Code: Variables. Functions. Loops/Arrays. Libraries. 

##### Week 2 Assignment
- Play with Kinect v2 by drawing with at least 3 different joints using the *Skeleton3d_joint_by_joint* example.
   - When does the Kinect "break"?
   - Try decoding the example using [the process we practiced in class](https://github.com/mimiyin/Choreographic-Interventions/wiki/Decoding-Code). 
   - Get as far as you can, we'll go over it together in class next week!
- Try changing how the trail is being drawn. Post your sketch to our *Week 2 / Assignments* folder on Google Drive.
- Work individually. Everybody should create their own modified sketch. But by all means get together to help each other! 
 
##### Week 2 Reading: Choose what you need.
- Watch [Forsythe Technique Videos](https://www.youtube.com/user/GrandpaSafari/videos): They range from 10s to 1 minute. Very short!
   - 16 videos that start with Forsythe-Writing
   - 23 videos that starte with Forsythe-Lines
- Read chapters 7 (Functions), 6 (Loops), 9 (Arrays), 23-4 (ArrayLists) of Learning Processing
- [Watch videos](http://learningprocessing.com/videos/) for chapters 7, 6, 9

## Week 3 Pathways: Drawing on air.
- Improv: Drawing on the floor.
- Improv: Define a path in 3D in 5 ways.
- Tech: More Kinect and Skeletons
- Code: PVectors. Loops/Arrays. Functions. Conditionals.

##### Week 3 Assignment
- Combine the *draw_mouse* example with the kinect *3d_skeleton_joint_by_joint* example.
- Create a 90s duet between a drawer controlling the mouse and a dance drawing with joints.
- Document with video and [post here](https://github.com/mimiyin/Choreographic-Interventions/wiki/Assignments). Come prepared to show your work and talk about your process! [See guidelines here.](https://github.com/mimiyin/Choreographic-Interventions/wiki/Talking-About-Process)

## Week 4 Shape: Playing with shadows.
How does changing the way the body is represented, change the quality of movement?
- Improv: Playing with shadows.
- Code: Bouncing ball. Polar roses.
- Vidoes: [Fase / ROSAS](https://www.youtube.com/watch?v=RTke1tQztpQ&feature=youtu.be&t=100) | [Shadowlight](https://drive.google.com/a/nyu.edu/file/d/0B_lnhZP0dCt8T3BIVmE3bEVSb2c/view?usp=sharing)


##### Week 4 Assignment
- Experiment with shadows using a light and the Processing sketches. 
   - Modify the sketches.
   - Try projecting shadows on different planes: Floor, ceiling, side walls.
   - Come back with 3 things you learned about shadows. 
- Bring a piece of clothing that changes the shape of your body to class next week.
- Read Chapter 7 of [Dynamic Alignment](https://books.google.com/books?id=CBwV_g8DhEMC&lpg=PA2&ots=nRQ2JS3SWv&dq=dynamic%20alignment%20chapters&pg=PP1#v=onepage&q&f=false)

## Week 5 Texture: Lying on sand.
- Geography of the body.
- Improv: Ways to get to know your body.
- Improv: Dancing with suits.
- Tech: Re-drawing the Skeleton with shapes
- Code: 3d shapes. Complex shapes with vertices. Color.
- Visual imagery, why use it?
- Improv: Lie on the ground as if it is sand. Stand as if body is made of tiny bubbles.
- Technology: Kinect point cloud. OpenCV contours.
- Code: Alpha. Nested loops. Closest/Farthest point. 

##### Week 5 Assignment
- Create a representation of the human form. Meet with your group. Pick the most "versatile" one, explain why in your documentation.

##### Week 5 Reading
- Read and Watch Learning Processing ([Video](http://learningprocessing.com/videos/) + Book)
   - Chapter 2.1 on Color
- Vector Math and PVectors in Processing 
   - Read [Chapter 1 of Nature of Code](http://natureofcode.com/book/chapter-1-vectors/)
   - Watch videos 1.1 - 1.4 for [Nature of Code](https://vimeo.com/channels/natureofcode/videos)  

## Space
Points, lines and curves. Bodies as architecture. Moving in relation to architecture.
- Defining space.
- Dividing space.
- Projecting lines and planes.
- Arcs and curves.
- Meshes and webs.

## Week 6 Space: Defining space with light.
- Video Jiri Kylian | NDT : [Sweet Dreams](http://www.numeridanse.tv/en/video/1046_sweet-dreams)

##### Week 6 Assignment
- Create 3 simple studies of how to move people through space with light.
- Meet as a group and combine at least 3 of your sketches into a single structured improvisations.
- Decide how many people are in your improv and what the default movement is. (e.g. Free-style? Turning in place. Hopping.)

##### Week 6 Reading
- Read Learning Processing Chapter 14 on 3D, Translation and Rotation

##Timing + Pacing
- Rhythm v. Tempo
- Building polyrhythyms
- Dynamic pacing with [Easing](http://easings.net/) + [Zeno's Paradox](https://en.wikipedia.org/wiki/Zeno%27s_paradoxes)

#####Example in-class improvs: [Human metronomes](https://www.youtube.com/watch?v=QCp7bL-AWvw)

#####Topic Study: Build a polyrhythm.

##Sound + Text
Translating	movement	into	non-visual	media:	Sound	and	Text
- Mapping	movement to sound.
- Mapping	"gesture" to text.
- Appropriating	poetic devices for generating patterns of movement:	Meter, Repetition, Retrograde, Elision, Alliteration and	Rhyme.

#####Example improv: Shushing	walk.	Translate	a	poem	into	movement. "Write"	a	poem	with	movement.

#####Topic Study: Create a conversation between movement and sound or text.

## Project Development: Weeks 11, 12, 13

Workshop and	user-test	final	project	ideas.

## Showing: Week 14

# Course Description
Most of us are intimately familiar with interfaces where our movement serves as input to control interactive media. Less familiar are systems designed to compel us to dance, to groove, to move in new and unexpected ways.

This class explores the use of interactive media to “choreograph” in the broadest sense of the word from choreography as dance-making to choreography as crowd control. How do you get someone to soften their chest? Eat space? Change level? How do you shake the entire room? How do you orchestrate duets between strangers?

Conceived as a (re-)introduction to computational media through the lens of dance, students will practice how to apply computational thinking to the craft of choreography.

Using computer vision and a broad range of media from graphics and video, to sound and text, we will look at directing both how people move (quality of movement) as well as where they move (pathways and spatial relationships).

We will evaluate the strengths and weaknesses of the various sensing technologies available to us today. What is the delta between what we can see and feel (strength, hardness, contortion) and what a computer can see and interpret (locations, contours, velocity, acceleration)?

## Pre-requesites
The course is intended both for anyone looking to deepen their practice in working with movement-based interaction regardless of previous experience with movement technique or programming.

As a result, there is no pre-requisite for dance and no pre-requisite for code.	  		  		  		  		  		  		  		  		  
##Grading
- 40% for showing up (on time!) and participating with curiosity and enthusiasm.
- 10% for each topic study.
- 20% for the final project.
- More than 2 unexcused absences qualifies you for a failure.

