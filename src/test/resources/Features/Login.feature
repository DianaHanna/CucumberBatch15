Feature: Login Functionalities

  @smoke
  Scenario: Valid Admin Login
    #Given open the browser and launch HRMS application
    When user enters valid email and valid password
    And click on login button
    Then user is logged in successfully into the application
    #And Close the browser

  @smoke2
  Scenario: Valid Admin Login
    #Given open the browser and launch HRMS application
    When user enters valid "ADMIN" and valid "Hum@nhrm123"
    And click on login button
    Then user is logged in successfully into the application
    #And Close the browser

    #HOOKS: For defining pre and post steps in any Cucumber Framework
   #      : This is always created inside StepDefinition folder
   #     : This class cannot be inherited
  #      : Hooks will take care of pre and post conditions irrespective
  #      : of what goes in between the test steps

  #Background keyword: it's the clubbing of common steps in different scenarios of a feature file till flow is not broken
  # 1. Hard code
  # 2. Config file
  # Cucumber itself provides multiple option through which we can feed data from feature file into StepDefinition
  # 3. Regular Expressions
  # put the data in double quotes [""]
   #4. Scenario Outline
       # Provides you an alternative to Data driven testing
       # Also supports parametrization
  #===================================PARAMETERIZATION================================
  # Executing the same test case with multiple data

  @scenarioOutline
    #Parameterization / Data Driven
  Scenario Outline:
    #Given open the browser and launch HRMS application
    When user enters valid "<username>" and valid "<password>"
    And click on login button
    Then user is logged in successfully into the application
    #And Close the browser
  Examples:
    | username | password    |
    | admin    | Hum@nhrm123 |
    | ADMIN    | Hum@nhrm123 |
    | Jason    | Hum@nhrm123 |


    #data Table
  @dataTable
  Scenario: Login with multiple credentials using data table
    When user enters username and password and verifies login
      | username | password    |
      | admin    | Hum@nhrm123 |
      | ADMIN    | Hum@nhrm123 |
      | Jason    | Hum@nhrm123 |

    #hard Code
    # config file

    #Cucumber Expression [ limited set of test data]
    #Scenario Outline    [Parametrization],[Data Driven Testing][Browser will open and close number of times we have test data in Examples table]
    #data Table

    # Page Object Model : An object Repository [ It stores or holds all the webElements specific to a particular page]