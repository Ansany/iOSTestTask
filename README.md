# GoraTestTask for iOS Developer

## RU. Задание
Задание: Написать приложение, которое отображает фотографии каждого выбранного пользователя, без использования библиотек, для https://jsonplaceholder.typecode.com
Для экрана фотографий организовать кэширование картинок в пямяти, отображать индикатор загрузки для каждой фотографии. Каждая ячейка имеет тень и закругленные углы. Отображать title фотографий под изображением (кол-во строк не ограничено)

![GoraStudioTestTasksScreens](https://user-images.githubusercontent.com/68674699/149733131-8a4792ab-b9b1-450f-9d4a-7334b07a43c1.png)

## Содержание
Репозиторий содержит приложение для просмотра фотографий пользователей.
 - При входе в приложение пользователь попадает на экран со списком имен
 - При нажатии на имя из списка, пользователь попадает на экран альбомов выбранного человека
 - После выбора альбома, пользователь попадает на экран с фотографиями из конкретного альбома
 
 Что реализованно:
  - Кэширование изображений
  - Обработка ошибок при загрузке данных с интернета (с возможностью повторного запроса из алёрта)
  - Навигация по приложению
  - Индикатор загрузки данных, на всех экранах
 
 ## Что использовалось
  - Сервис данных - https://jsonplaceholder.typecode.com
  - MVP (+Router - для навигации, +Configurator - для сборки модулей)
  - Adapters - для построения TableView и разгрузки ViewController(ов)
  - UIKit, Foundation
 
 ## Структура проекта
  - Application - запуск приложения
  - Modules - экраны (UsersListViewController, AlbumsListViewController, PhotosViewController), Configurator, Router
  - Library - содержит extentions, customViews, assets и constants (в группе CustomViews находятся все кастомные ячейки для tableView всех экранов, а также CardView (тени для ячеек с фотографиями))
  - Model - модели данных (не разделённые на entity/entry)
  - Services - Сервисный слой, работа с запросами в интернет
  
  ## Как собрать проект
  Просто копировать этот репозиторий
  

  
## EN. Task
Make an application that displays photos of each selected user, without using libraries, for https://jsonplaceholder.typecode.com
For the photo screen, organize caching of images in memory, display a loading indicator for each photo. Each cell has a shadow and rounded corners. Display photo title below image (number of lines is unlimited)

## Content
The repository contains an application for viewing user photos.
 - When entering the application, the user is taken to a screen with a list of names
 - When clicking on a name from the list, the user is taken to the albums screen of the selected person
 - After selecting an album, the user is taken to a screen with photos from a specific album
 
 What has been implemented:
  - Image caching
  - Handling errors when downloading data from the Internet (with the ability to re-request from the alert)
  - App navigation
  - Data loading indicator, on all screens
 
 ## What was used
  - Data service - https://jsonplaceholder.typecode.com
  - MVP (+Router - for navigation, +Configurator - for building modules)
  - Adapters - for building TableView and unloading ViewController(s)
  - UIKit, Foundation
 
 ## Project structure
  - Application - application launch
  - Modules - screens (UsersListViewController, AlbumsListViewController, PhotosViewController), Configurator, Router
  - Library - contains extentions, customViews, assets and constants (the CustomViews group contains all custom cells for tableView of all screens, as well as CardView (shadows for cells with photos))
  - Model - data models (not divided into entity/entry)
  - Services - Service layer, working with Internet requests
  
  ## How to build a project
  Just copy this repository
