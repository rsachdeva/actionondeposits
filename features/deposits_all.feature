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
    Then the JSON should be:
    """
    [
     {
      "account_number":"4555",
      "amount":"17452.5",
      "apr":"1.25",
      "apy":null,
      "bank_name":"Nice Bank",
      "bank_website":"www.ingdirect.com",
      "comment":"Nice rate achieved",
      "compounding_times":365,
      "created_at":"2009-02-10T06:00:00Z",
      "fixed_income_account_type":"Savings",
      "phone_number":"1-800-254-2737",
      "start_date":"2009-02-12",
      "term_in_days":365,
      "updated_at":"2009-02-10T06:00:00Z"
     }
    ]
    """

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
