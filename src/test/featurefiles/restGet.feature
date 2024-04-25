Feature: To validate different types of web API get urls

  Scenario: To validate google url
    Given url 'https://www.google.com/'
    When method Get
    Then status 200
    And match responseType == 'string'
    And assert responseTime < 2000
    And print response
    Then match karate.toString(response) contains "<title>Google</title>"


  Scenario: To validate reqres url
    Given url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And match responseType == 'json'
    And assert responseTime < 2000
    And print response
    And match response.data[0].first_name != null
    And match response.data[0].first_name == "Michael"
    And assert response.per_page == 6
    And assert response.page == 2
    And assert response.data[1].id == 8
    And match response.data[*].id contains [7,8,9,10,11,12]
    And match response.data[*].first_name contains ['Michael','Lindsay','Tobias','Byron']
    And def first_name = response.data[3].first_name
    And print first_name
   # And match response.data[*].id !contains 7
