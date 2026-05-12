---
agent: 'agent'
description: 'Create a Jira Task in the SITE project based on the provided summary and context.'
---

You are creating a Jira **Task** in the **SITE** project (`cloudId: https://ibanfr.atlassian.net`).

**Inputs:**
- Task summary: `${input:summary:A concise title in imperative present tense (e.g., "add user export to CSV")}`

**Before creating the issue:**
1. Search the SITE Jira project for related existing issues to link or avoid duplication.

**Create the Jira Task using `contentFormat: "markdown"` with this body:**

```
## Objective

Clearly describe the task's objective in one or two sentences.

## Context

Provide background information, including links to relevant ADRs, documentation, or discussions.

Related Jira issues: list all related issues using full Jira URLs. If no related issues exist, state 'None found'.

## Acceptance Criteria

> List of clear, verifiable conditions that must be met for the task to be considered complete.

* Describe the user-visible or system-visible outcome
* Specify the key functional behaviors that must work
* Include technical constraints, integrations, or interfaces affected
* Cover important edge cases, error handling, and validation rules
* State what should remain unchanged if the task is a refactor or cleanup
* Make each criterion testable and unambiguous

## TODO

> Remove this section once the issue is set up.

* Create Sub-Tasks — break down into smaller units of work
* Link dependent Jira issues or epics
* Add labels: _TechDebt_, _Style_, _Documentation_ (as applicable)
* Add to current Sprint
* Set priority: HIGH, MEDIUM, LOW (as applicable)
```

**Important:** The line
`> List of clear, verifiable conditions that must be met for the task to be considered complete.` under the Acceptance
Criteria section must always be included verbatim in the created Jira task. Do not omit, paraphrase, or treat it as a
comment—it is part of the required issue body.

**After creating the issue:**
- Get the current user's account ID.
- Assign the task to the current user.
- Report the issue URL to the user.
- Suggest sub-tasks if the scope warrants them.
