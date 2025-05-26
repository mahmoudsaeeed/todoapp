# todo2

## TODO app
this is my trying to create todo app using many packages like
  - dependency injection
    - GetIt
  - manage statement
    - bloc [cubit]
    - provider
and also create light and dark theme modes,

### project Archetcture

  =================================
  lib
  |_ core
  |  |_ depenency injection
  |  |_ bloc observer
  |  |_ theme folder
  |  |_ constants
  |  |_ routes
  |
  |_ presentation [global]
  |  |_ screens
  |  |_ shared widgets
  |
  |_ features
  |  |_ category part
  |  |  |_ data
  |  |  |  |_ Category Data Source
  |  |  |  |_ Categry Model
  |  |  |  |_ Category Repo
  |  |  |_ Presenter
  |  |  |  |_ viewModel
  |  |  |  |  |_ controllers [cubits]
  |  |  |  |_ view
  |  |  |  |  |_ Category widgets