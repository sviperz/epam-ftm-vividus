Description: Open post page from search result page

Scenario: Open reddit.com main page
Meta:
   @reddit
Given I am on a page with the URL 'https://www.reddit.com/'

Scenario: Post search
Meta:
   @reddit
When I change context to element located `By.xpath(//input[@id='header-search-bar'])`
When I enter `vividus` in field located `By.xpath(//input[@id='header-search-bar'])`
!-- When I set focus to the context element
When I press ENTER on keyboard
When I wait until the page title contains the text 'vividus'
Then the page title contains the text 'vividus'


Scenario: Open post page from search results
Meta:
   @reddit
When I change context to element located `By.xpath(//div[@class='rpBJOHq2PR60pnwJlUyP0'])`
When I click on element located `By.xpath(//div[contains(@class,'scrollerItem Post t3_kte7th')])`
Then number of elements found by `By.xpath(//div[@id='overlayScrollContainer'])` is greater than `0`
