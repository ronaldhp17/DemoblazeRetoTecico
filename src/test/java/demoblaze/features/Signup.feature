    @signup
Feature: Sign up

  Background:
    Given url apiUrl

  Scenario: sign up with valid credentials
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomUsername = dataGenerator.generateRandomUsername()
    Given path 'signup'
    And request { "username": "#(randomUsername)", "password": "Test123" }
    When method post
    Then status 200

  Scenario: Sign up existing customer

    Given path 'signup'
    And request
    """
     {
    "username": "testPrueb@2",
    "password": "Test123"
    }
    """
    When method post
    Then status 200
    And match response == {"errorMessage":"This user already exist."}
    