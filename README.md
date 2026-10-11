# Project 1: AI agent team

![Agent Office: Aisyah, Ravi, Mei, Daniel and Farid at their desks](agent-office/screenshot-desktop.png)

| Role | File |
|---|---|
| Project Leader (Aisyah) | CLAUDE.md (the main Claude Code session) |
| Developer (Ravi) | .claude/agents/developer.md |
| Database Manager (Mei) | .claude/agents/database-manager.md |
| Tester (Daniel) | .claude/agents/tester.md |
| Security Checker (Farid) | .claude/agents/security-checker.md |

Other folders:
- `agent-office/`: the visual office dashboard.
- `tasks/`: task briefs for the team. Start with `tasks/001-salon-appointment-mockup.md`.

## Using the team in Claude Code
1. Start a new session on this repository.
2. Ask: "Which subagents are available?" to check the team is loaded.
3. Give a task, for example: "Read tasks/001-salon-appointment-mockup.md and run it with the team."

To add or change a teammate, ask Claude Code ("create a designer subagent that…")
or edit the files in .claude/agents/.

Docs: https://code.claude.com/docs/en/sub-agents

## Projects done by the team

| Project | Built by | Checks | Try it |
|---|---|---|---|
| Task 001: Salon appointment page (mockup) | Aisyah, Ravi, Daniel, Farid | Tests: PASS · Security: CLEAR TO SHIP | [mockups/salon-appointment.html](mockups/salon-appointment.html) |

<img src="mockups/salon-appointment.png" alt="Salon appointment mockup" width="640">

The same list appears in the Agent Office dashboard under "Projects done by the team".
To add a project, add an entry to `PROJECTS` in `agent-office/index.html` and a row here.
