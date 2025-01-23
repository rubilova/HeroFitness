## Onboarding Feature Specs

### Story: Customer installs an app

### Narrative #1

```
As a person who wants to exercise
I want the app to automatically create workouts for me based on my exercise preferences
```

#### Onboarding Scenarios (Acceptance criteria)

```
Test Sign Up Before Onboarding / First Step of Survey:
- Given the customer taps Sign In / Register Now and has created an account
- When the customer taps "Sign Up"
- First step of survey is displayed
```

```
Test Sign Up Before Onboarding / Completes Onboarding Successfully:
- Given the customer has created an account
- When the customer completes onboarding and taps Finish
- Schedule Tab is displayed with the chosen schedule
```

```
Test Sign Out and Sign Back In / User's Data Displayed Correctly:
- Given the customer signed out of the account
- When the customer signs back in
- Schedule Tab is displayed with the customer's data
```

```
Test Sign Up After Onboarding / Sign Up Creates Schedule Correctly:
- Given the customer finished the survey / tapped Register Now and has created an account
- When the customer taps "Sign Up"
- Schedule Tab is displayed with the chosen schedule
```

#### Sign In Scenarios 

```
Test Sign In navigation:
- Given the customer sees Onboarding Screen and has not created account yet
- When the customer taps "Sign In"
- Then the app displays Sign In screen with Sign In or Register Now buttons
```

```
Test empty Sign In / Empty fields:
- Given the customer sees Sign In Screen and has left email / password fields empty
- When the customer taps "Sign In"
- Error message is displayed
```
```
Test Sign In / Invalid Email:
- Given the customer sees Sign In Screen and has entered invalid email
- When the customer taps "Sign In"
- Error message indicating invalid email is displayed
```
```
Test Sign In / Invalid Password:
- Given the customer sees Sign In Screen and has entered invalid email
- When the customer taps "Sign In"
- Error message indicating invalid password is displayed
```
```
Test Sign In / Invalid Credentials:
- Given the customer sees Sign In Screen and has entered email and password combination that does not exist in database
- When the customer taps "Sign In"
- Error message indicating invalid password is displayed
```
```
Test Sign In / Successful Sign In:
- Given the customer sees Sign In Screen and has entered email and password combination that does not exist in database
- When the customer taps "Sign In"
- Error message indicating invalid password is displayed
```

---
