# Task 001: Salon appointment page (mockup)

Status: planned in Agent Office, not built yet.
Owner request: "Give me a mockup with an appointment form. Just one page."

## Agreed scope (from the Project Leader)
- One page for a hair/beauty salon.
- Appointment form fields: name, phone, service, stylist, date, time.
- Look-and-feel only: nothing is saved or sent yet. No payments, no reminders.
- Must work well on a phone first, then tablet and desktop.

## Plan
1. developer: build the page as a single self-contained HTML file at `mockups/salon-appointment.html`
   (HTML + CSS + a little JavaScript). Validate required fields in the browser and show a friendly
   confirmation message on submit. Use placeholder salon name [SALON NAME] and placeholder services.
2. tester: check required fields, invalid phone numbers, past dates, very long names, small screens,
   and keyboard-only use. Report PASS or FAIL.
3. security-checker: quick review (no secrets, no external scripts that are not needed, safe handling of input).
   Report CLEAR TO SHIP or BLOCKED.
4. Project Leader: summarize the result for the owner and suggest the next step
   (for example: connect the form to a database so bookings are actually saved).

## Done when
- The page opens in a browser and looks good on a phone.
- Tester verdict is PASS and security verdict is CLEAR TO SHIP.
- Changes are on a branch, and the owner is asked before merging to main.
