Versioning standards
====================

The organization uses the first three segments of [Semantic Versioning][] for
any artifact that is not POM only.

The version segment is organized as follows and all three segments are required.

    [MAJOR].[MINOR].[PATCH]

The rules for incrementing the different version segments are:

* `MAJOR` version when incompatible *public* API changes are made,
* `MINOR` version when functionality is added in a backwards-compatible manner, and
* `PATCH` version when you make backwards-compatible bug or build fixes.

### What constitutes as public API

* In Java sources, any class that is not in a package with `internal`
* XML Schema
* WSDL

### Development snapshots

Development snapshots add a `-SNAPSHOT` specifier at the end.

    [MAJOR].[MINOR].[PATCH]-SNAPSHOT

### POM specific rule

For POM only projects, a single digit is used to denote the version with a
point version representing bugfixes on POMs released to central.

This rule does not apply to multi-module project root POMs.

[Semantic Versioning]: http://semver.org/
[version rules]: ./versions.html

