---
title: Connecting AI coding assistants with Miro using the Miro MCP Server
date: 2026-05-11
header:
  overlay_image: /assets/images/posts/miro-mcp-overlay.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
  teaser: /assets/images/posts/miro-mcp-teaser.jpg
categories:
  - AI
tags:
  - GitHub Copilot
  - Claude Code
  - Miro MCP Server
---

Connect your AI coding assistant with Miro using the Miro MCP Server to bring board context into your development
workflows. This guide covers two clients — GitHub Copilot CLI and Claude Code — but the same server works with any
MCP-capable tool.

Once connected, your assistant can read Miro boards, summarize diagrams and notes, and help generate code or
documentation from the ideas captured on the board.

## What is the Miro MCP Server?

The Miro MCP Server is Miro's implementation of the Model Context Protocol (MCP) that connects Miro's collaborative
design platform with AI assistants like GitHub Copilot and Claude Code.

It enables:

- **Reading board context** — AI can analyze your Miro boards, designs, and PRDs
- **Generating diagrams** — Create flowcharts, UML diagrams, ERD schemas based on code or text
- **Generating code** — Transform PRDs, diagrams, and prototypes into working code
- **Manipulating board items** — Create sticky notes, shapes, text, images, cards, documents, and more
- **Enterprise security** — OAuth 2.1 authentication with secure access control

See the [Miro MCP Introduction](https://developers.miro.com/docs/mcp-intro) for more details.

## Prerequisites

- A Miro account with MCP enabled for your organization (if on Enterprise, your admin must enable the MCP Server first)
- An MCP-capable client installed — for example [Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli) or [Claude Code](https://code.claude.com/docs/)
- Access to the Miro board you want your assistant to use

## Miro MCP Server OAuth 2.1 Authentication

Miro's MCP Server uses **OAuth 2.1 with dynamic client registration**, which means:

- No API tokens to manage — authentication is token-based and expires automatically
- User-level consent — you grant permission through a browser-based flow
- Enterprise-grade security — compliant with enterprise security standards
- Dynamic registration — the MCP server automatically registers your client


## Configure Copilot CLI with Miro MCP Server

### Step 1: Add the Miro MCP Server configuration

Add the Miro MCP server to your Copilot CLI configuration file at `~/.copilot/mcp-config.json`:

```json
{
  "mcpServers": {
    "miro-mcp": {
      "type": "http",
      "url": "https://mcp.miro.com/",
      "tools": ["*"]
    }
  }
}
```

### Step 2: Start the Copilot CLI and grant access via OAuth flow

Start the Copilot CLI and follow these steps during the OAuth flow:

1. **Review the OAuth prompt** — A browser window opens to Miro's authorization page
2. **Select your team** — Choose which Miro team to grant access to - This determines which boards and projects 
   Copilot can access
3. **Confirm permissions** — Review and approve the requested permissions
4. **Continue** — You'll see a confirmation and be redirected back to your terminal

Once authorization is complete, Copilot CLI caches the access token and subsequent commands use it automatically.


### Step 3: Check MCP server status

1. Run the command to manage MCP Server Configuration:

    ```bash
    /mcp show
    ```

2. You should see `miro-mcp` listed and marked as enabled.

    ```bash
    MCP Servers
    
     ❯ ✓ miro                http , OAuth: authenticated  https://mcp.miro.com/
       ✓ atlassian-rovo-mcp  http , OAuth: authenticated  https://mcp.atlassian.com/v1/mcp/authv2

    Built-in:
    ✓ github-mcp-server   http   https://api.business.githubcopilot.com/mcp/readonly
    
    Config:
    /Users/ivan/.copilot/mcp-config.json
    ```

## Configure Claude Code with Miro MCP Server

You can connect the same Miro MCP Server to [Claude Code](https://code.claude.com/docs/), Anthropic's agentic
coding tool. Claude Code supports remote HTTP MCP servers with OAuth out of the box.

### Step 1: Add the Miro MCP Server

Run the `claude mcp add` command with the HTTP transport:

```bash
claude mcp add --transport http miro https://mcp.miro.com/
```

By default the server is added to the current project (local scope). Use `--scope user` to make it available across
all your projects:

```bash
claude mcp add --transport http --scope user miro https://mcp.miro.com/
```

### Step 2: Authenticate via OAuth

After adding the server, `claude mcp list` shows it with `! Needs authentication`. That's expected — the next step
completes the sign-in.

1. Start Claude Code and open the MCP panel:

    ```text
    /mcp
    ```

2. Select `miro` from the list, press Enter, and choose **Authenticate**.
3. Your browser opens Miro's authorization page. Select your team, review the requested permissions, and approve.
4. Back in Claude Code, the server's status changes to **connected**.

Claude Code stores the access token securely and refreshes it automatically. If a refresh fails, Claude Code points
you to `/mcp` where you can **Re-authenticate**.

### Step 3: Check MCP server status

1. Open the MCP panel to manage your servers:

    ```text
    /mcp
    ```

2. You should see `miro` listed and marked as connected, alongside any other configured servers.

    ```text
    Manage MCP servers
    4 servers

      Project    (/Users/ivan/git/ibanFR/ibanfr.github.io/_posts/.mcp.json)
      MCPs
    ❯ atlassian-rovo-mcp · ✔ connected · 31 tools
      claude-code-docs · ✔ connected · 3 tools
      github · ✔ connected · 47 tools

      User MCPs (/Users/ivan/.claude.json)
      miro · ✔ connected · 35 tools
    ```

## Test the connection

With the server connected, try a basic Miro-related prompt in your assistant:

```text
can you list my miro boards?
```

Your assistant should respond with a list of your Miro boards, confirming the connection is working. You can recheck
the server status at any time — `/mcp show` in Copilot CLI, or `/mcp` and `claude mcp list` in Claude Code.

## Security and best practices

- **Token expiry** — OAuth tokens are managed automatically by Miro. If prompted to re-authenticate, follow the OAuth flow again
- **Permissions** — Only grant access to teams whose boards you want your assistant to interact with
- **Audit** — Check your Miro workspace's audit log to see which connected apps have accessed your boards
- **Revoke access** — If you no longer want a client to access Miro, remove the MCP server from its configuration (e.g. `~/.copilot/mcp-config.json` for Copilot CLI, or `claude mcp remove miro` for Claude Code)

## Other resources

- [Miro MCP Official Docs](https://developers.miro.com/docs/miro-mcp)
- [GitHub Copilot CLI Documentation](https://docs.github.com/en/copilot/how-tos/copilot-cli)
- [Claude Code MCP Documentation](https://code.claude.com/docs/en/mcp)
- [Model Context Protocol Overview](https://modelcontextprotocol.io/)
- [OAuth 2.1 Specification](https://oauth.net/2.1/)
