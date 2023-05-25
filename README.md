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
3. Lanch localhost (For security issues, browsers disable XSLT except via HTTP.). 
```sh
python -m http.server
```
5. Open `http://localhost:8000/yourfile.xml` in your browser.

