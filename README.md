# FetchTakehomeAssessment
### Summary: Include screen shots or a video of your app highlighting its features

EmptyView:
![Simulator Screenshot - iPhone 15 Pro - 2025-01-12 at 21 08 44](https://github.com/user-attachments/assets/d618afdf-06de-47d8-9f28-431561030554)

ErrorView:
![Simulator Screenshot - iPhone 15 Pro - 2025-01-12 at 21 28 13](https://github.com/user-attachments/assets/deb1a3a7-bcaf-47e3-bc47-7b4a3d1454f4)

NormalView:
![Simulator Screenshot - iPhone 15 Pro - 2025-01-12 at 21 29 36](https://github.com/user-attachments/assets/c2cd5885-6b6f-4a66-8b4a-e3f55731e7b8)

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I prioritized the user experience of the app as I think it is important to make sure that a user likes using the app. I did this by making sure the app looks nice and is user friendly. I also included the ability to click on the links to take the users to the source website or the youtube video.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
Approximately 3 hours:
    60 mins views (Content, Recipe + Empty)
    30 mins viewModels (Content + Recipe)
    30 mins APIResult + APIService
    30 mins custom image cache AsyncImageCache
    30 mins on unit tests + unit test helpers

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I decided to use just a dictionary in my image caching instead of NSCache. This is because while NSCache would auto delete its contents if the device was running out of memory, I decided it wasn't needed for this project and as it is originally designed for UIKit, it would require a lot of unnecessary casting.


### Weakest Part of the Project: What do you think is the weakest part of your project?
The weakest part of this project is the unit testing. Due to my time line constraints regarding my H1-b transfer deadline, I wanted to be able to get this assessment in quickly. Thus, my unit testing is not as robust as I would like nor usually push as production-ready code.


### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
