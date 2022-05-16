#!/bin/bash

for ns in {1..1000}
do
  mkdir -p configmaps/$ns
  cat > configmaps/$ns/configmaps.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm-3
  namespace: my-ns-$ns
data:
  foo: bar
  bar: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm-4
  namespace: my-ns-$ns
data:
  foo: bar2
  bar: my-ns-$ns

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm3
  namespace: my-ns-$ns
data:
  foo: bar2
  bar: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm4
  namespace: my-ns-$ns
data:
  foo: bar2
  bar: my-ns-$ns
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cm5
  namespace: my-ns-$ns
data:
  foo: bar2
  bar: my-ns-$ns
EOF

done

