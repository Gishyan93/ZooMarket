/* 
  Readme.md
  ZooMarket

  Created by Tigran Gishyan on 28.06.22.
  
*/

# Usage

## Module

A module is a minimal group of entities(classes, structs etc.) which can exist independently. 
Every module of this application consists from:
- Coordinator
- Factory
- Repository
- Controller

### Coordinator

The *main* role of coordinator is to navigate from one scene to another. Coordinator holds the current scene's state. One Coordinator should also be able to *communicate* with another Coordinator via delegation if needed. 

### Factory

The role of Factory is to create all dependencies for existance of the *module* and **inject** it where it is needed.

### Repository

Purpose of Repository is to do CRUD(Create, Read, Update, Delete) operations. Repository can interact both with different ***services or local storages***. From the outside of Repository it is irrelevant from where the data is retreived. 

### Controller

Controller's main role is to navigates through view states. Controller *communicates* with Repository, getting data and transforms it to the view's current state. 

