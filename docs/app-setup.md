# Fitness Tracker App Setup Notes

A deployable `CustomApplication` metadata file is included at:

- `force-app/main/default/applications/Fitness_Tracker.app-meta.xml`

If manual app setup is preferred:

1. Go to **Setup → App Manager → New Lightning App**.
2. Name the app **Fitness Tracker**.
3. Add tabs: Trainer Profiles, Client Profiles, Trainer Assignments, Programs, Training Sessions, Body Metrics.
4. Assign app visibility to FT Admin, FT Trainer, FT Staff, and FT ReadOnly permission sets/profiles as required.
5. Add `ftClientDashboard` to Home/App pages in Lightning App Builder.
