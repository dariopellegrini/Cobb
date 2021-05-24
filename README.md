<p align="center">
  <img src="https://github.com/dariopellegrini/Cobb/raw/main/CobbBanner.png" width="250px">
</p>

<p align="center"><strong>Swift dependency injection</strong></p>

# Cobb
A light Swift library to manage dependency injection easily.

## Installation

### CocoaPod
Install with [CocoaPod](https://cocoapods.org/pods/Cobb).
```
pod 'Cobb'
```

### Swift Package Manager
Install `Cobb` simply adding GitHub link to Xcode project through [Swift Package Manager](https://swift.org/package-manager).
```
https://github.com/dariopellegrini/Cobb
```

## Usage
Let's take as example a simple achitecture.
```swift

struct NetworkService {
  func login(username: String, password: String) -> User {
    ...
  }
}

struct DatabaseService {
  func insert(user: User) {
    ...
  }
}

struct Repository {
  let network: NetworkService
  let database: DatabaseService
  
  func login(username: String, password: String) -> User {
    let user = network.login(username: username, password: password)
    database.insert(user: user)
    return user
  }
}
```

Using Cobb builders it's possible to define dependencies of application's layers.
```swift
Dependencies {
  Factory { Database() }
  Factory { NetworkService() }
  Singleton { Repository(network: inject(), database: inject()) }
}.dream()
```

Then in other classes (such as `UIViewController`) or structs.
```swift
class FirstViewController: UIViewController {
  @Injected var repository: Repository
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DispatchQueue.global(qos: .utility).async {
      let user = repository.login(username: "username@domanin.com", password: "password")
      
      DispatchQueue.main.async {
        // Update UI
      }
    }
  }
}
```

`injected()` resolves automatically dependencies defined in `Dependencies` builder.  
`Factory` defines a dependency that when resolved returns a new instance.  
`Singleton` defines a dependency that behaves like a singleton, so when resolved returns the same instance through the whole application.  
`dream()` actually configures dependencies.  
`@Injected` resolves the dependency and return an instance of the specified type.

That's it!

## Author

Dario Pellegrini, pellegrini.dario.1303@gmail.com

## License

Cobb is available under the MIT license. See the LICENSE file for more info.
