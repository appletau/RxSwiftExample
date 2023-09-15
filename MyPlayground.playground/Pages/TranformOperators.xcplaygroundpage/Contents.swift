import RxSwift
import Foundation

struct TransformOperators {
    typealias Action = String

    func mapExample() {
        print("\n— map example —")

        Observable<Int>.from([1, 2, 3, 4, 5])
            .do(onNext: { print("original: \($0)") })
            .map { $0 * 10 }
            .subscribe(onNext: { print("===> Map Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func flatMapExample() {
        print("\n— flatMap example —")
        let buttonTapEvent = PublishSubject<Int>()

        func triggerAction(_ index: Int) -> Observable<Action> {
            Observable.from(["Fetch_Action", "Update_Action"])
                .do(
                    onNext: { print("* FlatMap Observable (\(index)) Action: \($0)") },
                    onCompleted: { print("* FlatMap Observable (\(index)) Completed\n") },
                    onDispose: { print("* FlatMap Observable (\(index)) Disposed\n") }
                )
        }

        buttonTapEvent
            .flatMap { triggerAction($0) }
            .subscribe(
                onNext: { action in print("===> Main Observable Action: \(action)\n") },
                onCompleted: { print("===> Main Observable Completed\n") },
                onDisposed: { print("===> Main Observable Disposed\n") }
            )
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
    }

    func flatMapErrorExample() {
        print("\n— flatMap: Error example —")
        let buttonTapEvent = PublishSubject<Int>()

        func triggerAction(_ index: Int) -> Observable<Action> {
            Observable.error(NSError(domain: "ActionError", code: 0))
                .do(
                    onError: { print("* FlatMap Observable (\(index)) Error: \($0)\n") },
                    onDispose: { print("* FlatMap Observable (\(index)) Disposed\n") }
                )
        }

        buttonTapEvent
            .flatMap { triggerAction($0) }
            .subscribe(
                onError: { print("===> Main Observable Error: \($0)\n") },
                onDisposed: { print("===> Main Observable Disposed\n") }
            )
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
    }

    func flatMapCatchErrorExample1() {
        print("\n— flatMap: Catch Error 1 example —")
        let buttonTapEvent = PublishSubject<Int>()

        func triggerAction(_ index: Int) -> Observable<Action> {
            Observable.error(NSError(domain: "ActionError", code: 0))
                .do(
                    onError: { print("* FlatMap Observable (\(index)) Error: \($0)\n") },
                    onDispose: { print("* FlatMap Observable (\(index)) Disposed\n") }
                )
        }

        buttonTapEvent
            .flatMap { triggerAction($0) }
            .catchAndReturn("Catch Error on Main Observable")
            .subscribe(
                onNext: { action in print("===> Main Observable Action: \(action)\n") },
                onError: { print("===> Main Observable Error: \($0)\n") },
                onDisposed: { print("===> Main Observable Disposed\n") }
            )
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
    }

    func flatMapCatchErrorExample2() {
        print("\n— flatMap: Catch Error 2 example —")
        let buttonTapEvent = PublishSubject<Int>()

        func triggerAction(_ index: Int) -> Observable<Action> {
            Observable.error(NSError(domain: "ActionError", code: 0))
                .catchAndReturn("Catch Error on FlatMap Observable")
                .do(
                    onError: { print("* FlatMap Observable (\(index)) Error: \($0)\n") },
                    onDispose: { print("* FlatMap Observable (\(index)) Disposed\n") }
                )
        }

        buttonTapEvent
            .flatMap { triggerAction($0) }
            .subscribe(
                onNext: { action in print("===> Main Observable Action: \(action)\n") },
                onError: { print("===> Main Observable Error: \($0)\n") },
                onDisposed: { print("===> Main Observable Disposed\n") }
            )
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
    }

    func flatMapLatestExample() {
        print("\n— flatMapLatest example —")
        let buttonTapEvent = PublishSubject<Int>()

        func triggerAction(_ index: Int) -> Observable<Action> {
            Observable.from(["Fetch_Action", "Update_Action"])
                .delay(.seconds(1), scheduler: MainScheduler.instance)
                .do(
                    onNext: { print("* FlatMap Observable (\(index)) Action: \($0)") },
                    onCompleted: { print("* FlatMap Observable (\(index)) Completed\n") },
                    onDispose: { print("* FlatMap Observable (\(index)) Disposed\n") }
                )
        }

        buttonTapEvent
            .flatMapLatest { triggerAction($0) }
            .subscribe(
                onNext: { action in print("===> Main Observable Action: \(action)\n") },
                onCompleted: { print("===> Main Observable Completed\n") },
                onDisposed: { print("===> Main Observable Disposed\n") }
            )
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
    }

    func withLatestFromExample() {
        print("\n— withLatestFrom example —")
        let buttonTapEvent = PublishSubject<Int>()
        let name = BehaviorSubject(value: "Ben")

        buttonTapEvent
            .do(onNext: { print("original: \($0)") })
            .withLatestFrom(name, resultSelector: { index, name in "(\(index)) \(name)" })
            .subscribe(onNext: { result in print("===> With Latest From Result: \(result)\n") })
            .disposed(by: disposeBag)

        buttonTapEvent.onNext(1)
        buttonTapEvent.onNext(2)
        name.onNext("Steven")
        buttonTapEvent.onNext(2)
        buttonTapEvent.onNext(3)
    }

    func scanExample() {
        print("\n— scanExample example —")
        Observable<Int>.from([1, 2, 3, 4, 5])
            .scan(0, accumulator: { $0 + $1 })
            .subscribe(onNext: { result in print("===> Scan Result: \(result)\n") })
            .disposed(by: disposeBag)
    }

    let disposeBag: DisposeBag = .init()
}

playgroundShouldContinueIndefinitely()

let transformOperators = TransformOperators()

//transformOperators.mapExample()
//transformOperators.flatMapExample()
//transformOperators.flatMapErrorExample()
//transformOperators.flatMapCatchErrorExample1()
//transformOperators.flatMapCatchErrorExample2()
//transformOperators.flatMapLatestExample()
//transformOperators.withLatestFromExample()
//transformOperators.scanExample()
//: [Next](@next)

