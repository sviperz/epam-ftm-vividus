Description: Create a Board using Trello API

Scenario: Create new Board using Trello API
Meta:
    @trello
When I issue a HTTP POST request for a resource with the URL 'https://api.trello.com/1/boards/?key=apikey&token=token&name=TestBoard'
Then the response code is equal to '200'
