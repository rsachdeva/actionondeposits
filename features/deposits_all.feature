Feature: Deposits
  In order to see information
  As a user
  I want maturing deposits app to display all deposits

  Scenario: display deposits with maturing expiry alert period confirm
    Given the date is 2009-02-10
    And the following deposits exist:
      | bank_name | account_number | start_date | term_in_days |
      | Nice Bank | 4555           | 2009-02-12 | 365          |
    And the date continues to 2010-02-10
    When I load maturing deposits page
    Then I should see "Nice Bank"
    And I should see "Confirm"


  Scenario: display deposits with maturing expiry alert period confirm
    Given the date is 2009-02-10
    And the following deposits exist:
      | bank_name | account_number | start_date | term_in_days |
      | Nice Bank | 4555           | 2009-02-12 | 365          |
    And the date continues to 2010-02-10
    When I get "/deposits.json"
    Then I should see "Nice Bank"

  Scenario: display deposits after confirmation done with new start date will not have maturing expiry alert period confirm
    Given the date is 2009-02-10
    And the following deposits exist:
      | bank_name | account_number | start_date | term_in_days |
      | Nice Bank | 4556           | 2009-02-12 | 365          |
    And the date continues to 2010-02-24
    And I load maturing deposits page
    And I should see "Confirm"
    When I confirm deposit "4556" of "Nice Bank" with start date as "2010-02-25" for a term of "300" days
    And I load maturing deposits page
    Then I should see "Nice Bank"
    And I should not see "Confirm"
