# CREDITS  
## This project work titled “FIGHTING FIRES USING SWARM CONTROL ALGORITHMS” was carried out by [M S LALITHA RAMYA ](https://github.com/lalitharamya9), [MADALA VENKATA SIVA KRISHNA](https://github.com/krishnamvs), [MALLAPPA KOUJALAGI ](mmkoujalagi03@gmail.com) and [NIDHI V](nidhitantri@gmail.com), bonafide students of Ramaiah Institute of Technology, Bangalore, in partial fulfilment for the award of degree of Bachelor of Engineering in Electronics and Communication of Visvesvaraya Technological University, Belgaum, during the year 2017-18.  
## This Project was pursued Under the Guidance of [Dr. Reshma Verma](reshmaverma@msrit.edu), Assistant Professor, Department of Electronics and Communication Engineering, RAMAIAH INSTITUTE OF TECHNOLOGY
# **Introduction**  
“Swarm” behaviour is displayed by many creatures in nature, that is, many single creatures coming together to create some emergent behaviour, based solely on simple actions taken by the individual members of the swarm.

There have been several suggestions for the purposes of swarming behaviour in different species. The most common of these is as a form of defence, with many proposals as to how the behaviour achieves this and other advantages of swarming have been observed, for example in discovery of food sources. Due to this obvious success in the observations, those involved in robotics have attempted to replicate natural examples to create “swarm intelligent” systems. The idea is that many small, cheap, disposable robots can work as one to achieve some goal by following simple behaviours.

Firefighting are executed mainly by human firefighters having to get very close to the actual fire, this presents many lethal risks from burns, smoke inhalations and other hazards. Also coupled with the loss of civilian life, loss of property is plenty especially with regard to fire caused by hazardous substances. Natural Swarm Systems which are a benchmark in efficiency and management can be used to implement system that can fight such fires.

The main intention of this project is to understand swarm control algorithms, develop a modified version of the same for cooperative firefighting and interface them with real robots to collectively fight fires.

This system is focused on using a swarm of robots to assist each other in extinguishing fire in areas such as industrial ware houses or highly inflammable areas like ammunition depots, fire crackers industries, petrochemicals industries and others.

Each individual robot plans its formation based on simple algorithm. When the robots are able to perform high level cooperative actions such as collaborative localization and coordinated navigation they will function as best they can in achieving the objective of fighting fires and can also provide assistance by giving the firefighter feedback from the robot’s sensors for additional backup. They can also provide backup for other robots in the swarm should the need arise.

GSO is originally developed for numerical optimization problems that involve computing multiple optima of multimodal functions, as against other swarm intelligence algorithms which aim to identify the global optimum. The algorithm also prescribes decentralized decision-making and movement protocols useful for swarm robotics applications. For instance, a robot swarm can use GSO to carry out disaster response tasks comprising search for multiple unknown signal sources; examples of such sources include nuclear spills, hazardous chemical spills, leaks in pressurized systems and fire-origins in forest fires. It has been recognized that GSO’s approach of explicitly addressing the issue of partitioning a swarm required by multiple source localization is very effective.

# **Proposed System**

  The method proposed is that the swarm of robots will receive movement commands from the Central Server while the robots send back environment data, fire sensing data when requested by the Central Server. The Central Server holds the Control Algorithm which has complete situational awareness and can automatically take routing decisions for the robots based on the changes in the environment.  

  ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/SystemOverview.PNG?raw=true)  

  ## **Advantages of the proposed method:**  
  •	Scalability – The ability to add robots to the system without the need for any fundamental changes.  
  •	Robustness – The ability to operate the system efficiently even when some of the robots are offline.  
  •	Ability of the system to fight fires over a broad range of temperature without any changes to the configuration.  
  •	Ability of the system to fight fire in multiple locations.  
  •	Fast Response Time of the System when compared to conventional methods.  
  •	Targeted Fire Fighting Ability instead of Scorched Earth approach.  
  •	Swarm-based algorithms have recently emerged as a family of nature-inspired, population-based algorithms that are capable of producing low cost, fast, and robust solutions to several complex problems.  
  •	No human intervention is necessary.  
  •	If required in dire situations, they can also provide assistance by giving the firefighter feedback from the robot’s sensors for additional backup.  

  ## **Robot**  
  The Robot consists of an Arduino Mega 2560 microcontroller which uses a NodeMCU as a Wi-Fi shield to connect to the Wi-Fi Network. The Fire Sensing function of the Robot is done by the Flame Sensor place in front of the Robot. The Obstacle Detection function of the Robot is done by Ultrasonic Sensors placed in the front, left, right of the Robot. The Motors are controlled using a L293D Motor Driver. The Robot has to make perfect 90 degree turns and this is ensured by a turn control system consisting of Magnetometer and Servo meter is used.  

  ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/RobotOverview.PNG?raw=true)  

# **Map**

  ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/Map.png?raw=true)  
  ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/MapIndex.PNG?raw=true)  

# **Results**

  Since Our System is capable of handling up to 3 fire locations we have shown all the cases.  
  
  ## **Case 1 – Three Fire Locations**    
  ```
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
  ```
  **Status of Map**  
    •	Map after the Positions of the Robots are given.  
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/InitialPos.png?raw=true)  
    •	Map when the Robots have just reached their respective fire locations (Case 1)  
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/3_AtFirePos.png?raw=true)  
    •	Path taken by Robots to reach Initial Positions after fire extinguished (Case 1)  
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/3_BackToInitialPos.png?raw=true)  

  ## **Case 2 – Two Fire Locations**  
  ```
  Do you want to enter information about fire position? [y,n] :- 'y'
  Enter the Number of Fire Locations in the System :- 2
  Enter the Location of Fire1 :- 45
  Enter the Location of Fire2 :- 65
  ```
  **Status of Map**  
    •	Map when the Robots have just reached their respective fire locations (Case 2)  
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/2_AtFirePos.png?raw=true)  
    •	Path taken by Robots to reach Initial Positions after fire extinguished (Case 2)  
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/2_BackToInitialPos.png?raw=true)  

  ## **Case 3 – One Fire Location**  
  ```
  Do you want to enter information about fire position? [y,n] :- 'y'
  Enter the Number of Fire Locations in the System :- 1
  Enter the Location of Fire1 :-73
  ```
  **Status of Map**  
    •	Map when the Robots have just reached their respective fire locations (Case 3)
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/1_AtFirePos.png?raw=true)  
    •	Path taken by Robots to reach Initial Positions after fire extinguished (Case 3)
    ![alt text](https://github.com/krishnamvs/GSO-FireFighting/blob/master/Images/1_BackToInitialPos.png?raw=true)  

  In the above 3 cases we have recorded the following response time for reaching the fire location. We are taking simulation times into account as real response time also takes in factors such as battery of the robot, network delay, time taken to for the robot to turn/ move one unit, etc.

  | Case  | Response Time in seconds |
  | ------------- | ------------- |
  | Three Fire Locations  | 14.284549  |
  | Two Fire Locations  | 12.284793  |
  | One Fire Location  | 11.234535 |

  **The algorithm is performing as expected. It is able to handle multiple fire locations using the swarm of robots. It directs the nearest robot to the nearest fire location. 
  Also, we have to note that the Response Time of the System is completely flexible as multiple factors contribute toward it such as:  
    •	Number of Robots in the System  
    •	Area of the Indoor Environment/Warehouse  
    •	Length of the Grid Location**  

  **Issues with the Robots**  
    •	Uneven thickness of rubber tires on the wheels, Load balancing and wheel alignment issues are causing the robot not to move forward properly.  
    •	Servo motor malfunctions when the submersible pump is switched on.  
    •	Small Buffer size of the NodeMCU causes only a maximum of 3 calls to be made to the robot in a span of 3 seconds.  
    •	When the Arduino Board is powered up the Bootloader loads the program into the memory. However, while this happens all the pins are made high due to which the motor is activated.
