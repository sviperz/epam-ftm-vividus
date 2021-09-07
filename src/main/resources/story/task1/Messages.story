Description: Go to messages and delete the message from Inbox

Scenario: Open reddit.com main page
Meta:
   @reddit
Given I am on a page with the URL 'https://www.reddit.com/'

Scenario: Log in to account
Meta:
   @reddit
When I click on element located `By.xpath(//a[text()='Log In'])`
When I switch to frame located `By.xpath(//iframe[contains(@src,'sso_login')])`
When I enter `${username}` in field located `By.xpath(//input[@id='loginUsername'])`
When I enter `${password}` in field located `By.xpath(//input[@id='loginPassword'])`
When I click on a button with the name 'Log In'
Then number of elements found by `By.xpath(//span[text()='FTMVividus'])` is greater than `0`

Scenario: Delete the message from Inbox
Meta:
   @reddit
When I click on element located `By.xpath(//i[contains(@class, 'icon-home_fill')])`
When I click on element located `By.xpath(//a[@id='focus-Inbox'])`
Then the page with the URL 'https://www.reddit.com/message/inbox/' is loaded

When I change context to element located `By.xpath(//div[@id='thing_t4_14l2bmy'])`
When I click on element located `By.xpath(//a[@data-event-action='delete_message'])`
When I click on element located `By.xpath(//a[contains(@onclick, 'del_msg')])`
When I refresh the page
Then element located 'By.xpath(//span[text()='Test message'])' disappears in '2'
