<h1 align="center"> AWS Workshop 21 - MediaWiki</h1>

<p align="center">
  <a href="#Challenge">The challenge</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#Current Architecture">Current architecture</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  
  <a href="#Issues">Issues</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#ItemsTo BeEvaluated">Assessment</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#ProjectAdministration">Project Administration</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#Technologies">Technologies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#Contributors">Contributors</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
</p>


## 🚀 THE CHALLENGE

<p align="justify">MedicalPro is a company that sells medical and orthopedics products. According to MedicalPro's IT manager, the objective of the migration is resolve documentation platform unavailability issues and also provide greater flexibility in accessing the information on this Wiki.
</p>

## 🎲 CURRENT ARCHITECTURE
<p align="justify">The actual GLPI infrastructure consists of</p>

- Virtual machine 
    - [CentOS 7.0.1406](https://www.redhat.com/en/topics/linux/centos-linux-eol#:~:text=Why%20is%20CentOS%20Linux%20going,Red%20Hat%20Enterprise%20Linux%20releases)
    - 12 GB of RAM 
    - 02 vCPUs
- Database
    - [MariaDB 10.1](https://mariadb.org/)
    - 20 GB
- Files
    - 300 GB
- Users    
    - 210 users 

![plot](./diagrams/infrastructure.jpg)


## 🎲 IDENTIFIED ISSUES

The unavailability problem is due to the virtual machine that means the solution is low on memory and processor resources, causing the VM to crash or experience some slow periods. And the question of flexibility is because when it is necessary to do something training employees access from outside the company and in different schedules for studies and consultations of information and procedures on the Wiki.


## 📝 ASSESSSMENT
[ ] Presentation</br>
[ ] Documentation - business vision</br>
[ ] Documentation - technical details</br>
[ ] AWS Services used in the purposed Architecture</br>
[ ] Participation of group members</br>
[ ] Demo</br>

## 🔗 PROJECT ADMINISTRATION
The project was divided into activities and managed using Kanban and Discord for communication and meetings.

## 🛠 TECHNOLOGIES

- MediaWiki 1.41.0
- Terraform
- GitHub and GitHub Actions
- MariaDB
- AWS Services (Route53, Load Balancing, AutoScaling, ECS Fargate, ...)

## ✅ CONTRIBUTORS

<table style="width:100%">
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/victor-cleber/?locale=en_US"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/13708226?v=4" width="100px;" alt=""/><br /><sub><b>Victor Cleber</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Henrique-1969"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/186761926?v=4" width="100px;" alt=""/><br /><sub><b>Henrique Barros</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Gutocol"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/186768118?v=4" width="100px;" alt=""/><br /><sub><b>Augusto Colombo </b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/sergiofuzimoto"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/113111759?v=4" width="100px;" alt=""/><br /><sub><b>Sergio Fuzimoto</b></sub></a><br /></td>
  </tr>  
</table>