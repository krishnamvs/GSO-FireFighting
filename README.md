“Swarm” behaviour is displayed by many creatures in nature, that is, many single
creatures coming together to create some emergent behaviour, based solely on simple
actions taken by the individual members of the swarm.

There have been several suggestions for the purposes of swarming behaviour in different
species. The most common of these is as a form of defence, with many proposals as to
how the behaviour achieves this and other advantages of swarming have been observed,
for example in discovery of food sources. Due to this obvious success in the observations,
those involved in robotics have attempted to replicate natural examples to create “swarm
intelligent” systems. The idea is that many small, cheap, disposable robots can work as
one to achieve some goal by following simple behaviours.

Firefighting are executed mainly by human firefighters having to get very close to the
actual fire, this presents many lethal risks from burns, smoke inhalations and other
hazards. Also coupled with the loss of civilian life, loss of property is plenty especially
with regard to fire caused by hazardous substances. Natural Swarm Systems which are a
benchmark in efficiency and management can be used to implement system that can fight
such fires.

The main intention of this project is to understand swarm control algorithms, develop a
modified version of the same for cooperative firefighting and interface them with real
robots to collectively fight fires.

This system is focused on using a swarm of robots to assist each other in extinguishing
fire in areas such as industrial ware houses or highly inflammable areas like ammunition
depots, fire crackers industries, petrochemicals industries and others.

Each individual robot plans its formation based on simple algorithm. When the robots are
able to perform high level cooperative actions such as collaborative localization and
coordinated navigation they will function as best they can in achieving the objective of
fighting fires and can also provide assistance by giving the firefighter feedback from the
robot’s sensors for additional backup. They can also provide backup for other robots in
the swarm should the need arise.

GSO is originally developed for numerical optimization problems that involve computing
multiple optima of multimodal functions, as against other swarm intelligence algorithms
which aim to identify the global optimum. The algorithm also prescribes decentralized
decision-making and movement protocols useful for swarm robotics applications.
For instance, a robot swarm can use GSO to carry out disaster response tasks comprising
search for multiple unknown signal sources; examples of such sources include nuclear
spills, hazardous chemical spills, leaks in pressurized systems and fire-origins in forest
fires. It has been recognized that GSO’s approach of explicitly addressing the issue of
partitioning a swarm required by multiple source localization is very effective.

System

Map
- Add Image Link 

Results
Since Our System is capable of handling up to 3 fire locations we have shown all the cases. 
Case 1 – Three Fire Locations 
Commands Given
Enter the Initial Position of Robot1 :-1
Enter the Orientation of Robot1 :-90
Enter the Initial Position of Robot2 :-10
Enter the Orientation of Robot2 :-0
Enter the Initial Position of Robot3 :-100
Enter the Orientation of Robot3 :-0
Do you want to enter information about fire position? [y,n] :- 'y'
Enter the Number of Fire Locations in the System :- 3
Enter the Location of Fire1 :-41
Enter the Location of Fire2 :-39
Enter the Location of Fire3 :-91
Status of Map
- Add Image Link 
Map after the Positions of the Robots are given.
- Add Image Link  
Map when the Robots have just reached their respective fire locations (Case 1)
- Add Image Link 
Path taken by Robots to reach Initial Positions after fire extinguished (Case 1)
- Add Image Link 

Case 2 – Two Fire Locations
Commands Given
Do you want to enter information about fire position? [y,n] :- 'y'
Enter the Number of Fire Locations in the System :- 2
Enter the Location of Fire1 :- 45
Enter the Location of Fire2 :- 65
Status of Map
- Add Image Link  
Map when the Robots have just reached their respective fire locations (Case 2)
- Add Image Link 
Path taken by Robots to reach Initial Positions after fire extinguished (Case 2)
- Add Image Link 

Case 3 – One Fire Location
Commands Given
Do you want to enter information about fire position? [y,n] :- 'y'
Enter the Number of Fire Locations in the System :- 1
Enter the Location of Fire1 :-73
Status of Map
- Add Image Link 
Map when the Robots have just reached their respective fire locations (Case 3)
- Add Image Link 
Path taken by Robots to reach Initial Positions after fire extinguished (Case 3)
- Add Image Link 

In the above 3 cases we have recorded the following response time for reaching the fire location. We are taking simulation times into account as real response time also takes in factors such as battery of the robot, network delay, time taken to for the robot to turn/ move one unit, etc.

Case	                Response Time in seconds
Three Fire Locations	14.284549
Two Fire Locations	  12.284793
One Fire Location	    11.234535

The algorithm is performing as expected. It is able to handle multiple fire locations using the swarm of robots. It directs the nearest robot to the nearest fire location. 
Also, we have to note that the Response Time of the System is completely flexible as multiple factors contribute toward it such as:
•	Number of Robots in the System
•	Area of the Indoor Environment/Warehouse
•	Length of the Grid Location

Issues with the Robots
•	Uneven thickness of rubber tires on the wheels, Load balancing and wheel alignment issues are causing the robot not to move forward properly.
•	Servo motor malfunctions when the submersible pump is switched on.
•	Small Buffer size of the NodeMCU causes only a maximum of 3 calls to be made to the robot in a span of 3 seconds.
•	When the Arduino Board is powered up the Bootloader loads the program into the memory. However, while this happens all the pins are made high due to which the motor is activated.
