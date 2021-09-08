# Language Files

Varnam Language support files. Download from [releases](https://github.com/varnamproject/schemes/releases).

Folder structure:
- `languages`
  - ...
  - `ml`
    - `ml.scheme` - Scheme File
    - `symbol-frequency-report` - Symbol Frequency Report
    - `Other folders` - Different pack folders
  - ...

### Scheme

A scheme file is a mapping of English characters to Indian language characters. This helps in transliteration using a letter by letter conversion.

The scheme file is compiled to a file called Varnam Symbol Table (VST). Varnam uses VST to do transliteration. **VST IS REQUIRED** for basic language support in Varnam.

### Symbol Frequency Report

This file is used to populate `weight` column in VST

File format:

```
ക 98
വ 98
അ 98
...
```

This file is made using scripts inside `scripts` folder. It has a README.

### Packs

A language pack is a set of pre-trained **Varnam Learning Files (VLF)** that can be imported into any Varnam instance quickly. It has many words in it. It's basically a dictionary file.
