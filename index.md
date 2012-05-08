---
layout: default
title: Spice-King's Maven Repository
---

### Spice-King's Maven Repository

Please use [my release maven repository](./releases/) not [my snapshot maven repository](./snapshots) unless you know what you are doing! Add this to your pom.xml file to use my repository:
{% highlight xml %}
<project>
    ...
    <repository>
        ...
        <repository>
            <id>spice-king-repo</id>
            <url>http://spice-king.github.com/mavenrepository/releases/</url>
        </repository>
    </repositories>
    ...
</project>
{% endhighlight %}
