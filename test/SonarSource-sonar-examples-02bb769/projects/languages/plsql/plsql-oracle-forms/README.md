This example demonstrates how to analyze PL/SQL from Oracle Forms.

Prerequisites
=============
* [SonarQube](http://www.sonarsource.org/downloads/) 3.7.1 or higher
* [SonarQube Runner](http://docs.codehaus.org/x/N4KxDQ) 2.3 or higher
* [SonarSource PL/SQL Plugin](http://www.sonarsource.com/products/plugins/languages/plsql/) 2.6 or higher
* [SonarQube Oracle Forms PL/SQL Extractor](http://docs.codehaus.org/pages/viewpage.action?pageId=239370845) 1.0 or higher

Usage
=====
* Extract the PL/SQL source code from your Oracle Forms. Let's say that you downloaded the project sample to C:\plsql-oracle-forms.

        set FORMS_PATH=C:\plsql-oracle-forms\forms
		java -DinputDir=C:\plsql-oracle-forms\forms -DoutputDir=C:\plsql-oracle-forms\src  -cp C:\path\to\sonar-forms-plsql-extractor-X.X-jar-with-dependencies.jar;C:\path\to\oracle\forms\java\frmjdapi.jar org.sonar.oracleforms.plsql.PlSqlExtractor

* Analyze the project with SonarQube using the SonarQube Runner:

        sonar-runner
