XML standards
=============

The XML rules apply only to hand written source XMLs.  This applies to
`XSLT` and `XSD` files as well.

* The XML must be in UTF-8 encoding.
* It must start with an XML declaration of UTF-8 encoding

<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
</pre>

* It should not contain any *tab* characters.
* 4-space indent
* It must end with a blank line.
* Must not have any trailing spaces.

XML files are formatted using the [cleanpom-maven-plugin:cleanxml][1] goal should
satisfy the XML standards.

[1]: http://site.trajano.net/cleanpom-maven-plugin.
