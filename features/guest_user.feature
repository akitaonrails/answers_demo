Feature: Guest User
  In order to guarantee security
  As a guest user
  I should be restricted from adding new data to the app

  Scenario: visit homepage
    Given I am on the homepage
		Then I should see "Sign Up"
		And I should see "Answers" within "h1"
		
	Scenario: visit a Product
	  Given I have a Product
	  And I am on the homepage
	  When I follow "My Product"
	  Then I should see "Questions" within "h1"
	  And I should see "New Question"
	
	Scenario: try to add a new Question
	  Given I have a Product
	  And I am on the homepage
	  When I follow "My Product"
	  And I follow "New Question"
  	And I follow redirect
    Then I should see "You need to sign in or sign up before continuing"