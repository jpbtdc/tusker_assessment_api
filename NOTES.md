# Notes

## Task A

6. Next package taken to be the first package found from available packages where content not already received.
Do not know if physical or virtual packages i.e. if a single package can only be delivered once.
Assume virtual packages and therefore the same package can be delivered to multiple prospects.
7. Assume a cities endpoint is required that displays each unique city and the next packages to be delivered

## Task B

Assume want an endpoint per prospect which includes showing a list of all available packages that could be received.

Prospects endpoint: `/prospects`
Packages endpoint: `/packages`
Cities endpoint: `/cities`
Prospect endpoint: `/prospect/:contact` e.g. `/prospect/Steve`