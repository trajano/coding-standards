PMD Rules
=========

Although most rules defined in PMD are enabled, there are a few exceptions
that are ignored:

* *[DontImportSun][]*: There are some valid occurrences that `sun` libraries
  are needed in a large application.
* *[MoreThanOneLogger][]*: There will be occasions that another logger will be
  needed, a good one would be to separate fine level debug messages, the 
  main debug log and business audit logs.

Some rules are removed to make developer's life a little more sane.

* *[AtLeastOneConstructor][]*
* *[AvoidFinalLocalVariable][]*
* *[AvoidInstantiatingObjectsInLoops][]*
* *[AvoidLiteralsInIfCondition][]*
* *[DataflowAnomalyAnalysis][]*
* *[NullAssignment][]*
* *[OnlyOneReturn][]*
* *[TooManyStaticImports][]*
