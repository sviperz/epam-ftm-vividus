Description: Sign In

Scenario: Open trello.com main page
Meta:
    @trello
Given I am on the main application page


Scenario: Login existing user using examples tables
Meta:
    @trello
!-- Composite step
When I log in with my <email> and <password>
Then number of elements found by `By.xpath(//span[@data-test-id='home-team-tab-name'])` is greater than `0`
Examples:
|email                        |password|
|sviperz+ftm.vividus@gmail.com|password|
