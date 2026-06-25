    @login
Feature: Login Feature

  Background:
    Given url apiUrl
    
  Scenario: Login with valid credentials
    Given path 'login'
    And request 
    """
      {
    "username": "#(userName)",
    "password": "#(password)"
    }
    """
    When method post
    Then status 200
    And match response contains "Auth_token:"

  Scenario Outline: Login with invalid credentials
    Given path 'login'
    And request 
    """
      { 
      "username": <userName>, 
      "password": <password> 
      }
    """
    When method post
    Then status 200
    And match response == <errorMessage> 
    Examples:
      |userName             |password      |errorMessage                           |
      |"#(userName)"        |"Test1234543" |{"errorMessage":"Wrong password."}     |
      |"testPrueb@13123123" |"#(password)" |{"errorMessage":"User does not exist."}|
      |"testPrueb@13123123" |"Test1234543" |{"errorMessage":"User does not exist."}|

