---
trigger: always_on
---

# Project Rules & Operational Protocols

> **System Notice**: These are the immutable laws for this project. They dictate how we think, research, codegen, and communicate.

---

## 1. The Core Mandate: "Use Everything"
We do not guess. We verify. We use **ALL** our tools for **EVERY** significant task.

### Tool Usage Protocols
*   **Sequential Thinking (The Engine)**:
    *   **MANDATE**: Use for ANY complex task (>2 steps), debugging, or planning.
    *   *Why*: To avoid loops and hallucinated logic.
*   **Brave Search (The Library)**:
    *   **MANDATE**: ALWAYS use `brave-search` for docs, facts, and libraries.
    *   **RATE LIMIT**: Do NOT exceed 1 request per second. Wait 1 second between searches.
    *   **STRICT PROHIBITION**: Do NOT use standard web search. Do NOT use standard browser preview (headless or otherwise). Use `Brave Search`, `Fetch`, or `Playwright` instead.
*   **Fetch (The Reader)**:
    *   **MANDATE**: Use `fetch` to read documentation, huge text files, and static websites.
    *   *Why*: It is faster and more efficient than opening a browser.
    *   *Fallback*: If `fetch` fails (e.g., dynamic JS site), switch to `Playwright`.
*   **Playwright (The Eyes)**:
    *   **MANDATE**: ALWAYS use `playwright` to validate UI/UX, verify dynamic behavior, and take screenshots.
    *   *Why*: Code that "should work" often doesn't. We must SEE it.
*   **MCP Compass (The Scout)**:
    *   **Trigger**: If we are limited or need specialized tools, ask Compass.
*   **Predev (The Architect)**:
    *   Use for deep specs and massive documentation.
*   **Supabase-Mcp (The Database)**:
    *   **MANDATE**: Use `Supabase-Mcp` for ALL database operations (queries, migrations, schema inspection).
    *   *Why*: Keeps us in the flow without switching contexts.
*   **Chrome-DevTools (The Microscope)**:
    *   **MANDATE**: Use for deep DOM inspection and Accessibility tree verification during Phase 4.
    *   *Why*: Ensures structure and accessibility are perfect.

---

## 2. Interaction Standards
*   **Language**: **STRICTLY SIMPLE, NON-TECHNICAL**.
    *   Talk like a helpful partner, not a manual.
    *   No jargon without simple metaphors.
*   **Clarification Strategy**:
    *   Ask **Multiple Choice** questions.
    *   Provide a **Recommendation** with reasoning.
*   **Rule Changes**:
    *   **NEVER** change rules silently.
    *   Trigger: If a rule blocks a good solution.
    *   Action: Explain Why -> Propose Change -> Wait for Approval.
*   **Progress Tracking**:
    *   **MANDATE**: Update `PROJECT_STATUS.md` immediately after completing any significant task.
    *   *Why*: To keep the roadmap alive and visible.

---

## 3. Master Workflow (The Map)

### Phase 1: Discovery & Strategy
*   **Action**: Analyze Idea (`Sequential`) -> Market Research (`Brave`) -> UI Inspiration (`Playwright`).
*   **Goal**: Define the "What" and "How".

### Phase 2: Architecture & Specs
*   **Action**: Tech Stack Compare (`Brave`) -> DB Schema/API (`Predev`) -> Visual Planning.
*   **Goal**: Blueprint the app.

### Phase 3: Setup & Implementation
*   **Action**: Structure (`Filesystem`) -> Logic Plan (`Sequential`) -> Database (`Supabase-Mcp`) -> Code (`Filesystem`).
*   **Goal**: Build the MVP.

### Phase 4: Verification & QA
*   **Action**: **VISUAL MANDATE** (`Playwright`) -> **DOM/A11y** (`Chrome-DevTools`) -> Logic Edge Cases (`Sequential`).
*   **Goal**: Premium Quality.

### Phase 5: Distribution & Growth
*   **Action**: Marketing Keywords (`Brave`) -> App Store Rules (`Brave`) -> Launch.
*   **Goal**: Success.

---

## 4. Decision Framework
*   **Tech Stack**:
    *   Target: Cross-platform (iOS + Android + Web).
    *   Research Candidates: React Native, Flutter, Capacitor.
*   **MVP Scope**:
    *   Focus: Core features only ("Must Haves").
    *   Roadmap: Save "Nice to Haves" for V2.
*   **Success**:
    *   Every feature must answer: "Does this help growth?"

---

## 5. Core Principles (Code & Security)
*   **Coding Philosophy**: "Readable over Clever".
    *   **Requirement**: Lots of short, simple comments explaining the "why".
*   **Security Strategy**: "Security by Design".
    *   Validate everything. Secrets (API Keys) never in code.
