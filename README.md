Das Quadrat
===========

Das Quadrat is Foursquare API wrapper written in Swift.


###Features

+ Supports iOS and OSX.
+ Covers all API endpoints.
+ Authorization process implemented for both platforms.
+ Native authorization on iOS.
+ Image downloader/uploader.
+ Image cache.



###Installation

#####As Embedded framework

1. Add Das Quadrat as a submodule.
	`git submodule add git@github.com:Constantine-Fry/das-quadrat.git`
2. Drag-and-drop `Quadrat.xcodeproj` into your project. The project has two targets: Quadrat.framework for OSX project, QuadratTouch.framework for iOS projects. 
3. Add new target in "Build Phases" -> "Target Dependencies".
4. Click the `+` button at the top left of the panel and choose "New copy files phase".
  * Rename the new phase to "Copy Frameworks".
  * Set the "Destination" to "Frameworks".
5. Add Quadrat framework to this phase.
6. Here is the [image](https://cloud.githubusercontent.com/assets/239692/5367193/367f8640-7ffa-11e4-8b9b-88cef33bcd79.png) to visualise the result.

#####As Source code
+ Yet to be written.

###Usage

#####Setup session

```swift
let client = Client(clientID:       "FOO.................FOO",
   					clientSecret:   "BAR.................BAR",
    				redirectURL:    "testapp123://foursquare")
var configuration = Configuration(client:client)
Session.setupSharedSessionWithConfiguration(configuration)

let session = Session.sharedSession()
```

#####Make request

```swift
var parameters = [Parameter.query:"Burgers"]
parameters += self.location.parameters()
let searchTask = session.venues.search(parameters) {
    (result) -> Void in
    if let response = result.response {
		self.venues = response["venues"] as [JSONParameters]?
		self.tableView.reloadData()
    }
}
searchTask.start()
```



###Requirements

iOS 7.0+ / Mac OS X 10.9+

===========
Bonn, December 2014.
