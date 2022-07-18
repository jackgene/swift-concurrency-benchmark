# SwiftConcurrencyBenchmark

Run benchmark:
```shell
swift run -c release SwiftConcurrencyBenchmark run --cycles 5 --min-size 1k --max-size 4M out/run.json
```

Rander Chat:
```shell
swift run -c release SwiftConcurrencyBenchmark render out/run.json out/run.png
```
