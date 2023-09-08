import UIKit
import RxSwift
import RxCocoa

struct Observables {
    func createObservableExample() {
        Observable<Int>.create { observer in
            observer.onNext(1)
            observer.onNext(2)
            return Disposables.create()
        }
        .subscribe(
            onNext: { print("===> onNext:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createObservableWithCompleteEventExample() {
        Observable<Int>.create { observer in
            observer.onCompleted()
            return Disposables.create()
        }
        .subscribe(
            onNext: { print("===> onNext:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createObservableWithErrorEventExample() {
        Observable<Int>.create { observer in
            observer.onError(NSError(domain: "Observable Error", code: 0))
            return Disposables.create()
        }
        .subscribe(
            onNext: { print("===> onNext:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createSingleExample() {
        Single<Int>.create { observer in
            observer(.success(1))
            return Disposables.create()
        }
        .subscribe(
            onSuccess: { print("===> onSuccess:\($0)") },
            onFailure: { print("===> onFailure:\($0)") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createSingleWithFailureEventExample() {
        Single<Int>.create { observer in
            observer(.failure(NSError(domain: "Single Error", code: 0)))
            return Disposables.create()
        }
        .subscribe(
            onSuccess: { print("===> onSuccess:\($0)") },
            onFailure: { print("===> onFailure:\($0)") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createMaybeExample() {
        Maybe<Int>.create { observer in
            observer(.success(1))
            return Disposables.create()
        }
        .subscribe(
            onSuccess: { print("===> onSuccess:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createMaybeWithCompleteEventExample() {
        Maybe<Int>.create { observer in
            observer(.completed)
            return Disposables.create()
        }
        .subscribe(
            onSuccess: { print("===> onSuccess:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createMaybeWithErrorEventExample() {
        Maybe<Int>.create { observer in
            observer(.error(NSError(domain: "Maybe Error", code: 0)))
            return Disposables.create()
        }
        .subscribe(
            onSuccess: { print("===> onSuccess:\($0)") },
            onError: { print("===> onError:\($0)") },
            onCompleted: { print("===> onCompleted") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createCompletableExample() {
        Completable.create { observer in
            observer(.completed)
            return Disposables.create()
        }
        .subscribe(
            onCompleted: { print("===> onCompleted") },
            onError: { print("===> onError:\($0)") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createCompletableWithErrorEventExample() {
        Completable.create { observer in
            observer(.error(NSError(domain: "Completable Error", code: 0)))
            return Disposables.create()
        }
        .subscribe(
            onCompleted: { print("===> onCompleted") },
            onError: { print("===> onError:\($0)") },
            onDisposed: { print("===> onDisposed") }
        )
        .disposed(by: disposeBag)
    }

    func createDriverExample() {
        let driver = Observable<Int>.create { observer in
            DispatchQueue.global().async {
                print("===> Thread Current 1:\(Thread.current)")
                observer.onNext(1)
                observer.onNext(2)
            }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: 100)

        func secondSubscription() {
            driver
                .drive(
                onNext: { print("===> second_onNext:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
        }

        driver
            .drive(
                onNext: {
                    if $0 == 1 {
                        print("===> Thread Current 2:\(Thread.current)")
                    }
                    print("===> first_onNext:\($0)")
                    if $0 == 2 {
                        secondSubscription()
                    }
                },
                onCompleted: { print("===> first_onCompleted") },
                onDisposed: { print("===> first_onDisposed") }
            )
        .disposed(by: disposeBag)
    }

    func createDriverWithErrorEventExample() {
        let driver = Observable<Int>.create { observer in
            DispatchQueue.global().async {
                print("===> Thread Current 1:\(Thread.current)")
                observer.onNext(1)
                observer.onNext(2)
                observer.onError(NSError(domain: "Driver Error", code: 0))
            }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: 100)

        func secondSubscription() {
            driver
                .drive(
                onNext: { print("===> second_onNext:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
        }

        driver
            .drive(
                onNext: {
                    if $0 == 1 {
                        print("===> Thread Current 2:\(Thread.current)")
                    }
                    print("===> first_onNext:\($0)")
                    if $0 == 2 {
                        secondSubscription()
                    }
                },
                onCompleted: { print("===> first_onCompleted") },
                onDisposed: { print("===> first_onDisposed") }
            )
        .disposed(by: disposeBag)
    }

    func createSignalExample() {
        let signal = Observable<Int>.create { observer in
            DispatchQueue.global().async {
                print("===> Thread Current 1:\(Thread.current)")
                observer.onNext(1)
                observer.onNext(2)
            }
            return Disposables.create()
        }.asSignal(onErrorJustReturn: 100)

        func secondSubscription() {
            signal
                .emit(
                onNext: { print("===> second_onNext:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
        }

        signal
            .emit(
                onNext: {
                    if $0 == 1 {
                        print("===> Thread Current 2:\(Thread.current)")
                    }
                    print("===> first_onNext:\($0)")
                    if $0 == 2 {
                        secondSubscription()
                    }
                },
                onCompleted: { print("===> first_onCompleted") },
                onDisposed: { print("===> first_onDisposed") }
            )
        .disposed(by: disposeBag)
    }

    func createSignalWithErrorEventExample() {
        let signal = Observable<Int>.create { observer in
            DispatchQueue.global().async {
                print("===> Thread Current 1:\(Thread.current)")
                observer.onNext(1)
                observer.onNext(2)
                observer.onError(NSError(domain: "Signal Error", code: 0))
            }
            return Disposables.create()
        }.asSignal(onErrorJustReturn: 100)

        func secondSubscription() {
            signal
                .emit(
                onNext: { print("===> second_onNext:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
        }

        signal
            .emit(
                onNext: {
                    if $0 == 1 {
                        print("===> Thread Current 2:\(Thread.current)")
                    }
                    print("===> first_onNext:\($0)")
                    if $0 == 2 {
                        secondSubscription()
                    }
                },
                onCompleted: { print("===> first_onCompleted") },
                onDisposed: { print("===> first_onDisposed") }
            )
        .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}
playgroundShouldContinueIndefinitely()

let observables = Observables()

//observables.createObservableExample()
//observables.createObservableWithCompleteEventExample()
//observables.createObservableWithErrorEventExample()
//observables.createSingleExample()
//observables.createSingleWithFailureEventExample()
//observables.createMaybeExample()
//observables.createMaybeWithCompleteEventExample()
//observables.createMaybeWithErrorEventExample()
//observables.createCompletableExample()
//observables.createCompletableWithErrorEventExample()
//observables.createDriverExample()
//observables.createDriverWithErrorEventExample()
//observables.createSignalExample()
//observables.createSignalWithErrorEventExample()

//: [Next](@next)
