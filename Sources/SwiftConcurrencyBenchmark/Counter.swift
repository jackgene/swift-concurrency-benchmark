actor Counter {
    private(set) var count: UInt = 0

    func increment() {
        self.count += 1
    }
}
