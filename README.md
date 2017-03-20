# Plant Spirit App

Plant Spirit App is a meditation app, which recommends plant species to meditate with depending on how you are feeling. Data is collected by [Béthany](oluminousbeing.com), the only administrator (aside from the developer).

[Click here for the Live Demo](http://comfortcat.xyz/plant-spirit-demo/)! Or [click here for the front-end repo](https://github.com/catquarks/plant-spirit-app), which is written in React + Redux.

This is the administrative side of Plant Spirit App. It allows the admin to input new data and images, and serves data to the front-end. It is built with Rails 5, and its test suite uses Rspec and Capybara.

Only logged-in administrators may have access to this app, but you may look at the [JSON](http://plant-spirit-app.herokuapp.com/api/v1/plants) here.

This app uses two main models: Plants and Feelings. A Plant and Feeling can only be associated with each other as an Encouraging Plant and Future Feeling, or as a Current Feeling and Easing Plant. Encouraging Plants encourage Future Feelings (e.g. lavender encourages calmness), and Easing Plants ease Current Feelings (e.g. lavender eases insomnia).


# To Do:
* Pass PlantController tests
* Bug fix: user can't remove feelings on plant edit page
* Write & Pass FeelingController tests
