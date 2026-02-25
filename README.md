# D Debugging Starter (VS Code)

This project is a small D (`dub`) workspace configured for easy build, run, and debug on Windows in VS Code.

## GitHub Template URL

- Template repository: `https://github.com/brotherbill/dlang_course`
- Template project folder: `https://github.com/brotherbill/dlang_course/tree/main/c00_debug_windows_start_here`

## Use as a template repo

If this repository is published as a GitHub template:

1. Click **Use this template** to create your own repository.
2. Clone your new repository locally.
3. Open it in VS Code and follow **2-minute quick start (new users)** below.

This keeps all project-level debug/task settings while letting each user keep their own global VS Code keybindings.

## 2-minute quick start (new users)

1. Open this folder in VS Code.
2. Open a terminal in the project root.
3. Run `dub build` once to verify toolchain setup.
4. Press `F5` to start normal debugging (**Debug D project**).
5. To debug from program entry, complete the one-time `Alt+F5` User keybinding setup from the section below.
6. Press `Ctrl+Alt+Shift+B` anytime to create a timestamped backup zip.

If a step fails, jump to the **Troubleshooting** section below.

## What success looks like

After `dub build`, you should see a successful build with no errors and an executable created in the workspace root:

- `c00_debug_windows_start_here.exe`

When you run or debug the current sample program, you should see output similar to:

```text
first  = 20
second = 22
total  = 42
```

## What this project includes

- A D executable project (`dub.json`) with source in `source/`.
- VS Code launch configurations in `.vscode/launch.json`.
- VS Code tasks in `.vscode/tasks.json`.
- Workspace shortcuts in `.vscode/keybindings.json`.

## Prerequisites

Make sure these are installed and available:

- D toolchain (`dmd`) and `dub`
- VS Code.
- C/C++ debugger support (`cppvsdbg` / C/C++ extension)

## Day-to-day usage

### Build

- Command line: `dub build`
- VS Code task: **dub: build**.

### Run

- Command line: `dub run`
- VS Code task: **dub: run (integratedTerminal)**.

## Debugging workflows

This workspace provides two launch profiles in `.vscode/launch.json`:

1. **Debug D project**
   - `stopAtEntry: false`
   - Normal debugging flow (run to breakpoints)

2. **Debug D project (Stop at entry)**
   - `stopAtEntry: true`
   - Startup debugging flow (breaks immediately at entry)

### Step-into practice (F11) and VARIABLES window

The sample program includes a simple function in `source/app.d`:

- `add(int left, int right)`
- `main` sets `first` and `second`, calls `add`, and prints `total`

Suggested exercise:

1. Set a breakpoint on `int total  = add(first, second);`.
2. Press `F5` to start regular debug.
3. When stopped, press `F11` to step into `add`.
4. Watch `left`, `right`, and `sum` in the VARIABLES pane.
5. Step out and confirm `total` becomes `42` in `main`.

### Keyboard behavior

- `F5`
  - Starts debugging using the currently selected profile.
  - Typical use: keep **Debug D project** selected for regular launch.

- `Alt+F5`
  - Starts **Debug D project (Stop at entry)** from a User keybinding.
  - This is not stored in the project by default; see setup below.

### Break on thrown exceptions

For `cppvsdbg`, first-chance exception break behavior is configured in the **Breakpoints** panel:

- Open Run and Debug view.
- Expand **Exception Breakpoints**.
- Enable **C++ Exceptions** (or **All Exceptions**, depending on UI).

## Workspace shortcuts (project-local)

Defined in `.vscode/keybindings.json`:

- `Ctrl+Alt+D` (only during debug): toggle/focus Debug Console (`inDebugMode`)
- `Ctrl+Alt+Shift+B`: run task **backup: success snapshot**.

## Backup task behavior

The backup task creates a timestamped zip of the workspace content:

- Task name: **backup: success snapshot**.
- File pattern: `c00_debug_windows_start_here_success_YYYYMMDD_HHMMSS.zip`
- Output location: parent directory of the workspace (for this repo, `C:\temp\`)

## Config scope: project vs user

### Project-local (shared with repo)

- `.vscode/launch.json`
- `.vscode/tasks.json`
- `.vscode/settings.json`
- `.vscode/keybindings.json`

### User-local (not automatically shared)

- `%APPDATA%/Code/User/keybindings.json`

Important: VS Code launch configs are workspace-level, but keyboard shortcuts are user-level.
So a custom global shortcut like `Alt+F5` requires each user to add it once.

## For other users: one-time `Alt+F5` setup

Open **Preferences: Open Keyboard Shortcuts (JSON)** and add this object to your keybindings array:

```json
{
  "key": "alt+f5",
  "command": "debug.startFromConfig",
  "args": {
    "name": "Debug D project (Stop at entry)",
    "type": "cppvsdbg",
    "request": "launch",
    "program": "${workspaceFolder}/c00_debug_windows_start_here.exe",
    "args": [],
    "stopAtEntry": true,
    "cwd": "${workspaceFolder}",
    "preLaunchTask": "dub: build",
    "console": "integratedTerminal"
  },
  "when": "workspaceFolderCount != 0"
}
```

If your keybindings file already contains other entries, add a comma between objects as needed.

If `Alt+F5` conflicts, change only the `"key"` value (for example `"ctrl+alt+f5"`).

## Troubleshooting

- `F5` stops at entry unexpectedly:
  - Check selected profile in Run and Debug dropdown; choose **Debug D project**.

- Custom hotkey does nothing:
  - Check for shortcut conflicts in VS Code keyboard shortcuts.
  - Reload VS Code window after changing User keybindings.

- Backup zip not found:
  - Look in the parent folder of the workspace (`C:\temp\`).
  - Check task terminal output for exact path.
