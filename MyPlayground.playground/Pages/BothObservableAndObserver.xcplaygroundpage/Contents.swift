//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

struct BothObservableAndObserver {
    func createPublishSubjectExample() {
        let publishSubject = PublishSubject<Int>()

        publishSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        publishSubject.onNext(1)

        publishSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createPublishSubjectWithErrorEventExample() {
        let publishSubject = PublishSubject<Int>()

        publishSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        publishSubject.onError(NSError(domain: "Publish Subject Error", code: 0))

        publishSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createPublishSubjectWithCompletedEventExample() {
        let publishSubject = PublishSubject<Int>()

        publishSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        publishSubject.onCompleted()

        publishSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createBehaviorSubjectExample() {
        let behaviorSubject = BehaviorSubject<Int>(value: 0)

        behaviorSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        behaviorSubject.onNext(1)

        behaviorSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }


    func createBehaviorSubjectWithErrorEventExample() {
        let behaviorSubject = BehaviorSubject<Int>(value: 0)

        behaviorSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        behaviorSubject.onError(NSError(domain: "Behavior Subject Error", code: 0))

        behaviorSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createBehaviorSubjectWithCompletedEventExample() {
        let behaviorSubject = BehaviorSubject<Int>(value: 0)

        behaviorSubject
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        behaviorSubject.onCompleted()

        behaviorSubject
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func getValueFromBehaviorSubject() {
        let behaviorSubject = BehaviorSubject<Int>(value: 0)
        print("===> behavior subject value:\(try? behaviorSubject.value())")
    }

    func createReplaySubject() {
        let replaySubject = ReplaySubject<Int>.create(bufferSize: 2)

        replaySubject.onNext(0)
        replaySubject.onNext(1)
        replaySubject.onNext(2)

        replaySubject
            .subscribe(
                onNext: { print("===> first_subscription_onNext:\($0)") }
            )
            .disposed(by: disposeBag)

        replaySubject.onNext(3)

        replaySubject
            .subscribe(
                onNext: { print("===> second_subscription_onNext:\($0)") }
            )
            .disposed(by: disposeBag)

        replaySubject.onNext(4)
    }

    func createPublishRelayExample() {
        let publishRelay = PublishRelay<Int>()

        publishRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        publishRelay.accept(1)

        publishRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createPublishRelayWithErrorEventExample() {
        let publishRelay = PublishRelay<Int>()

        publishRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        Observable.error(NSError(domain: "Publish Relay Error", code: 0))
            .bind(to: publishRelay)
            .disposed(by: disposeBag)

        publishRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createPublishRelayWithCompletedEventExample() {
        let publishRelay = PublishRelay<Int>()

        publishRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        Observable.empty()
            .do(onCompleted: { publishRelay.accept(1) })
            .bind(to: publishRelay)
            .disposed(by: disposeBag)

        publishRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)

        publishRelay.accept(1)
    }

    func convertPublishRelayToSignal() {
        let publishRelay = PublishRelay<Int>()

        publishRelay
            .asSignal()
            .emit(
                onNext: { print("===> onNext:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        publishRelay.accept(1)
    }

    func createBehaviorRelayExample() {
        let behaviorRelay = BehaviorRelay<Int>(value: 0)

        behaviorRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        behaviorRelay.accept(1)

        behaviorRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }


    func createBehaviorRelayWithErrorEventExample() {
        let behaviorRelay = BehaviorRelay<Int>(value: 0)

        behaviorRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        Observable.error(NSError(domain: "Behavior Relay Error", code: 0))
            .bind(to: behaviorRelay)
            .disposed(by: disposeBag)

        behaviorRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func createBehaviorRelayWithCompletedEventExample() {
        let behaviorRelay = BehaviorRelay<Int>(value: 0)

        behaviorRelay
            .subscribe(
                onNext: { print("===> onNext:\($0)") },
                onError: { print("===> onError:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        Observable.empty()
            .do(onCompleted: { behaviorRelay.accept(1) })
            .bind(to: behaviorRelay)
            .disposed(by: disposeBag)

        behaviorRelay
            .subscribe(
                onNext: { print("===> second_onNext:\($0)") },
                onError: { print("===> second_onError:\($0)") },
                onCompleted: { print("===> second_onCompleted") },
                onDisposed: { print("===> second_onDisposed") }
            )
            .disposed(by: disposeBag)
    }

    func getValueFromBehaviorRelay() {
        let behaviorRelay = BehaviorRelay<Int>(value: 0)
        print("===> behavior relay value:\(behaviorRelay.value))")
    }

    func convertBehaviorRelayToDriver() {
        let behaviorRelay = BehaviorRelay<Int>(value: 0)

        behaviorRelay
            .asDriver()
            .drive(
                onNext: { print("===> onNext:\($0)") },
                onCompleted: { print("===> onCompleted") },
                onDisposed: { print("===> onDisposed") }
            )
            .disposed(by: disposeBag)

        behaviorRelay.accept(1)
    }

    private let disposeBag: DisposeBag = .init()
}
playgroundShouldContinueIndefinitely()

let bothObservableAndObserver = BothObservableAndObserver()
//bothObservableAndObserver.createPublishSubjectExample()
//bothObservableAndObserver.createPublishSubjectWithCompletedEventExample()
//bothObservableAndObserver.createPublishSubjectWithErrorEventExample()
//bothObservableAndObserver.createBehaviorSubjectExample()
//bothObservableAndObserver.createBehaviorSubjectWithErrorEventExample()
//bothObservableAndObserver.createBehaviorSubjectWithCompletedEventExample()
//bothObservableAndObserver.getValueFromBehaviorSubject()
//bothObservableAndObserver.createReplaySubject()
//bothObservableAndObserver.createPublishRelayExample()
//bothObservableAndObserver.createPublishRelayWithErrorEventExample()
//bothObservableAndObserver.createPublishRelayWithCompletedEventExample()
//bothObservableAndObserver.convertPublishRelayToSignal()
//bothObservableAndObserver.createBehaviorRelayExample()
//bothObservableAndObserver.createBehaviorRelayWithErrorEventExample()
//bothObservableAndObserver.createBehaviorRelayWithCompletedEventExample()
//bothObservableAndObserver.getValueFromBehaviorRelay()
//bothObservableAndObserver.convertBehaviorRelayToDriver()
//: [Next](@next)
