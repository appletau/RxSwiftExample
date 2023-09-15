//: [Previous](@previous)

import Foundation
import RxSwift

struct ForkOperators {
    func subscriptionOnSameObservableWithoutShareOperatorExample() {
        let observable = Observable<Int>.create { observer in
            print("observer_start")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }

        observable
            .subscribe(
                onNext: {print("first_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)

        observable
            .subscribe(
                onNext: { print("second_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)
    }

    func subscriptionOnSameObservableWithShareOperatorExample() {
        let observable = Observable<Int>.create { observer in
            print("observer_start")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }
            .share()

        observable
            .subscribe(
                onNext: {print("first_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)

        observable
            .subscribe(
                onNext: { print("second_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)
    }

    func subscriptionOnSameObservableWithShareRelayOperatorExample() {
        let observable = Observable<Int>.create { observer in
            print("observer_start")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }
            .share(replay: 2)

        observable
            .subscribe(
                onNext: {print("first_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)

        observable
            .subscribe(
                onNext: { print("second_observable_element:\($0)")}
            )
            .disposed(by: disposeBag)
    }

    func subscriptionOnSameObservableWithShareRelayOperatorExample2() {
        let observable = Observable<Int>.create { observer in
            print("observer_start")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            observer.onCompleted()
            return Disposables.create()
        }
            .share(replay: 2)

        observable
            .subscribe(
                onNext: {print("first_observable_element:\($0)")},
                onDisposed: { print("!!!onDisposed") }
            )
            .disposed(by: disposeBag)

        observable
            .subscribe(
                onNext: { print("second_observable_element:\($0)")},
                onDisposed: { print("!!!onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func subscriptionOnSameObservableWithShareRelayOperatorExample3() {
        let observable = Observable<Int>.create { observer in
            print("observer_start")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            observer.onCompleted()
            return Disposables.create()
        }
            .share(replay: 2, scope: .forever)

        observable
            .subscribe(
                onNext: {print("first_observable_element:\($0)")},
                onDisposed: { print("!!!onDisposed") }
            )
            .disposed(by: disposeBag)

        observable
            .subscribe(
                onNext: { print("second_observable_element:\($0)")},
                onDisposed: { print("!!!onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}

playgroundShouldContinueIndefinitely()

let forkOperators = ForkOperators()
//forkOperators.subscriptionOnSameObservableWithoutShareOperatorExample()
//forkOperators.subscriptionOnSameObservableWithShareOperatorExample()
//forkOperators.subscriptionOnSameObservableWithShareRelayOperatorExample()
//forkOperators.subscriptionOnSameObservableWithShareRelayOperatorExample2()
//forkOperators.subscriptionOnSameObservableWithShareRelayOperatorExample3()
//: [Next](@next)

