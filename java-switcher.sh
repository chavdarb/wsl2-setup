#!/usr/bin/env bash
# -------------------------------------------------
# Java version switcher (WSL / Ubuntu)
# Ensures exactly ONE JDK in PATH at all times
# -------------------------------------------------

__set_java() {
  local JAVA_DIR="$1"

  if [ ! -d "$JAVA_DIR" ]; then
    echo "❌ JDK not found: $JAVA_DIR"
    return 1
  fi

  # Remove any existing JDK bin entries from PATH
  PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '^/usr/lib/jvm/' | paste -sd:)

  export JAVA_HOME="$JAVA_DIR"
  export PATH="$JAVA_HOME/bin:$PATH"

  java -version
}

java8()  { __set_java /usr/lib/jvm/java-8-openjdk-amd64; }
java11() { __set_java /usr/lib/jvm/java-1.11.0-openjdk-amd64; }
java17() { __set_java /usr/lib/jvm/java-1.17.0-openjdk-amd64; }
java21() { __set_java /usr/lib/jvm/java-1.21.0-openjdk-amd64; }

javaVersion() {
  echo "JAVA_HOME=$JAVA_HOME"
  command -v java
  java -version
}
