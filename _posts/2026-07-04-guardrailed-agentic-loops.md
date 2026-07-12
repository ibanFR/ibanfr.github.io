---
title: "Guardrailed agentic loops: letting agents run without letting them run away"
date: 2026-07-04
header:
  overlay_image: /assets/images/posts/anthropic-overlay.png
  show_overlay_excerpt: false
categories:
  - AI
tags:
  - Agentic Loops
  - Claude Code
  - Harness Engineering
---

The interesting frontier in coding agents right now is not a smarter model — it is the loop around the model. A
single prompt gets you one answer. A loop lets an agent work, check its own output, and try again until the job is
actually done. The catch is that a loop with no brakes is a way to burn money and mangle a codebase at machine speed.
This post explores **guardrailed agentic loops**: the pattern of giving an agent room to iterate while wrapping it in
constraints that keep it safe, bounded, and cheap.

I came across the [`fltman/loop-engineer`](https://github.com/fltman/loop-engineer) repository and it crystallised a
lot of ideas that have been floating around the community. It is a good anchor for the topic, so I use it as the
backbone here alongside Anthropic's guidance and a well-known community loop pattern.

## Why loop at all?

Anthropic's [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) draws a line
worth keeping in mind. **Workflows** orchestrate LLMs through predefined code paths — predictable, and the right choice
for well-defined tasks. **Agents** let the model dynamically direct its own process and tool use. The agent loop is the
mechanism: receive a goal, plan, act with tools, read the feedback (test output, compiler errors, a failing check),
assess progress, and repeat until done.

You reach for a loop when the steps cannot be enumerated in advance but there *is* a clear success signal — "make
`npm test` exit 0", "get the type checker to pass", "resolve every item in this PRD". The loop trades predictability for
the ability to grind through open-ended work. That trade only pays off if you can tell, mechanically, when to stop.

## The core discipline: no binary condition, no loop

The single most useful idea in `loop-engineer` is a founding rule:

> No binary condition → no loop.

A goal like "improve the UX" has no exit. The agent can always find something else to change, so the loop runs until it
hits a wall you did not build — usually your API bill. A goal like "make the test suite exit 0" has a crisp pass/fail
check the loop can run every iteration. If you cannot express the exit as a command that returns success or failure,
you do not yet have a loopable task; you have a conversation.

The repository turns this into a non-negotiable five-point checklist baked into every template:

1. **Verifiable exit condition** — a binary pass/fail check run each iteration.
2. **Max-iteration hard cap** — enforced in code, not requested in the prompt.
3. **Budget enforcement in code** — track cumulative spend and halt before overspend.
4. **Sandboxed execution** — a worktree, container, or branch; never straight onto `main`.
5. **Human checkpoint** — approval required before anything irreversible.

Notice how much of the safety lives *in code around the loop*, not in the prompt. A prompt asking the agent to "stop
after 10 tries and don't spend too much" is a suggestion. A shell counter and a budget check are guarantees. This is
the whole point of the word *guardrailed* — the rails are structural.

## Patterns for the loop body

`loop-engineer` scaffolds five loop shapes, which map neatly onto the building blocks in Anthropic's article:

- **Headless while-loop** — one binary check, one agent iteration. The simplest useful loop.
- **Evaluator-optimizer** — one agent produces work, a separate critic judges quality and feeds back. Anthropic lists
  this as a core pattern; it shines when you have clear evaluation criteria and iteration measurably helps.
- **Meta / prompt-refinement** — a loop that improves the prompt driving another loop.
- **Orchestrator fan-out** — a central agent decomposes work and delegates subtasks to workers, then synthesises the
  results (Anthropic's orchestrator-workers).
- **Scheduled / triggered** — interval- or event-driven execution.

The patterns nest: an orchestrator can spawn inner evaluator loops, and a meta-loop can wrap a headless one. The
guardrail checklist applies at every level — each nested loop needs its own exit condition and its own cap.

## A community pattern: the Ralph loop

The clearest community illustration of a while-loop is the **Ralph loop**, popularised by Geoffrey Huntley. It is the
most stripped-down agent loop there is: a shell `while` loop that feeds the agent the *same* prompt file every
iteration, lets it modify the codebase on disk, and exits — then starts a fresh session and does it again. State lives
in the file system, not in a growing context window, so each pass starts clean. Named after the Simpsons character who
is not the sharpest but never gives up, it keeps going until the work is verifiably done. Huntley famously used it to
build a toy programming language for a few hundred dollars in API spend.
[`snarktank/ralph`](https://github.com/snarktank/ralph) is a reference implementation, and
[`vercel-labs/ralph-loop-agent`](https://github.com/vercel-labs/ralph-loop-agent) ports the idea to the AI SDK.

The Ralph loop is a great teaching example precisely because it exposes the danger. Stripped to its essentials it looks
like this:

```bash
while ! npm test; do
  claude -p "$(cat PROMPT.md)" --dangerously-skip-permissions
done
```

That is an endless loop with permissions bypassed and no human watching. On its own it is a runaway waiting to happen.
What makes it *guardrailed* is exactly the checklist above, added in the shell around the call:

- A **max-iteration cap** so a stuck loop fails instead of spending forever.
- A **budget ceiling** so a run halts when cumulative spend hits your limit.
- A **cheaper model** for routine grinding, saving the expensive one for hard steps.
- A **wall-clock timeout** on each iteration.
- A **sandbox** — a fresh branch or worktree — so a bad pass never lands on `main`.

The recurring theme: the more autonomy you hand the loop, the more every limit has to be enforced by the machine,
because there is no one there to hit Ctrl+C. Treat `--dangerously-skip-permissions` as a signal to be *extra* careful
about the rails around it.

## Takeaways

- A loop is worth building only when there is a **binary success check**. If you cannot write the exit as a command,
  refine the task before you automate it.
- Put the guardrails **in code, not in the prompt** — iteration cap, budget ceiling, sandbox, human checkpoint.
- Match the **loop shape** to the work: while-loop for a single check, evaluator-optimizer when quality needs judging,
  orchestrator fan-out for decomposable work.
- The **more autonomy, the more the machine must enforce the limits**. Treat `--dangerously-skip-permissions` as a
  request to be extra careful about the rails around it.

## Sources

- [`fltman/loop-engineer`](https://github.com/fltman/loop-engineer) — decision trees and templates for guardrailed loops
- [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) — Anthropic Engineering
- [The Ralph loop / `snarktank/ralph`](https://github.com/snarktank/ralph) and [`vercel-labs/ralph-loop-agent`](https://github.com/vercel-labs/ralph-loop-agent)
</content>