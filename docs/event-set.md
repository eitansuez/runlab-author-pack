# An event set

An event set is a page of labs for a booth. People open it from a link instead of signing in with Google.

## The link

When you create the set as an event, it gets a link. The link looks like this:

```
https://runlabs.io/your-set#secret=…
```

The secret is the part after `#secret=`. Copy the whole link from the set page and give that to the people running the booth. The secret is not in the query string, and it is not in the page someone sees before they have the link.

On your profile, open the set and press Copy link. The catalog admin page has the same control for a set that has no owner.

Opening the set without the current secret shows no labs and does not show the set's name. Starting a lab sends the secret with the request. A missing or wrong secret does not start the lab. The form tells the person the link has expired and to ask the booth staff.

The form still asks for a first name, a last name, an email, and a company. That form is how the lab records who played it. It is not what locks the lab.

A lab that is already running does not ask for the secret again.

## Rotate the link

Press Rotate link only when the link has leaked. Every saved copy of the old link stops opening labs. Labs that are already running stay up.

Turning a Google set into an event does not make a link. Rotate once to make the first one. Adding a lab, removing a lab, changing the window, or publishing again leaves the link alone.

## A lab on the catalog too

A lab can be on the public catalog and in an event set. The catalog still asks the person to sign in with Google. The event link is a separate door, and it still needs the secret.
