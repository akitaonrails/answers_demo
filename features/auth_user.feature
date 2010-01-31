Feature: Authenticated User
  In order to guarantee security
  As an authenticated user
  I should be allowed in the restricted pages

	Scenario: new user
	  Given I am on the home page
	  And I follow "Sign Up"
	  When I fill in "user[name]" with "John Doe"
	  And I fill in "user[email]" with "johndoe@gmail.com"
	  And I fill in "user[password]" with "john123"
	  And I fill in "user[password_confirmation]" with "john123"
	  And I press "Sign Up"
	  Then I should see "User was successfully created."

  Scenario: authentication
    Given I have a User
		And I am authenticated
		Then I should see "Signed in successfully."
		
	Scenario: add a new Question
	  Given I have a Product
	  And I have a User
	  And I am authenticated
	  And I am on the homepage
	  When I follow "My Product"
	  And I follow "New Question"
    When I fill in "question[question]" with "Hello World"
    And I fill in "question[details]" with "foo"
    And I fill in "question[tag_list]" with "john, doe"
    And I press "Submit"
    Then I should see "Question was successfully created."

  Scenario: add a new Answer
    Given I have a Product
    And I have a User
    And I have a Question
    And I am authenticated
    When I am on /products/1/questions/1
    And I fill in "answer[answer]" with "foo bar"
    And I press "Add this Reply"
    Then I should see "Answer was successfully created."
    And I should see "foo bar"

	Scenario: destroy a Question
	  Given I have a Product
	  And I have a User
	  And I have a Question
	  And I am authenticated
	  When I am on /products/1/questions/1
		And I follow "Destroy"
		Then I should see "Question was successfully destroyed."
		
  Scenario: edit a Question
    Given I have a Product
    And I have a User
    And I have a Question
    And I am authenticated
    When I am on /products/1/questions/1
  	And I follow "Edit"
    And I fill in "question[details]" with "foo bar foo bar"
    And I press "Submit"
    Then I should see "Question was successfully updated."
    And I should see "foo bar foo bar"