//: [Previous](@previous)
import Foundation
import RxSwift

struct FilterOperators {
    func filterExample() {
        print("\n— filter example —")

        Observable<Int>.from([1, 2, 3, 4, 5, 6, 7, 8])
            .do(onNext: { print("original: \($0)") })
            .filter { $0 % 2 == 0 }
            .subscribe(onNext: { print("===> Filter Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func distinctUntilChangedExample() {
        print("\n— distinctUntilChanged example —")

        Observable<Int>.from([1, 1, 1, 2, 2, 2, 3, 3, 1])
            .do(onNext: { print("original: \($0)") })
            .distinctUntilChanged()
            .subscribe(onNext: { print("===> Distinct Until Changed Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func compactMapExample() {
        print("\n— compactMap example —")

        Observable<Int?>.from([1, 2, 3, nil, 4, 5, nil, nil, 6])
            .do(onNext: {
                switch $0 {
                case let .some(value):
                    print("original: \(value)")
                case .none:
                    print("original: nil")
                }
            })
            .compactMap { $0 }
            .subscribe(onNext: { print("===> Compact Map Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func skipExample() {
        print("\n— skip example —")

        Observable<Int>.from([1, 2, 3, 4, 5, 6])
            .do(onNext: { print("original: \($0)") })
            .skip(3)
            .subscribe(onNext: { print("===> Skip Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func skipUntilExample() {
        print("\n— skipUntil example —")

        let buttonTap = PublishSubject<Int>()
        let viewDidAppear = PublishSubject<Void>()

        buttonTap
            .do(onNext: { print("original: \($0)") })
            .skip(until: viewDidAppear)
            .subscribe(onNext: { print("===> Skip Until Result: \($0)\n") })
            .disposed(by: disposeBag)

        buttonTap.onNext(1)
        buttonTap.onNext(2)
        viewDidAppear.onNext(())
        buttonTap.onNext(3)
        buttonTap.onNext(4)
    }

    func skipWhileExample() {
        print("\n— skipWhile example —")

        Observable<Int>.from([1, 2, 3, 4, 5, 6, 3, 2, 1])
            .do(onNext: { print("original: \($0)") })
            .skip(while: { $0 < 4 })
            .subscribe(onNext: { print("===> Skip While Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    func takeExample() {
        print("\n— take example —")

        Observable<Int>.from([1, 2, 3, 4, 5, 6])
            .do(onNext: { print("original: \($0)") })
            .take(3)
            .subscribe(
                onNext: { print("===> Take Result: \($0)\n") },
                onCompleted: { print("===> Observable Completed\n") }
            )
            .disposed(by: disposeBag)
    }

    func takeUntilExample() {
        print("\n— takeUntil example —")

        let buttonTap = PublishSubject<Int>()
        let viewDidDisappear = PublishSubject<Void>()

        buttonTap
            .do(onNext: { print("original: \($0)") })
            .take(until: viewDidDisappear)
            .subscribe(
                onNext: { print("===> Take Until Result: \($0)\n") },
                onCompleted: { print("===> Observable Completed\n") }
            )
            .disposed(by: disposeBag)

        buttonTap.onNext(1)
        buttonTap.onNext(2)
        viewDidDisappear.onNext(())
        buttonTap.onNext(3)
        buttonTap.onNext(4)
    }

    func takeWhileExample() {
        print("\n— takeWhile example —")

        Observable<Int>.from([1, 2, 3, 4, 5, 6, 3, 2, 1])
            .do(onNext: { print("original: \($0)") })
            .take(while: { $0 < 4 })
            .subscribe(
                onNext: { print("===> Take While Result: \($0)\n") },
                onCompleted: { print("===> Observable Completed\n") }
            )
            .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}

playgroundShouldContinueIndefinitely()

let filterOperators = FilterOperators()

//filterOperators.filterExample()
//filterOperators.distinctUntilChangedExample()
//filterOperators.compactMapExample()
//filterOperators.skipExample()
//filterOperators.skipUntilExample()
//filterOperators.skipWhileExample()
//filterOperators.takeExample()
//filterOperators.takeUntilExample()
//filterOperators.takeWhileExample()
//: [Next](@next)

