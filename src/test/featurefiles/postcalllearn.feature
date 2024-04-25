Feature: recres POST call validation

  Background:
    * def serviceURL = 'https://reqres.in/api/users'
    * def serviceURLGET = 'https://reqres.in/api/usersXXXXCCCAAA'
    #* def seriveURL = 'https://www.w3schools.com/xml/tempconvert.asmx'
    #above assignment to be completed


    Scenario: Do a job post call with static data
        Given url serviceURL
      * def jsonBodyjob =
        """
        {
          "name": "Bangalore",
          "job": "API Test Automation"
        }
        """
        When request {"name": "Bangalore","job": "API Test Automation"}
        And method post
        Then status 201
        And match responseType == 'json'
        And print 'Respose is; ', response
        And response.name == 'Bangalore'
        And response.job == 'API Test Automation'
        And response.createAT != null

  Scenario Outline: Do a job post call with dynamic data
    Given url serviceURL
    * def jsonBodyjob =
      """
      {
        "name": '<name>',
        "job": '<job>'
      }
      """
    When request {"name": "Bangalore","job": "API Test Automation"}
    And method post
    Then status 201
    And match responseType == 'json'
    And print 'Respose is; ', response
    And response.name == '<name>'
    And response.job == '<job>'
    And response.createAT != null

    Examples:
      |name|job|
      |Hyderabs|core job|
      |Chennai|Filem job|
      |Bangalore|IT job|
      |Calcutta|Automaiton job|
      |Dubai|Hospital job|


  Scenario Outline: with Java fun do post call
    Given url serviceURL
    * def javafileobj = Java.type('support.readjavafun')
    * def requestjsonbody = javafileobj.create_json_body_for_job_call('<name>','<job>')
    When request {"name": "Bangalore","job": "API Test Automation"}
    And method post
    Then status 201
    And match responseType == 'json'
    And print 'Respose is; ', response
    And response.name == '<name>'
    And response.job == '<job>'
    And response.createAT != null

    Examples:
      |name|job|
      |Hyderabs|core job|
      |Chennai|Filem job|
      |Bangalore|IT job|
      |Calcutta|Automaiton job|
      |Dubai|Hospital job|

  Scenario Outline: with Java fun get data from excel
    Given url serviceURL
    * def javafileobj = Java.type('support.readjavafun')
    * def name = javafileobj.create_json_body_for_job_call('<Testname>','name')
    * def job = javafileobj.create_json_body_for_job_call('<Testname>','job')
    * def actulajsonbody = javafileobj.create_json_body_for_job_call(name,job)
    When request {"name": "Bangalore","job": "API Test Automation"}
    And method post
    Then status 201
    And match responseType == 'json'
    And print 'Respose is; ', response
    And response.name == '<name>'
    And response.job == '<job>'
    And response.createAT != null

    Examples:
      |Testname|
      |TC001|
      |TC002|
      |TC003|
      |TC004|
      |TC005|