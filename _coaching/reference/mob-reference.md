---
title: Mob Programming Reference
---

Reference for mob/ensemble resources, patterns, and practices. {: .fs-6 .fw-300 }

## Mob/Ensemble Programming Quick Start Guide

Use this when you need a lightweight way to start mob/ensemble programming in a team (new practice, onboarding, difficult problem, refactoring, incident learning).

<object data="/assets/images/technical-coaching/mob-programming-quick-start-guide.pdf"
height="200" type='application/pdf'></object>

<br>

Suggested “first session” agenda (60–90 minutes):

1. **Set the goal**: clarify the smallest demonstrable outcome (a test, a spike conclusion, a tiny shipped change).
2. **Working agreements**: rotation interval, how to ask questions, when to park topics.
3. **Pick a driver/navigator rotation** (timer on) and start with the simplest next step.
4. **Retrospect** at the end: keep/stop/start for the next mob.
   
Primary article (context + facilitation notes):
- [Mob Programming Quick Start Guide (article)](https://anthonysciamanna.com/2020/02/15/mob-programming-quick-start-guide.html)


## Practices for effective mob programming: 

Practices (expanded explanations + examples):
- [Practices for effective mob programming](https://anthonysciamanna.com/2018/06/29/practices-for-effective-mob-programming.html)

Practical checklist (good defaults):
- **One computer, one keyboard** (even remote: one shared screen controlling machine at a time).
- **Strong rotation**: 5–10 minutes for learning mobs; 10–15 minutes for discovery/refactoring.
- **Narrate intention**: the navigator describes *what/why*; the driver focuses on *typing exactly that*.
- **Keep stories thin**: slice work so progress is visible every rotation (tests, tiny commits).
- **Make impediments explicit**: when stuck, pause and choose a technique (spike, sketch, read docs together).
- **Use “parking lot” decisions**: record non-blocking topics to avoid derailing flow.

Helpful micro-patterns:
- **“Ask 2 then do 1”**: propose two options, pick one quickly, proceed.
- **“Red → Green → Refactor” together**: reinforce TDD habits and shared understanding.
- **“Explain the next edit”** before typing: reduces thrash and increases learning.

Typical roles (rotate regularly):
- **Driver**: hands on keyboard/mouse.
- **Navigator**: gives direction and maintains the next-step plan.
- **Facilitator (optional)**: watches time, energy, participation, and interrupts gently when needed.
- **Researcher (optional)**: quickly looks up docs while the mob continues (report back in 1–2 minutes).

## Few tips for Mob Programming

Tim Ottinger’s tips (high-signal article):
- [A few tips for Mob Programming](https://www.industriallogic.com/blog/a-few-tips-for-mob-programming/)

Additional tips that consistently improve outcomes:
- **Optimize for learning, not output**: output follows shared understanding.
- **Make “silence” safe**: allow thinking time; don’t fill gaps with chatter.
- **Invite quiet voices**: ask “what are we missing?” or do a quick round-robin.
- **Prefer small reversible steps**: fast feedback beats cleverness.

Remote mobbing essentials (tooling + ergonomics):
- Use a **low-latency screen share** and **native IDE sharing** when possible.
- Keep **audio always-on**, cameras optional, and use a **timer bot** for rotation.
- Establish a **handoff ritual** (“I have control”, “I’m done”, “next driver”).

If you mob regularly, add lightweight structure:
- **Definition of Ready for mob**: unclear work, high risk, onboarding, exploratory refactor, tricky bug.
- **Definition of Done**: committed, tests passing, small notes captured, next action identified.

## Core concepts & patterns (quick reference)

### Ensemble vs Mob
- **Mob programming**: the whole team works on the same thing, at the same time, on one computer.
- **Ensemble programming**: same practice, with emphasis on *whole-team* collaboration (often used interchangeably).

### Common formats
- **Classic driver/navigator rotation** (timer-based)
- **Ping-pong / strong-style pairing inside the mob** ("For an idea to go from your head to the computer, it must go through someone else’s hands")
- **Randori / kata-style mob** for practice and deliberate learning

### When it’s a great fit
- Onboarding and spreading codebase context
- Complex refactors and architectural seams
- Production incidents / debugging with shared situational awareness
- Discovery spikes where alignment matters more than speed

### When to avoid (or timebox hard)
- Purely mechanical work with no learning value
- When the group is too large for the room/tooling (split into two ensembles)

## More resources (curated)

- [Woody Zuill](https://woodyzuill.com/) (mob programming origin stories and practice)
- "Mob Programming" (book) by Zuill & Meadows (conceptual foundation; consider as team reading)
- [Llewellyn Falco](https://llewellynfalco.blogspot.com/) (strong-style pairing; many talks/blogs)
- [Industrial Logic blog](https://www.industriallogic.com/blog/) (patterns, coaching, and articles overlapping with ensemble work)

## Facilitation templates

### Lightweight working agreement (copy/paste)
- Rotation: __ minutes
- We narrate intent before edits
- We keep a parking lot for off-topic decisions
- Anyone can call: **"Pause"**, **"Reset"**, **"Let’s recap"**
- End with a 5-minute retro

### 5-minute retro questions
- What helped us move forward?
- What slowed us down?
- What one adjustment will we try next session?






