//: [Previous](@previous)

import Foundation
import RxSwift

struct SchedulingOperators {
    func observeOnMainSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func observeOnSerialSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .observe(on: SerialDispatchQueueScheduler(qos: .background))
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func observeOnConcurrentSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .observe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func observeOnMainSchedulerWithTwoDataStreamExample() {
        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func observeOnSerialSchedulerWithTwoDataStreamExample() {
        let scheduler = SerialDispatchQueueScheduler(qos: .background)

        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .observe(on: scheduler)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .observe(on: scheduler)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func observeOnConcurrentSchedulerWithTwoDataStreamExample() {
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)

        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .observe(on: scheduler)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .observe(on: scheduler)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnMainSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .subscribe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnSerialSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .subscribe(on: SerialDispatchQueueScheduler(qos: .background))
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnConcurrentSchedulerExample() {
        Observable<Int>.create { observer in
            print("!!!Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        .subscribe(onNext: {
            print("!!!index\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!index\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnMainSchedulerWithTwoDataStreamExample() {
        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .subscribe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .subscribe(on: MainScheduler.instance)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnSerialSchedulerWithTwoDataStreamExample() {
        let scheduler = SerialDispatchQueueScheduler(qos: .background)

        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .subscribe(on: scheduler)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .subscribe(on: scheduler)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func subscribeOnConcurrentSchedulerWithTwoDataStreamExample() {
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)

        Observable<Int>.create { observer in
            print("!!!Stream1_Observer_Thread:\(Thread.current)")
            observer.onNext(1)
            observer.onNext(3)
            return Disposables.create()
        }
        .subscribe(on: scheduler)
        .subscribe(onNext: {
            print("!!!odd\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!odd\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)

        Observable<Int>.create { observer in
            print("!!!Stream2_Observer_Thread:\(Thread.current)")
            observer.onNext(2)
            observer.onNext(4)
            return Disposables.create()
        }
        .subscribe(on: scheduler)
        .subscribe(onNext: {
            print("!!!even\($0)_Thread:\(Thread.current)")
            for i in 0...4 {
                print("!!!even\($0): \(i)")
            }
        })
        .disposed(by: disposeBag)
    }

    func mixUseOfSubscribeOnAndObserveOn() {
        Observable<Int>.create { observer in
            print("!!!Thread1:\(Thread.current)")
            observer.onNext(1)
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .do(onNext: { _ in print("!!!Thread2:\(Thread.current)") })
        .observe(on: ConcurrentDispatchQueueScheduler.init(qos: .background))
        .do(onNext: { _ in print("!!!Thread3:\(Thread.current)") })
        .observe(on: MainScheduler.instance)
        .do(onNext: { _ in print("!!!Thread4:\(Thread.current)") })
        .subscribe(on: ConcurrentDispatchQueueScheduler.init(qos: .background))
        .subscribe(onNext: { _ in
                print("!!!Thread5:\(Thread.current)")
        })
        .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}

playgroundShouldContinueIndefinitely()

let schedulingOperators = SchedulingOperators()

//schedulingOperators.observeOnMainSchedulerExample()
//schedulingOperators.observeOnSerialSchedulerExample()
//schedulingOperators.observeOnConcurrentSchedulerExample()
//schedulingOperators.observeOnMainSchedulerWithTwoDataStreamExample()
//schedulingOperators.observeOnSerialSchedulerWithTwoDataStreamExample()
//schedulingOperators.observeOnConcurrentSchedulerWithTwoDataStreamExample()
//schedulingOperators.subscribeOnMainSchedulerExample()
//schedulingOperators.subscribeOnSerialSchedulerExample()
//schedulingOperators.subscribeOnConcurrentSchedulerExample()
//schedulingOperators.subscribeOnMainSchedulerWithTwoDataStreamExample()
//schedulingOperators.subscribeOnSerialSchedulerWithTwoDataStreamExample()
//schedulingOperators.subscribeOnConcurrentSchedulerWithTwoDataStreamExample()
//schedulingOperators.mixUseOfSubscribeOnAndObserveOn()
//: [Next](@next)
