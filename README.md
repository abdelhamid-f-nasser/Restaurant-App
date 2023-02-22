# Restaurant Application

Flutter Cupertino food application using firebase and clean architecture.

## Screenshots
<table>
  <tr>
    <td><img src="https://i.imgur.com/mEFc6YP.png" height=350></td>
    <td><img src="https://i.imgur.com/qSoxSht.png" height=350></td>
    <td><img src="https://i.imgur.com/JDOeWys.png" height=350></td>
    <td><img src="https://i.imgur.com/flU2vRu.png" height=350></td>
    <td><img src="https://i.imgur.com/jSaQQ2W.png" height=350></td>
  </tr>
  <tr>
    <td>Food Search Page</td>
     <td>Favourite page</td>
     <td>Item details page</td>
     <td>Cart page</td>
     <td>Checkout page</td>
  </tr>
 </table>

## Future Steps:
- Domain and Data Mappers should be separated to Mapper Classes
- Firebase conversions should be separated to Converters classes
- Cache the data
- Use firebase auth for login
- Favourite should show data only for logged in user
- Enable guests visits; to enable guests to view the application without requiring them to log in
- Add DAOs layer for fireStore
- Separate layers into separate modules
- Separate navigation to a separate module / classes


## Features to be added:
- OnBoarding
- Login and User Authentication
- Enable Guests Login
- Add favourite Icon toggle (shows state of favourite in item details)
- Add notices for actions
- Group items by count
- !! decrement item from count or remove !!
