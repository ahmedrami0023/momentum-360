# 00_Master_Workflow

## Application Lifecycle
This file orchestrates how we build your cross-platform app.

**Core Rule**: Every single phase **MUST** use the full power of our MCP tools (`Sequential Thinking`, `Brave`, `Playwright`, `Compass`) to ensure decisions are backed by data.

---

### Phase 1: Discovery & Strategy
*   **Goal**: Define *what* we are building and *how* it will succeed.
*   **Detailed Steps**:
    1.  **Analyze Idea**: Use `sequential-thinking` to break down the user's request into core problems.
    2.  **Market Research**:
        *   Use `brave-search` to find competitors and market gaps.
        *   Use `playwright` to visit competitor websites, screenshot their features, and analyze their UX.
    3.  **Feasibility Check**: Use `mcp-compass` to find tools/APIs that might solve the hard parts early.
*   **Deliverables**: `task.md` (Roadmap), `implementation_plan.md` (Strategy).

---

### Phase 2: Architecture & Specs
*   **Goal**: Blueprint the technical structure.
*   **Detailed Steps**:
    1.  **Tech Stack Research**:
        *   Use `brave-search` to compare frameworks (e.g., "React Native vs Flutter 2026 performance").
        *   Use `sequential-thinking` to weigh the pros/cons for *our* specific app.
    2.  **Spec Generation**:
        *   Use `predev` (Deep Spec) to generate the database schema and API structure.
    3.  **Visual Planning**:
        *   Use `playwright` to find design inspiration (search "modern dashboard UI"), screenshot it, and reference it.
*   **Deliverables**: Database Schema, API Spec, UI Mockups descriptions.

---

### Phase 3: Setup & Implementation
*   **Goal**: Write the code.
*   **Detailed Steps**:
    1.  **Scaffolding**: Use `filesystem` to create the project structure.
    2.  **Coding Loop**:
        *   **Think**: Use `sequential-thinking` to plan the function/component.
        *   **Check**: Use `brave-search` (or `fetch` for docs) to find the documentation for the library we are using.
        *   **Code**: Use `filesystem` to write the file.
    3.  **Style**: See `04_core_principles.md` (Readable, Simple Comments).

---

### Phase 4: Verification & QA
*   **Goal**: Ensure it works and looks premium.
*   **Detailed Steps**:
    1.  **Visual Test**:
        *   **MANDATE**: Use `playwright` to open the app, click buttons, and take screenshots.
        *   **NEVER** just say "it should work". See it.
    2.  **Logic Test**: Use `sequential-thinking` to trace potential edge cases (e.g., "What if the user is offline?").
    3.  **Debug**: If it fails, use `brave-search` to find the error message.

---

### Phase 5: Distribution & Growth
*   **Goal**: Launch and Grow.
*   **Detailed Steps**:
    1.  **Marketing Research**:
        *   Use `brave-search` and `mcp-compass` to find SEO keywords and marketing channels.
    2.  **Store Prep**:
        *   Use `brave-search` to check latest App Store Review Guidelines.
    3.  **Launch**: Deploy to Web and Stores.
