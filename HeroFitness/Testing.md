## Onboarding Feature Specs

### Story: Customer installs an app

### Narrative #1

```
As a person who wants to exercise
I want the app to automatically create workouts for me based on my exercise preferences
```

#### Sign In Scenarios (Acceptance criteria)

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
