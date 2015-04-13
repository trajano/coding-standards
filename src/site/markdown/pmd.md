PMD Rules
=========

Although most rules defined in PMD are enabled, there are a few exceptions
that are ignored:

* *[DontImportSun](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#DontImportSun)*: There are some valid occurrences that `sun` libraries
  are needed in a large application.
* *[MoreThanOneLogger](pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/logging-java.html#MoreThanOneLogger)*: There will be occasions that another logger will be
  needed, a good one would be to separate fine level debug messages, the 
  main debug log and business audit logs.

Some rules are removed to simplify development.

* *[AtLeastOneConstructor](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#AtLeastOneConstructor)*
  as adding a constructor that does not do anything more than the default just adds unnecessary code.
* *[AvoidFinalLocalVariable](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#AvoidFinalLocalVariable)*
  as there is no valid reason not to use `final` local variables.
* *[AvoidInstantiatingObjectsInLoops](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/optimizations.html#AvoidInstantiatingObjectsInLoops)*
  generally there will be a lot of code that will instantiate objects
  in the loops.  A very common case would be `new String[0]` when
  doing a toArray operation.
* *[AvoidLiteralsInIfCondition](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#AvoidLiteralsInIfCondition)*
  by doing this rule blindly we will be introducing more constants
  that can be useless especially during string manipulations.
* *[DataflowAnomalyAnalysis](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#DataflowAnomalyAnalysis)*
* *[OnlyOneReturn](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/controversial.html#OnlyOneReturn)*
  there are many cases where multiple `return` is valid especially
  common would be in the begining where simple cases can be handled and
  control gets returned back to the caller as soon as possible, otherwise
  there may be too much conditional logic that would be added further.
* *[TooManyStaticImports](http://pmd.sourceforge.net/pmd-5.3.0/pmd-java/rules/java/imports.html#TooManyStaticImports)*
  when using Eclipse to organize imports, this is bound to happen.
