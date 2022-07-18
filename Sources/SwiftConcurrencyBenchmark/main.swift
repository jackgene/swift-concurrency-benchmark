import CollectionsBenchmark
import Foundation
import struct _Concurrency.Task

var benchmark = Benchmark(title: "Counter")

func incrementCounter(counter: Counter, count: Int) async {
    for _ in 0..<count {
        await counter.increment()
    }
}

func incrementCounter(counter: Counter, count: Int, concurrency: Int) {
    let countPerThread = count / concurrency
    let semaphore = DispatchSemaphore(value: 0)

    Task {
        for _ in 1...concurrency {
            await incrementCounter(counter: counter, count: countPerThread)
            semaphore.signal()
        }
    }

    for _ in 1...concurrency {
        semaphore.wait()
    }
}

benchmark.add(
    title: "Concurrent Increment",
    input: Int.self
) { input in
    return { timer in
        blackHole(
            incrementCounter(counter: Counter(), count: input, concurrency: 10)
        )
    }
}

benchmark.main()
