# API Evolution and Co-Evolution

This repository contains the reports (academic papers, grant proposal, and technical papers) related to the ISU Empirical Software Engineering Laboratory research into API Evolution and Co-Evolution. Additionally, this repository also contains the software developed as part of this research.

## Directory Structure

The structure of this project is as follows:

```
/analyses
/assets
  /crossref
  /templates
  macros.md
/code
/data
/dist
/presentations
/references
/reports
```

* The `analyses` folder contains the analysis scripts which utilize the data in the `data` folder. The internal structure of this folder should probably resemble that of reports.
* The `assets` folder contains assets specific to the generation of reports and presentations. Specifically, it contains definitions for crossref setup for different formats, in `crossref` folder. It also contains the templates for use for different report formats, in `templates` folder. Finally, `macros.md` is a set of `pp` macros for use in creating the documents.
* The `code` folder is meant to hold software projects associated with the research project.
* The `data` folder is meant to hold the data associated with each project. This folder should have a similar internal structure to that of `reports`.
* The `dist` folder is meant to hold the final variants of each report (both in report and proposal form).
* The `presentations` folder is meant to hold the presentations for use at conferences, thesis defenses, and dissertation defenses.
* The `references` folder contains the pdf form of references used in each research report. The internal structure of this folder should mirror that of the `reports` folder
* The `reports` folder contains the markdown and build scripts associated with the reports generated during this research project.

# Coding Projects

The software projects associated with this research have been limited to the following languages:

* Java 1.8+
* Groovy
* Clojure
* Scala
* Python 3
* R
* Ruby 2.5+

When developing projects are part of this research you must adhere to good software engineering principles. This includes that each project must be tested using Unit Testing, Integration Testing, and System Testing principles. It must be capable of being automatically built and must be placed on the local Jenkins build server. It must be analyzed by the local instance of SonarQube and pass the quality gates set for the lab. Finally, it must meet the minimum standards for project and source code documentation. It must have automated dependency management (maven, gradle, leinigen, sbt, pip3, bundler). Finally, it must have deployment management such that we can deploy it to others either as a standalone application or library via dependency management systems.

# Building the Reports

The reports used in this project are written in markdown. They are then compiled to pdf or LaTeX using the pandoc system. To ensure that your system is ready to complete this task you will need to use the following instructions:

## Dependencies

This project has several dependencies. Here are instructions to install each one:

### Haskell platform

This installs the newest version of the haskell platform on the system.

```bash
# install ghc and cabal
curl -sSf https://get-ghcup.haskell.org | sh

# add ghc environmental settings on start of terminal session
cp ~/.bashrc ~/.bashrc.backup
echo ". $HOME/.ghcup/env" >> ~/.bashrc

# effectively reload bash (restarting terminal is also an option)
. ~/.bashrc

# update cabal
cabal new-install cabal-install

# install stack
curl -sSL https://get.haskellstack.org/ | sh
```

### Pandoc and extensions

We use cabal to install the newest version of pandoc and extensions.

```bash
cabal new-install pandoc pandoc-crossref pandoc-citeproc
```

### LaTeX dependencies

Ubuntu:

```bash
sudo apt install texlive-publishers texlive-science latexmk
```

### PP

PP is a preprocessor designed for use with pandoc. PP can be installed from source. Instructions: https://github.com/CDSoft/pp.

```bash
git clone git@github.com:CDSoft/pp.git
cd pp
make
make install
```

*Note: There is a healthy chance that you'll get errors regarding Rscript or other missing programs. These errors can be safely ignored. They are only used to build the README.md file of the pp project which is not needed to use the tool.*

In order for the build process to use `pp`, it has to be on your PATH. By default, the `pp` binary is installed to `~/.local/bin` on
linux systems. You can move this binary to a preferred location if you wish. If `~/.local/bin` is not on your PATH,
you can add it by running this command and restarting the terminal.

```bash
cp ~/.bashrc ~/.bashrc.backup.1
echo "export PATH=\"\$PATH:$HOME/.local/bin\"" >> ~/.bashrc
```

### Fonts

This project uses the Futura LT BT font. To install, execute the following command:

```bash
mkdir -p ~/.fonts && curl https://www.cufonfonts.com/download/font/futura-lt-bt > /tmp/futura-lt-bt-fonts.zip && unzip /tmp/futura-lt-bt-fonts.zip -d ~/.fonts
```

## Building the documents

To build the report or the proposal, first switch to the `report` directory.

```bash
# Build report
./build.sh report

# Build proposal
./build.sh proposal

# Build report intermediary files
./build_latex.sh report

# Build proposal intermediary files
./build_latex.sh proposal
```

If you have problems when building related to `pp` not being found, append `~/.local/bin` to your path. You can do that with the following commands:

```bash
cp ~/.bashrc ~/.bashrc.backup
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
```

## Building the presentation

To build the presentation you will need the same dependencies as noted above

You can then build the presentation via the following command:

```bash
$ presentation/build.sh
```

## Cleanup generated files

The `clean.sh` script will cleanup files generated in any directory.
