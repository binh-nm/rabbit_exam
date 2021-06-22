Feature: Get Access Token

  Background:

    * url 'https://order-pizza-api.herokuapp.com/api/'

  Scenario: Get Token

    # GET TOKEN
    Given path 'auth'
    And request
    """
      {
        "password": "test",
        "username": "test"
      }
    """
    When method POST
    Then status 200
    * def token = response.access_token

    # Generate random number

    * def random = function(max){ return Math.floor(Math.random() * max) }
    * def table = random(999)