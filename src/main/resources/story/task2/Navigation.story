Description: Navigation through Trello site

!-- Set precondition story
GivenStories: story/task2/SignIn.story

Scenario: Visual check for the Templates page
Meta:
    @trello
Given I am on a page with the URL 'https://trello.com/templates'
!-- Composite step
When I perform visual check for templates


Scenario: Visual check for the Notification area
Meta:
@trello
Given I am on a page with the URL 'https://trello.com'
!-- Composite step
When I perform visual check for notifications


Scenario: Visual check for the Pricing page with some elements being ignored
Meta:
@trello
Given I am on a page with the URL 'https://trello.com/pricing'
!-- Composite step
When I perform visual check for pricing


Scenario: Visual check for the Home page
Meta:
@trello
Given I am on a page with the URL 'https://trello.com/home'
When I wait until element located `By.xpath(//div[@class='container text-center pt-md-6 pb-6'])` appears
When I change context to element located `By.xpath(//div[@class='container text-center pt-md-6 pb-6'])`
When I establish baseline with `homepage`
When I refresh the page
When I wait until element located `By.xpath(//div[@class='container text-center pt-md-6 pb-6'])` appears
When I change context to element located `By.xpath(//div[@class='container text-center pt-md-6 pb-6'])`
When I compare against baseline with `homepage`


Scenario: Visual check for the Account Settings page
Meta:
@trello
Given I am on a page with the URL 'https://trello.com/sergeyzozulya3/account'
When I wait until element located `By.xpath(//div[@class='tabbed-pane-header'])` appears
When I change context to element located `By.xpath(//div[@class='tabbed-pane-header'])`
When I establish baseline with `settings`
When I refresh the page
When I wait until element located `By.xpath(//div[@class='tabbed-pane-header'])` appears
When I change context to element located `By.xpath(//div[@class='tabbed-pane-header'])`
When I compare against baseline with `settings`


Scenario: UI controls validation
Meta:
@trello
Given I am on a page with the URL 'https://trello.com/sergeyzozulya3'
When I wait until element located `By.xpath(//ul)` appears
!-- Check if every tab in the profile has links
When I initialize the SCENARIO variable `counter` with value `0`
When I execute steps while counter is not equal to '4' with increment '1' starting from '0':
|step|
|When I change context to element located `By.xpath((//li[@class='tabbed-pane-nav-item'])[#{eval(${counter} + 1)}])`|
|Then an element by the xpath '(//a[@href]//parent::li)[#{eval(${counter} + 1)}]' exists|
