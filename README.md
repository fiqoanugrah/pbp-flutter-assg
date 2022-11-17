# flutter_assignment

# **Assignment 7**

## Stateless widget dan stateful widget

- stateless widget: a widget that does not have a state, meaning that the widget does not have data changes that occur dynamically.
- stateful widget: a widget that has a state, meaning that the widget has data changes that occur dynamically.

## Widget used in this project

- Padding
- Rows
- FloatinActionButton
- Icons
- Spacers
-Text
- Column
- Center
- Scaffolds

## The function of `setState()`

Calling the `setState()` function tells the framework that the state of this object has changed, so the framework calls the `build()` method to _reload_ the UI

## Difference between `const` and `final`

- final: a variable that can only be initialized once and its _value_ cannot be changed
- const: its _value_ must be known at _compile time_ and cannot be changed afterwards

## Checklist implementation

1. Create a plus button to increment the value and a minus button to decrement the value
2. Make a conditional if the counter is even and odd
3. Make a conditional if the counter is 0 so that the minus button disappears


# **Task 8**

## Difference between `Navigator.push` and `Navigator.pushReplacement`

- `Navigator.push`: function to add a new route to the navigation stack
- `Navigator.pushReplacement`: functions to replace existing routes in the navigation stack with new routes

## Widget used and its function

- Container: a widget that functions as a _container_ to hold other widgets
- Form: widget that functions to create a form
- Column: widget that functions to accommodate other widgets vertically
- ListTile: row which holds text as leading and trailing
- Drawer: a working widget to create a _drawer_ on the left side of the screen (for navigation)

## Event types in Flutter

- onTap: event that occurs when the widget is tapped
- onPressed: event that occurs when the widget is pressed
- onChanged: event that occurs when the widget is changed
- onSaved: event that occurs when the widget is saved

## How `Navigator` works when switching app pages

Navigator manages the stack of routes and provides two ways to manage the stack of routes, namely declarative and imperative. Declarative uses `Navigator.pages`, while imperative `Navigator.push` and `Navigator.pop`

## Checklist implementation

1. Create three navigation buttons on the drawer
2. Create a form page
3. Create a budget data page