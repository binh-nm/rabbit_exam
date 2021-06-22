Feature: Order Pizza

  Background:

    * url 'https://order-pizza-api.herokuapp.com/api/'

  Scenario: Get All Pizza

    Given path 'orders'
    When method GET
    Then status 200

  Scenario: Order Pizza & Delete Order

    # CREATE ORDER
    # Access Token & Table_No is taken from PizzaToken.feature file via karate-config.js
    * header Authorization = 'Bearer ' + token
    Given path 'orders'
    And request
    """
        {
          "Crust": "NORMAL",
          "Flavor": "BEEF-NORMAL",
          "Size": "M",
          "Table_No": #(table)
        }
    """
    When method POST
    Then status 201
    * def orderId = response.Order_ID

    # DELETE THE CREATED ORDER
    Given path 'orders/' + orderId
    When method DELETE
    Then status 200
    And match response.message == 'Order deleted'

