//: [Previous](@previous)

import UIKit
import RxSwift

struct Observers {
    func createObserverExample() {
        let observer: AnyObserver<Int> = .init { event in
            switch event {
            case .next(let element):
                print("===> observer_element:\(element)")
            case .completed:
                print("===> observer_completed")
            case .error(let error):
                print("===> observer_error:\(error)")
            }
        }

        observer.onNext(1)
    }

    func createObserverWithCompletedEventExample() {
        let observer: AnyObserver<Int> = .init { event in
            switch event {
            case .next(let element):
                print("===> observer_element:\(element)")
            case .completed:
                print("===> observer_completed")
            case .error(let error):
                print("===> observer_error:\(error)")
            }
        }

        observer.onCompleted()
    }

    func createObserverWithErrorExample() {
        let observer: AnyObserver<Int> = .init { event in
            switch event {
            case .next(let element):
                print("===> observer_element:\(element)")
            case .completed:
                print("===> observer_completed")
            case .error(let error):
                print("===> observer_error:\(error)")
            }
        }

        observer.onError(NSError(domain: "Error Event", code: 0))
    }

    func createBinderExample() {
        let label: UILabel = .init()
        let binder: Binder<String> = .init(label) { label, text in
            label.text = text
            print("===> label_text:\(label.text!)")
        }

        binder.onNext("Lisa")
    }

    func createBinderWithCompletedEventExample() {
        let label: UILabel = .init()
        let binder: Binder<String> = .init(label) { label, text in
            label.text = text
            print("===> label_text:\(label.text!)")
        }

        binder.onCompleted()
    }

    func createBinderWithErrorExample() {
        let label: UILabel = .init()
        let binder: Binder<String> = .init(label) { label, text in
            label.text = text
            print("===> label_text:\(label.text!)")
        }

        binder.onError(NSError(domain: "Error Event", code: 0))
    }

    private let disposeBag: DisposeBag = .init()
}
playgroundShouldContinueIndefinitely()

let observers = Observers()
//observers.createObserverExample()
//observers.createObserverWithCompletedEventExample()
//observers.createObserverWithErrorExample()
//observers.createBinderExample()
//observers.createBinderWithCompletedEventExample()
//observers.createBinderWithErrorExample()
//: [Next](@next)
