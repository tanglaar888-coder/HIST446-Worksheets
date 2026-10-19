# HIST 446 The Past as Data
## Ball State University

This repository contains the coding worksheets and in-class data exercises for HIST 446 at Ball State University.

### What's in this repository

| Files | What they are |
|---|---|
| `1-RBasics.qmd`, `2-DataStructures.qmd`, `3-Loops-Conditionals-Functions.qmd` | **Worksheets**: R fundamentals, completed at home. |
| `E1-...`, `E2-...`, `E3-...` and so on | **In-class data exercises**: started in class (pairs or groups of 3 are welcome) and finished at home. They are graded like worksheets. Most are Quarto documents (`.qmd`); E2 is an R script (`.R`), and E5 is done in Voyant Tools, a web application, with your answers written in the `.qmd`. |
| `data/` | Public datasets the exercises read from disk. Don't edit these files. |
| `data/FOTM/` | Your own copy of the Freedom on the Move tables. It stays on your computer and is **never pushed** to GitHub (see below). |
| `output/` | Tables and figures you make, one folder per exercise (`output/exercise1/`, `output/exercise2/`...). The exercises create these folders for you. |
| `logs/` | Your learning logs and the template for them. |
| `assets/` | The stylesheet that formats your rendered `.html` files. Don't edit it. |

---

## Getting Started

### 1. Install R and RStudio

You need both. R is the language; RStudio is the program you'll use to edit your code scripts, visualize data, track variables, etc.

- [Download R](https://cloud.r-project.org/)
- [Download RStudio Desktop](https://posit.co/download/rstudio-desktop/)

Install R first, then RStudio.

### 2. Fork and clone this repository

First install [GitHub Desktop](https://desktop.github.com/). You'll use it alongside RStudio: GitHub Desktop handles moving your work between your computer and GitHub, and RStudio is where you write code.

1. At the top right of this page, click **Fork**. This makes your own copy of the repository under your GitHub account. Your copy is where you'll do all your work.
2. On your fork's page, click the green **Code** button, then **Open with GitHub Desktop**.
3. When GitHub Desktop asks where to put the folder, choose `Desktop/HIST-446/`.
4. GitHub Desktop will ask how you plan to use the fork. Choose **To contribute to the parent repository**. This is what lets you receive new worksheets later in the semester.
5. Now open RStudio and go to **File → New Project → Existing Directory**, then select `Desktop/HIST-446/HIST446-Worksheets/`.

Step 5 is what makes RStudio treat the folder as a project. Don't skip it, and from now on always open the worksheets by opening that project rather than opening the `.qmd` files directly.

### 3. Install the packages

Worksheet 2 opens with a short section called **Before You Begin: Installing Your Packages**. Open `2-DataStructures.qmd`, and run that chunk in your console. It installs everything the worksheets need, and it only installs what you are missing, so it is safe to run more than once.

It will take a few minutes the first time. Good moment for a short coffee break.

If R asks whether to install from sources a package which needs compilation, answer `n` for no.

### 4. Check that it worked. Run this in your RStudio console:

```r
library(tidyverse)
library(DigitalMethodsData)
data(gayguides)
head(gayguides)
```

If you see a table of data, you're good to go!

### 5. Files that stay on your computer

Some files belong only on your own computer. They are listed in `.gitignore`, so GitHub Desktop won't show them as changes and they're never pushed.

- **Freedom on the Move.** Go to the [FOTM downloads page](https://database.freedomonthemove.org/downloads), click **Full Database Download**, and put the CSV files in `data/FOTM/` inside your Worksheets folder. Don't edit or rename them. Exercises 3 and 4 read them from there. We don't republish FOTM's data, so if anything from `data/FOTM/` ever shows up in GitHub Desktop's **Changes** list, stop and ask me before committing.
- **API keys.** When an exercise asks you to get an API key, it goes in your `.Renviron` file, never in a `.qmd` or `.R` file. The exercise will show you how.

---

## Getting New Worksheets

Worksheets and coding exercises are released over the course of the semester, so new ones appear here after you have already forked and cloned. Your copy does not update itself. When I announce a new worksheet or exercise:

1. Open **GitHub Desktop** and make sure the HIST446-Worksheets repository is selected at the top left.
2. Click **Fetch origin**.
3. Go to **Branch → Update from upstream/main**.
4. Click **Push origin** to bring your own copy on GitHub up to date too.

Any new files will now show up in your local folder. You may then open the .Rproj file to start RStudio, and your Files pane will show the new file additions as well.

**Your own work is safe.** This only adds the new files or any changes I make on my end. Everything you have written stays exactly as it was, and none of your commits are lost.

---

## How to Work Through a Worksheet or Exercise

Worksheets and most exercises are Quarto documents (`.qmd`). They mix explanation, example code, and prompts for you to complete. Exercise 2 is an R script (`.R`): run it line by line and write your answers as comments (lines starting with `#`).

1. **Open the `.qmd` file** (always from inside the RStudio project; see step 2 of Getting Started).
2. **Run code chunks as you go** with the green arrow, or Cmd/Ctrl + Shift + Enter.
3. **Fill in the empty chunks and blockquotes.** Prompts are numbered and marked `(@)`. Blockquotes (lines starting with `>`) are where written answers go.
4. **Render the document** (click on the Render button) to check it works start to finish. If rendering fails, something in your code is broken. Keep calm, that's useful information and always fixable. Rendering creates an `.html` file next to your `.qmd`. Commit it along with your `.qmd`.
5. **Save your outputs.** When an exercise saves tables or figures, they go in its own `output/exerciseN/` folder. Commit that folder along with your `.qmd` or `.R` file.
6. **Commit as you go.** Several small commits is the best way to keep your work progress safe, controlled and traceable. Remember: this is about reproducibility and transparency, and your commit history is part of what I'm looking at for your grade in the course.
7. **Push to GitHub** to complete a Coding Worksheet or Data Exercise assignment.
8. **Update your learning log** in `logs/`. See more about the logs below.

### A note on getting stuck

You will get stuck at some points when completing a Worksheet, and that is a-okay. What matters is what you do next: read the error, read the documentation, search for the message, ask for help. Record that process in your log. Remember that your grade will not be based on accuracy, but on your effort to find solutions and your demonstrated ability to troubleshoot when things don't work.

---

## Learning Logs

The `logs/` folder contains one template file: `learning-log-template.md`. Every week:

-  Make a copy of that template inside the `logs/` folder. Don't edit the template itself.
-  Rename the copied file using the following format: `LastName_LearningLog_Week-X.md`, where `X` is the week number.
-  Commit and push it with the rest of your work.

---

## Credits

The original worksheets repository was originally created by [Amanda Regan](https://github.com/regan008) for History 8500/8510 at Clemson University, and is adapted here with her permission. This version of the repository has been significantly adapted for students in HIST 446 at Ball State University. Many worksheets and coding assignments in this class draw from local datasets related to Muncie, Indiana and Ball State's Archives & Special Collections. For more information on the data used in this class, please reach out to lucas.avelar@bsu.edu.
