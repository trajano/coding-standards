Java code style
===============

The code styles are  enforced by SonarQube rather than CheckStyle, PMD or Findbugs.  In addition, on the [M2E][4] environment, the [m2e-codestyle-maven-plugin][5] was developed to set up the general coding styles used by the organization.  These code styles are automatically applied on Save actions on the Eclipse IDE where technically possible.

The intent of this code style implementations is primarily to make merges
easier by leaving the formatting and sort order out of the hands of the
developers.

Java and XML code artifacts are also formatted by [m2e-codestyle-maven-plugin][5] and [cleanpom-maven-plugin][6] during a build to ensure consistency.  Note that [m2e-codestyle-maven-plugin][5] will  reformat the code using the formatting rules only (i.e. cleanup rules are not executed).

These rules are codified as XMLs that can be imported into Eclipse as-is.

### Cleanup rules

A majority of the code cleanup rules are enabled.  These would resolve
many immediate issues with [Checkstyle][1], [PMD][2] and [FindBugs][3].

* Remove `this` qualifier for non static field accesses
* Remove `this` qualifier for non static method accesses
* Change non static accesses to static members using declaring type
* Change indirect accesses to static members to direct accesses (accesses through subtypes)
* Convert control statement bodies to block
* Convert `for` loops to enhanced `for` loops
* Add `final` modifier to method parameters
* Add `final` modifier to local variables
* Use lambda where possible
* Remove unnecessary parentheses
* Remove unused imports
* Add missing `@Override` annotations
* Add missing `@Override` annotations to implementations of interface methods
* Add missing `@Deprecated` annotations
* Add missing serial version ID (generated)
* Remove unnecessary casts
* Remove unnecessary `$NON-NLS$` tags
* Sort all members
* Organize imports
* Format source code
* Remove trailing white spaces on all lines

### Indents, braces and blank lines

The organization will use the [One True Brace Style [1TBS]][7] with
**4 spaces** indents.  *Tab* characters should not be used.

    if (x < 0) {
        puts("Negative");
        negative(x);
    } else {
        puts("Non-negative");
    }

Code scope is denoted consistently by moving forward by only
**one indent**.

There is a limit of one for consecutive blank lines and a blank line is
introduced at the beginning of the method.  Ideally there would be a blank
line before the end of the method, but the [Eclipse formatter at present
does not support this option](https://bugs.eclipse.org/bugs/show_bug.cgi?id=522089).

### Line breaks

The general rule is to always put a line break even if there is still room
with the exception of the first entry.  This makes it easier to add new
parameters and see the parameter order visually.

This applies to annotations:

    @Mojo(name = "configure",
        defaultPhase = LifecyclePhase.INITIALIZE,
        threadSafe = true,
        requiresOnline = false)
    @SupressWarnings("unchecked")

This applies to methods and constructors:

    public boolean process(final Set<? extends TypeElement> annotations,
        final RoundEnvironment roundEnv) {
        ...
    }

    public boolean processFile(final String fileName) {
        ...
    }

This applies to `enum`s:

    enum Example {
        CANCELLED,
        RUNNING,
        WAITING,
        FINISHED
    }

    enum Example {
        GREEN(0, 255, 0),
        RED(255, 0, 0)
    }

This applies to array initializers:

    private static final String[] DEFAULT_PREFS = { "org.eclipse.core.resources.prefs",
        "org.eclipse.jdt.core.prefs",
        "org.eclipse.jdt.ui.prefs",
        "org.eclipse.wst.jsdt.core.prefs",
        "org.eclipse.wst.jsdt.ui.prefs", };

This applies to super interfaces:

    public class DtdResolver implements
        EntityResolver,
        ContentHandler {
        ...
    }

This applies to `throws` declarations:

    private TransformerHandler buildHandlerChain(
        final SAXTransformerFactory tf,
        final OutputStream outputStream)
            throws IOException,
            TransformerException {
        ...
    }

### Position of operators when doing line breaks

The position of operator characters short of `,` should be on the beginning
of the wrapped line for example:

    int foo = 1
        + 2
        + 3;

This also applies in multi-catch

    try {
        ...
    } catch (final SAXException
        | IOException e) {
        ...
    }

### Exception to line break rules

The exceptions to the line break rules are present to enable the developer
to decide whether to put line breaks or not on specific parts of the code
as line breaks do not always make sense in all places and may make the
code even harder to read.

The code formatter does not automatically join wrapped lines so manual
wrapping would take place.  However, there is still a hard limit of
`800` characters per line.

In addition function/method calls do not implicitly add the line breaks.

### JavaDoc and block comments

These comments are formatted to a width of `80` characters.  They are
also applied to header JavaDoc comments which are present in
`package-info.java` files.

### Line comments

These comments are left as-is.  The premise is that these are developer
notes and formatting should be left the way they understood it to be.

[1]: ./checkstyle.html
[2]: ./pmd.html
[3]: ./findbugs.html
[4]: http://eclipse.org/m2e/
[5]: http://site.trajano.net/m2e-codestyle-maven-plugin/
[6]: http://site.trajano.net/cleanpom-maven-plugin/
[7]: http://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS

