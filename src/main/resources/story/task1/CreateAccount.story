Description: Create account

Scenario: Open reddit.com main page
Meta:
    @reddit
Given I am on a page with the URL 'https://www.reddit.com/'


Scenario: Create valid user account
Meta:
    @reddit
When I click on element located `By.xpath(//a[text()='Sign Up'])`
When I switch to frame located `By.xpath(//iframe[contains(@src,'actionSource')])`
When I enter `${email}` in field located `By.xpath(//input[@id='regEmail'])`
When I click on a button with the name 'Continue'
When I enter `${username}` in field located `By.xpath(//input[@id='regUsername'])`
When I enter `${password}` in field located `By.xpath(//input[@id='regPassword'])`
!-- Pretend we are a human to pass the CAPTCHA
When I check checkbox located by `By.xpath(//div[@class='recaptcha-checkbox-border'])`
When I click on a button with the name 'Sign Up'
Then the text 'Find communities by topics you're interested in.' exists

When I click on a button with the name 'Finish'
Then number of elements found by `By.xpath(//span[text()='FTMVividus'])` is greater than `0`


Scenario: Create account using invalid email
Meta:
    @reddit
Given I am on a page with the URL 'https://www.reddit.com/'
When I click on element located `By.xpath(//a[text()='Sign Up'])`
When I switch to frame located `By.xpath(//iframe[contains(@src,'actionSource')])`
When I enter `invalid.email` in field located `By.xpath(//input[@id='regEmail'])`
Then number of elements found by `By.xpath(//div[text()='Please fix your email to continue.'])` is greater than `0`
