# SVOML
SVOML is the sentence pattern markup language based on XML Schema and XSL.

![image](https://github.com/takumi1001/svoml/assets/40143183/693c58dd-37f7-4858-81ec-ff33a6000074)

See samples: [sample1.xml](https://takumi1001.github.io/svoml/sample1.xml) [sample2.xml](https://takumi1001.github.io/svoml/sample2.xml)

## Usage

1. Clone this repo and open it as the current directory.
```sh
git clone git@github.com:takumi1001/svoml.git
cd svoml
```
2. Create your SVOML file (detail document format is in the following `Syntax` section.). 
```sh
code ./yourfile.xml
```

3. Lanch localhost. 
```sh
python -m http.server
```
**Note:** For security issues, browsers disable XSLT except via HTTP and XSLT must meet the samesite resoruces policy.

5. Open `http://localhost:8000/yourfile.xml` in your browser.

## Syntax
**Look the [schema](https://takumi1001.github.io/svoml/schema/svoml.xsd) for getring detailed syntax.**

### Base Structure
```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="xslt/svoml.xsl" type="text/xsl" ?>

<svoml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="schema/svoml.xsd">
  
    <header></header>

    <body></body>

    <footer></footer>

    <arrows></arrows>
</svoml>
```

**Note:**
 - You have to specify the relative path to `svoml.xsl` at `href` of `xml-stylesheet` (line 2).
 - You have to specify the relative path to `svoml.xsd` at ``xsi:noNamespaceSchemaLocation`` of `svoml` (line 5).
 - `<header>`,`<body>`,`<footer>` and `<arrows>` are not optional and they must meet the order.

### `<header>`, `<footer>`: Header and Footer
Header and footer are free-text (`xsd:string`).

### `<body>` : How to markup?
`body` allows only two type element as children:

- `Group` ... English Sentences.
  - `<g>`,`<h>`,`<s>`,`<v>`,`<o>`,`<c>`
- `Text` ... Free text such as the translation sentences.
  - `<t>`

**Note:** All text have to be in `Group` or `Text`.

For example:
```xml
<body>
    <g>I have a pen.</g>
    <t>私はペンを持っています．</t>
</body>
```

### Groups
![image](https://github.com/takumi1001/svoml/assets/40143183/1a8bb38e-d327-46d0-92be-0ffd1290df52)

All group tags are **nestable** and have `id` attr *optinal*.

 - `<g>` Simple groups.
   - Simple group.
 - `<h>` Hidden groups.
   - This is group, but with no visualize effects. 
   - Useful for covering full of a sentence or setting any words as targets of `arrows`.
 - `<s>`,`<v>`,`<o>`,`<c>` Marked groups.
   - These are groups marked with Subject, Verb, Object or Complement.
  
### Arrows
![image](https://github.com/takumi1001/svoml/assets/40143183/1cafd480-f2e4-4279-a91a-0e74f68495d5)

SVOML supoorts drawing arrows from a group to a group. For example:

```xml
    <body>
        <h>Directed: <g id="sdi">Start</g> <g id="edi">End</g></h>
        <h>Bidirected: <g id="sbi">Start</g> <g id="ebi">End</g></h>
        <h>Undirected <g id="sun">Start</g> <g id="eun">End</g></h>
    </body>
    <footer> ... </footer>
    <arrows>
        <di start="sdi" end="edi"></di>
        <bi start="sbi" end="ebi"></bi>
        <un start="sun" end="eun"></un>
    </arrows>
```

`<di>`, `<bi>` and `<un>` have to be in `<arrows>` and have `start` and `end` attrs. The attrs required groups' `id`.

## VSCode recommended settings

**Schema based lint**
 - Install the [XML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) extension.

**Tag snipets**
Select any words and push `Alt + I` and type any SVOML tags ... it is useful!
 - Enable `editor.emmet.action.wrapWithAbbreviation` shortcuts for example `Alt + i`.
 - Set `emmet.extensionsPath` as the absolute folder path of `emmet/snipets.json`.

## License and limitation.
 - Under MIT license.
 - This is a toy program as we know.
 - Any issues and PRs are welcomed.
 - Reboot vscode.
