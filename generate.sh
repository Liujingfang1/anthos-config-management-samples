#!/bin/bash

for ns in {1..5000}
do
  mkdir -p configmaps/$ns
  cat > configmaps/$ns/configmaps.yaml <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm-1
  namespace: my-ns-$ns
data:
  foo: bar
  bar: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm-2
  namespace: my-ns-$ns
data:
  foo: bar2
  bar: my-ns-$ns
EOF

done

