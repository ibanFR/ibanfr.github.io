---
title: Connecting GitHub Copilot CLI with Miro using the Miro MCP Server
date: 2026-05-11
header:
  image: /assets/images/posts/miro-mcp.jpg
categories:
  - AI
tags:
  - GitHub Copilot
  - Miro MCP Server
---

Connect GitHub Copilot with Miro using the Miro MCP Server to bring board context into your development workflows.

Once connected, Copilot can read Miro boards, summarize diagrams and notes, and help generate code or documentation
from the ideas captured on the board.

## What is the Miro MCP Server?

The Miro MCP Server is Miro's implementation of the Model Context Protocol (MCP) that connects Miro's collaborative
design platform with AI assistants like GitHub Copilot. 

It enables:

- **Reading board context** — AI can analyze your Miro boards, designs, and PRDs
- **Generating diagrams** — Create flowcharts, UML diagrams, ERD schemas based on code or text
- **Generating code** — Transform PRDs, diagrams, and prototypes into working code
- **Manipulating board items** — Create sticky notes, shapes, text, images, cards, documents, and more
- **Enterprise security** — OAuth 2.1 authentication with secure access control

See the [Miro MCP Introduction](https://developers.miro.com/docs/mcp-intro) for more details.

## Prerequisites

- A Miro account with MCP enabled for your organization (if on Enterprise, your admin must enable the MCP Server first)
- Copilot CLI installed. See [Install Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli)
- Access to the Miro board you want Copilot to use

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


### Step 3: Test the connection

Try a basic Miro-related prompt:

```bash
can you list my miro boards?
```

Copilot should respond with a list of your Miro boards, confirming that the connection is working.

### Check MCP server status

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

## Security and best practices

- **Token expiry** — OAuth tokens are managed automatically by Miro. If prompted to re-authenticate, follow the OAuth flow again
- **Permissions** — Only grant access to teams whose boards you want Copilot to interact with
- **Audit** — Check your Miro workspace's audit log to see which connected apps have accessed your boards
- **Revoke access** — If you no longer want Copilot CLI to access Miro, remove the MCP server from your `config.json`

## Other resources

- [Miro MCP Official Docs](https://developers.miro.com/docs/miro-mcp)
- [GitHub Copilot CLI Documentation](https://docs.github.com/en/copilot/how-tos/copilot-cli)
- [Model Context Protocol Overview](https://modelcontextprotocol.io/)
- [OAuth 2.1 Specification](https://oauth.net/2.1/)
