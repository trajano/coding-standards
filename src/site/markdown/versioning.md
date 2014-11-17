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

### OSS Contribution

There may be times when a change to an OSS package is needed.  Contributions
are versioned with a `-trajano-[n]` specifier at the end where `n` is
an internal ID count.

    [UPSTREAM_VERSION]-trajano-[n]

These contributions will be deprecated as soon as the patch get merged to a
released upstream version and are ingored in the [version rules][].

### POM specific rule

For POM only projects, a single digit is used to denote the version with a 
point version representing bugfixes on POMs released to central.

[Semantic Versioning]: http://semver.org/
[version rules]: ./versions.html

