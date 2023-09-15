//: [Previous](@previous)
import Foundation
import RxSwift

struct TimeManipulationOperators {
    func delayExample() {
        Observable<Int>.create { observer in
            print("start_time:\(Date())")
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }
        .delay(.seconds(5), scheduler: MainScheduler.instance)
        .subscribe(onNext: {
            print("element:\($0)_time:\(Date())")
        })
        .disposed(by: disposeBag)
    }

    func debounceExample() {
        Observable<Int>.create { observer in
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }
        .debounce(.seconds(1), scheduler: MainScheduler.instance)
        .subscribe(onNext: {
            print("element:\($0)")
        })
        .disposed(by: disposeBag)
    }

    func throttleExample() {
        Observable<Int>.create { observer in
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            return Disposables.create()
        }
        .throttle(.seconds(1), scheduler: MainScheduler.instance)
        .subscribe(onNext: {
            print("element:\($0)")
        })
        .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}

playgroundShouldContinueIndefinitely()

let timeManipulationOperators = TimeManipulationOperators()
//timeManipulationOperators.delayExample()
//timeManipulationOperators.debounceExample()
//timeManipulationOperators.throttleExample()
//: [Next](@next)

