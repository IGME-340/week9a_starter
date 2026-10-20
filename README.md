# Week 9A Starter - IGME-340

Three packages that show up in almost every real app: images that only download once, data that's still there after you close the app, and buttons that open a web page, the phone dialer, or an email. The middle one is the big one for Project 2, which has to remember the user's last search.

`lib/main.dart` starts as a `MainPage` StatefulWidget with the same photo shown two ways, an empty spot for a third, a small name and email form, and three buttons that don't do anything yet. The `TODO` comments are numbered to match the steps we do in class.

---

## I. Get the Code

**Work in your own repo, not the template.** Accepting the assignment creates a repo just for you, named `igme-340-week-9a-starter-<your-github-username>`. Don't fork `IGME-340/week9a_starter` or click "Use this template" on it. I can't see work pushed anywhere else, so it won't count.

Three ways, all worth the same credit. Use whichever you already know:

- **GitHub Desktop:** clone your repo, then open the folder in VS Code.
- **Command line:** copy the URL from the green **Code** button, then `git clone <your-repo-url>`.
- **Neither one cooperating?** Skip cloning and edit your files directly on GitHub.com. Full credit, no penalty.

Step by step for all three: [Participation Repos](https://github.com/jptweb/IGME-340-Shared/blob/main/documents/participation.md).

Once it's on your machine, open the folder in VS Code. Make sure you open the folder that *contains* `pubspec.yaml`, not the one above it. Opening the parent folder is the most common way this goes wrong, and the error you get looks completely unrelated to the real cause.

**Don't clone into a path with spaces.** `Documents/IGME 340/` will cause failures later that have nothing to do with your code. Use something like `Documents/igme-340/`.

---

## II. Run It

```bash
flutter pub get
flutter run
```

**Use the Android emulator today.** The image package doesn't cache anything on the web, so Chrome won't show you the difference we're looking for. The first run takes longer than usual because all three packages include Android code.

You should see an indigo app bar that says Week 9A, the photo twice with an empty spot next to it, a Name and Email form, and three buttons.

---

## III. Follow Along in Class

Everything today happens in `lib/main.dart`. **The three packages are already in `pubspec.yaml`**, so there's nothing to install. Each one's `import` is at the top of the file, commented out. Uncomment it when we get to that part.

| What | What it does |
|---|---|
| `CachedNetworkImage` | Like `Image.network`, but it saves the download on the device. Next time it loads from there, even with no internet. |
| `placeholder` / `errorWidget` | What to show while the image loads, and what to show if it can't. |
| `CachedNetworkImageProvider` | The cached version of `NetworkImage`, for when the image is a `Container`'s background. |
| `SharedPreferences` | Saves small pieces of data on the device as key/value pairs, like a Map that survives closing the app. |
| `late` | Tells Dart "this gets a value before I use it, just not right away." |
| `initState()` | Runs once when the screen is created. It can't be `async`, so it calls an `async` function that can. |
| `setString()` / `getString()` | Save a String under a key, and read it back later. |
| `??` | "If that's null, use this instead." What you get back when nothing was saved yet. |
| `launchUrl()` | Opens a link outside your app: a web page, the phone dialer, an email, a text message. |
| `Uri.parse()` | Turns a String into a `Uri`, which is what `launchUrl` takes. Same as `http.get` in 7B. |
| `LaunchMode` | Where the link opens: a browser tab inside your app, or the full browser app. |

---

## IV. Commit and Push

### How this one is graded

To get credit, your pushed code has to show today's work:

- a `CachedNetworkImage` on screen
- the Save and Load buttons saving and reading both fields with `SharedPreferences`
- the saved values filling in on their own when the app starts (Step 11)

The link button is welcome but not required. It doesn't need to look like mine. An untouched starter or a "Hello World" commit doesn't count.

**Missed class?** You can still earn it. The [Week 9A notes](https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/9A.md) have the code for every piece.

**Push before the start of our next class** (Thursday Oct 22). Pushing at the end of class is a good habit, so do that too.

### How to push

**GitHub Desktop:** write a summary, click **Commit to main**, then **Push origin**.

**Command line:**

```bash
git add .
git commit -m "Week 9A in-class work"
git push
```

**If push is fighting you:** open `lib/main.dart` on GitHub.com, click the pencil, paste your code in, and commit there. Same credit.

---

## V. If Something Goes Wrong

| Problem | What to do |
|---|---|
| `MissingPluginException` | Stop the app completely and run it again. Hot reload and hot restart can't load a package's Android code. |
| `LateInitializationError: Field 'myPrefs' has not been initialized` | `init()` never ran, or hadn't finished yet. Check that `initState()` calls `init()`, and that `init()` has the `await`. |
| Saved data doesn't come back | Make sure the key is spelled the same in `saveText()` and `loadText()` (`'name'` is not `'Name'`). Then stop the app and run it again. |
| The photos are gone, or there's a red box where one should be | The emulator has no internet. Swipe down from the top and turn off airplane mode. If it still won't connect, cold boot the emulator (Device Manager, the ⋮ menu, **Cold Boot Now**). |
| A link opens a "Make Chrome your own" screen | That's Chrome's first-time setup on a fresh emulator. Tap **Use without an account**. It only happens once. |
| An email link opens a Gmail welcome screen | Same thing, first-time setup. Skip through it. |
| `Could not launch` | Check the link. A web address needs the `https://` at the front. |
| Blue squiggle under something | That's a lint suggestion, not an error. Your code still runs. |
| `git push` asks for a password | GitHub wants a token, not your account password. Easiest fix is to install [GitHub CLI](https://cli.github.com) and run `gh auth login`. |
| `flutter pub get` complains about SDK versions | Run `flutter --version` and send me the output on Slack. This template is built to accept a wide range, so this one is worth reporting. |
| Something else | Slack me. Don't sit on it quietly, a broken environment compounds fast. |
