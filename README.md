# svoml

SVOML is the sentence pattern markup language based on XML Schema and XSL.

See samples: [sample1](https://takumi1001.github.io/svoml/sample1.xml) [sample2](https://takumi1001.github.io/svoml/sample2.xml)

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
**Note:** you have to create SVOML files in svoml root directory `./` same as sample files.

3. Lanch localhost. 
```sh
python -m http.server
```
**Note:** For security issues, browsers disable XSLT except via HTTP and XSLT must meet the samesite resoruces policy.

5. Open `http://localhost:8000/yourfile.xml` in your browser.

## Document format

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
The tags above is all required. You can start to write svoml by the base structure.

### header, footer
Header and footer are free-text (`xsd:string`).

### body
