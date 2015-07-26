Build properties
================

Maven allows for additional [build properties][1] to be defined in the [POM][2]
under the `<properties>` tag.  This documents the standard that would be
followed and the general exceptions.

### General rules

Note that it is not mandated that all versions should be properties.  In fact
doing it would create another level of indirection which we would want to
avoid especially since it is not common that there would be a dependency
version interdependence.

<table>
  <tr>
    <th>Format</th>
    <th>Example</th>
    <th>Usage</th>
  </tr>
  <tr>
    <td><em>dependencyGroupId</em><code>.version</code></td>
    <td><code>selenium.version</code></td>
    <td><p>Versions for two or more dependencies that are tied to one another. 
        The <em>dependencyGroupId</em> would be the last component of the 
	<code>groupId</code> for example <code>org.seleniumhq.selenium</code> 
	would just be <code>selenium</code>.</p>

        <p>Should there be a plugin that relies on the same version as a
        dependency, then only use the dependency version rather than 
        making a new property for the plugin.</p></td>
  </tr>
  <tr>
    <td><em>mainPluginId</em><code>-plugin.version</code></td>
    <td><code>surefire-plugin.version</code></td>
    <td>Versions for two or more plugins that are tied to one another.
        The <em>mainPluginId</em> is generally derived from the shortest 
        possible segment on the <code>artifactId</code>.</td>
  </tr>
</table>

### Specific exception rules

<table>
  <tr>
    <th>Format</th>
    <th>Usage</th>
  </tr>
  <tr>
    <td><code>jdk.version</code></td>
    <td>Version of the JDK used in <a href="http://maven.apache.org/plugins/maven-compiler-plugin/">maven-compiler-plugin</a> 
        and <a href="http://maven.apache.org/plugins/maven-pmd-plugin/">maven-pmd-plugin</a>.
        The wording <code>jdk</code> was used as it has a value of <code>1.x</code> rather than the
	marketting terms 6.0, 7.0, 8.0 in which case that would be <code>java.version</code>.</td>
  </tr>
  <tr>
    <td><code>maven.version</code></td>
    <td>Version of the Maven API when working with plugins.</td>
  </tr>
  <tr>
    <td><code>coding-standards.version</code></td>
    <td>Version of the [coding standards][3] being enforced by the plugins.</td>
  </tr>
</table>

[1]: https://maven.apache.org/guides/introduction/introduction-to-the-pom.html#Project_Interpolation
[2]: ./pom.html
[3]: http://site.trajano.net/coding-standards/
