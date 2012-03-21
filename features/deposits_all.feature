Feature: Deposits
  In order to see information
  As a user
  I want maturing deposits app to display all deposits

Scenario: display all deposits
  Given the date is 2010-02-17
  And the following deposits exist:
    | bank_name                |
    | NiceBank                 |
  When I load maturing deposits page
  Then I should see "Nice Bank"
