# Sedimentologika class and template files

This read me provides a comprehensive guide for the use of the _Sedimentologika_ LaTeX template.

The _Sedimentologika_ LaTeX class and corresponding templates files are designed to enable a smooth submission process to _Sedimentologika_.
It will also allow you to quickly generate a pre-print server suitable version of the file if you want to do so.

Use of the templates are not required at submission, but they will greatly assist our volunteer copy-editing and production team.

The class file and template have taken inspiration from the [Seismica](https://seismica.library.mcgill.ca) class and [Advances in Geochemistry and Cosmochemistry](https://journals.uu.se/AGC) template.
The _Sedimentologika_ `cls` and templates files are written from scratch.

> [!IMPORTANT]
>
> You **MUST** compile the document using LuaLaTeX.
>
> This template is only tested using TeXLive version 2025; compatibility with older versions is not guaranteed and is considered an unsupported use case.

If you obtained the _Sedimentologika_ LaTeX template from the official download ([github.com/SedK](https://github.com/Sedimentologika/templates)), you should have zip file, which when unzipped will have a directory structured like:

```
│   manuscript.tex
│   README.md
│   sedimentologika.cls
│
├───figures
├───tables
└───guide_example
    │   guide_example-bibiliography.json
    │   guide_example.pdf
    │   guide_example.tex
    │   sedimentologika.cls
    │
    ├───figures
    │       DepoEnv.pdf
    │       KatiThandaSentinel20251018.pdf
    │
    └───tables

```

These files provide the template and a minimal working example.
We suggest that you to attempt building this minimal working example (using LuaLaTeX) prior to making alterations to ensure your setup is working as needed.

```tex
lualatex manuscript.tex
```
(you'll need to run it two or three times)

Please see the section on [troubleshooting](#troubleshooting) if you need assistance.

## Usage

_Sedimentologika_ has a few minimal requirements for articles submitted.
It is **strongly** suggested that you read the _Sedimentologika_ [manuscript](https://oap.unige.ch/journals/sdk/manuscript-guidelines) and [figure and table](https://oap.unige.ch/journals/sdk/figures-tables-guidelines) guidelines whilst writing your article.

### TLDR

At minimum, ensure you have three files in your directory structured like:

```
project_dir
├── sedimentologika.cls
├── manuscript.tex
└── bibliography.json OR bibliography.bib
```

> [!NOTE]
>
> `sedimentologika.cls` is the class definition, this must be present and must not be renamed.
> `manuscript.tex` is your primary document, this can be renamed to whatever you want the output filename to be.
> A `bibliography.json` (CSL format) OR `bibliography.bib` must be present. You can change the name of this file as long as you also you change the name in the `manuscript.tex` file too.

Test build `Guide_Example.tex` using LuaLaTeX in the example subfolder.

Use the `manuscript.tex` file to create your document, you can rename it to whatever you want or replace the content of `manuscript.tex`.

You must:

* Use **one** dialect of English for the document (e.g. American OR Australian OR UK).
* Provide a non-technical plain language summary.
* Provide a CRediT author declaration
* Provide the following statements (even if simply to state there are none)
  * Acknowledgements
  * Conflict of interest
  * Funding
  * Artificial intelligence use
* Make accessible all data and code used in the study following the [FAIR principles](https://doi.org/10.1038/sdata.2016.18).
  * Preferably via Zenodo, GitHub, figshare, PANGAEA etc. as it will provide a DOI and a citation for your data/code.
* When using colour schemes in figures, **ensure** that they are accessible.
  * [Scientific colour maps](https://doi.org/10.5281/zenodo.8409685) provides several ready to use schemes for many applications and programming languages.
  * Use sans-serif fonts, minimum size ≥ 6 pt (Noto Sans or equivalent size).
  * Use tools like [DaltonLens](https://daltonlens.org/), [Coblis](https://www.color-blindness.com/coblis-color-blindness-simulator/), [Chroma.js Colour Palette Helper](https://gka.github.io/palettes/), and [ContrastGrid](https://contrast-grid.eightshapes.com)

Those of you who delve into the `sedimentologika.cls` file will likely notice that `proof` and `publication` modifiers also exist.
These two options are for use by the production team at _Sedimentologika_, and not intended for use by authors.
Note that you cannot fake an article using our template because you can't fake a DOI, but please just don't try.
We're making this class and template publicly available so anyone interested can suggest improvements, adapt it for other purposes, or contribute to [bug-fixes](#finding-bugs).

### Document Class

Options for the `{sedimentologika}` class are:

- `[preprint]` to enable pre-print styling
- `[submission]` to enable submission styling suitable for _Sedimentologika_
- `[submission, anonymous]` to enable submission styling suitable for _Sedimentologika_
  - The 'anonymous' option removes author names and attempts to strip metadata from the generated PDF.
  - If anonymity is requested, we will uphold it throughout the review process.
  - **IMPORTANT**: It is the authors' responsibility to ensure that no identifying information remains in the file.
  - _Sedimentologika_ is **NOT RESPONSIBLE** for any failure by the authors' to maintain anonymity during file generation or submission.
  - **Note**: Posting a pre-print is strongly encouraged. However, doing so may compromise anonymity, as the file becomes publicly accessible and searchable online.

### Abstract and Plain Language Summary

You are required to provide both an abstract and plain language summary in English.
To add these to you document, add the plain language summary text to the first optional argument of the `\SedKtitle` command, and the abstract text to the second optional argument. E.g.:

```
\SedKtitle{
  English plain language summary goes here
}[
  English abstract goes here
]{
 % \translation{}{}{}
}
```

#### Translations

Authors are encouraged to provide (a) translation(s) of their abstract and plain language summary into (an)other language(s) if they wish to do so.
For languages derived from the Latin, Greek, or Cyrillic alphabets, simply declaring the language in the `\translation{language}{translation of the word(s) abstract, or plain language summary}{translation text}` according to the appropriate [babel](https://ctan.org/pkg/babel?lang=en) code should suffice.
[Noto Sans](https://notofonts.github.io/) is used as the font.

For languages using other scripts (e.g. Arabic, Chinese, Korean, Japanese...) you will need to utilise the available Noto Font.
The template *manuscript.tex* has examples of the required code for the aforementioned languages.

To add a translation, insert `\translation{language}{translation of the word abstract, or plain language summary}{translation text}` into the third optional argument of the `\SedKtitle{}{}{}` command

For example:
```
\SedKtitle{
  English plain language summary goes here
}[
  English abstract goes here
]
[
  \translation{spanish}{Resumen}{La traducción al español del resumen va aqui}
  \translation{spanish}{Resumen en lenguagje secillo}{La traducción al español del resumen en lenguagje secillo va aqui}
]
```

## Troubleshooting

If you encounter issues when building your document please check the following:

* You are using a distribution of TeX that has, or you have made available to your TeX installation:
  * LuaLaTeX
  * **ALL** the packages listed below in [_Required Packages_](#required-packages)
* You are attempting to compile using LuaLaTeX
* You have added the required sections and information to your document
* You have checked your `.log` file to attempt to identify the cause of the error to ensure it is not caused by an error on your part.
  These could be, but not limited to:
  * misspelled/incorrect commands
  * invalid units
  * missing figure files
* Tried building the minimal working example

If you have attempted these basic troubleshooting commands and still cannot resolve your issue you should then contact the _Sedimentologika_ editorial team via: [admin@sedimentologika.org](mailto:admin@sedimentologika.org).

## Finding bugs

While the maintainer of the `cls` file has attempted to make it as bug free as possible there is always a chance one has slipped through.
If you do happen to find a genuine bug in with the `cls` file, please either contact us via [admin@sedimentologika.org](mailto:admin@sedimentologika.org) or better yet, raise an issue on the [GitHub repository](https://github.com/).

**In all cases, please document the steps to reproduce the bug/provide the log file.**

## Required Packages

All packages used in the class are available via the [CTAN](https://ctan.org/) and are standard within the TeXLive distributions (≥ 2025).

* afterpage
* amsmath
* amssymb
* authblk
* babel
* booktabs
* caption
* ccicons
* changepage
* citation-style-language
* commath
* datatool
* datetime2
* doi
* draftwatermark
* firamath-otf
* fixme
* fontspec
* geometry
* graphics
* hyperref
* hyperxmp
* lineno
* longtable
* mhchem
* microtype
* multirow
* nicematrix
* noto
* noto-mono
* orcidlink
* parskip
* pdflscape
* ragged2e
* setspace
* simpleicons
* siunitx
* textgreek
* textpos
* titleps
* titlesec
* titling
* unicode-math
* url
* xcolor
* xstring
* zref

If Noto Sans (Variable, Math, Mono) fonts are not installed, you will additionally require:
* noto
* noto-mono
* firamath-otf

If you use any additional packages, it is your responsibility to ensure they are compatible with those listed above, and they MUST be part of the TeXLive (≥ 2025) distribution or readily obtainable via the [CTAN](https://ctan.org/).
