# Plant Spirit App

Plant Spirit App is a meditation app, which recommends plant species to meditate with depending on how you are feeling. Data is collected by [Béthany](oluminousbeing.com), the only administrator (aside from the developer).

This is the administrative side of Plant Spirit App, and is built with Rails 5. It allows the admin to input new data and images, and serves data to the front-end.

This app uses two main models: Plants and Feelings. A Plant and Feeling can only be associated with each other as an Encouraging Plant and Future Feeling, or as a Current Feeling and Easing Plant.

No live link is provided because only logged-in users may have access. This repository only exists for potential employers to look at my code. :)

Please stay tuned for the front-end live link and repository! The front-end is being written in React + Redux.

# To Do:
* Pass PlantController tests
* Bug fix: user can't remove feelings on plant edit page
* Write & Pass FeelingController tests
