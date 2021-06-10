# Setting System Properties in Gradle

## System Properties for Gradle

To set system properties for the JVM in which Gradle is running, add the system properties to `gradle.properties`.

### Example

```
org.gradle.daemon=true
org.gradle.parallel=false
org.gradle.configureondemand=true
org.gradle.jvmargs=-Xmx2048m -Xss2048k -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
```

## System Properties for Application Compiled by Gradle

If the project is configured to use the `application` plugin, system properties can be added via the `run` task:
```
run {
    systemProperties['property'] = 'value'
}
```
