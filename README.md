<div align="center"> 

![Asset 4](https://user-images.githubusercontent.com/108088961/219438381-d265b1e5-ad93-4eda-9d5e-54bc35fa5d6a.png)  
</div>

here will live the general description of our application. 

:earth_americas: [Homepage](#homepage)
<br>
:earth_americas: [Endpoints](#endpoints)
<br>
:earth_americas: [DB Schema](#db-schema)
<br>
:earth_americas: [Learning Goals](#learning-goals)
<br>
:earth_americas: [Contributors](#contributors)
<br>
### Homepage 
[Take Me Home!](https://github.com/DiscoverIt-2208)

### Endpoint + GraphQL JSON Contract(Queries, Mutations, etc.)
`https://discover-it.herokuapp.com/graphql'
#### Queries
  * User:
    ```
    user(id:) {
      id: Integer
      name: String
      email: String
      password: String
      favorites: [
        FavoriteType
      ]
      created_at
      updated_at
    }
    ```
  * Favorite 
      ```
      favorite (id:) {
    }
      ```
  * Fetch Places 
      ```
      places (city: String, country: String, categories: [String], page: Integer, radius: Integer) {
        name: String
        address: String
        placeId: String
        categories: [
         String
        ]
        city: String
        country: String
        lat: Float
        lon: Float
        imageData: {name: String, photo_reference: String} or {error_message: String}
      }
      ```
      
### DB Schema
![image](https://user-images.githubusercontent.com/105073232/217670746-aa1f1e46-625a-480d-a246-a539dbb20624.png)
<br> 

### Learning Goals
- Above 80% test coverage
- Create a Backend API using [GraphQL](https://www.apollographql.com/blog/community/backend/using-graphql-with-ruby-on-rails/)
### Contributors

<table>
  <tr>
    <th>Jennifer Yacoubian</th>
    <th>Astrid Hecht</th>
    <th>Dani Bagley</th>
    <th>Ian McIntosh</th>
    <th>Lucas Colwell</th>
    <th>Mostafa Sakr</th>
    <th>Ashley Turner</th>
    <th>Ty Keating<br>(Project Mentor)</th>
    <th>Leta<br>(Project Manager)</th>
  </tr>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/106957849?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/106942456?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108088961?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/106535343?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/98673086?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/110377741?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/105073232?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/5234142?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/22563791?v=4"></td>
    
  </tr>
 
  <tr>
    <td>
       <a href="https://github.com/jmyacobn" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/jennifer-yacoubian/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
    <td>
       <a href="https://github.com/Astrid-Hecht" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/astrid-hecht/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
    <td>
      <a href="https://github.com/daniabee"  rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
        </a><br>
      <a href="https://www.linkedin.com/in/dani-bagley-798463116/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
        </a>
    </td>
    <td>
      <a href="https://github.com/grainymac" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
        </a><br>
      <a href="https://www.linkedin.com/in/ianmac87/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
        </a>
    </td>
    <td>
      <a href="https://github.com/lcole37"  rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
        </a><br>
      <a href="https://www.linkedin.com/in/lucas-colwell-b3a753179/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
        </a>
    </td>
    <td>
      <a href="https://github.com/msakr21" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
        </a><br>
      <a href="https://www.linkedin.com/in/mostafa-sakr-4bb722250/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
        </a>
    </td>
    <td>
      <a href="https://github.com/ashuhleyt" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
            </a><br>
            <a href="https://www.linkedin.com/in/ashuhleyt/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn                                                         
        </a><br>
        </td>
    <td>
       <a href="https://github.com/bontgoy" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/tyler-keating" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
    <td>
       <a href="https://github.com/letakeane" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/letakeane" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
  </tr>
</table>
