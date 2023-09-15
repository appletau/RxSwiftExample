//: [Previous](@previous)

import Foundation
import RxSwift

struct CombinationOperators {
    func mergeExample() {
        print("\n— merge example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<Int>()

        let firstObservable = firstPublishSubject
            .do(onNext: { print("* First Observable Element: \($0)") })
        let secondObservable = secondPublishSubject
            .do(onNext: { print("* Second Observable Element: \($0)") })

        Observable<Int>.merge(firstObservable, secondObservable)
            .subscribe(onNext: { print("===> Merge Result: \($0)\n") })
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext(2)
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext(4)
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext(6)
    }

    func mergeOneOfObservableCompleteExample() {
        print("\n— merge: One Of Observable Complete example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<Int>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable<Int>.merge(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> Merge Result: \($0)\n")},
                onCompleted: { print("===> Merge Observable Completed\n") }
            )
            .disposed(by: disposeBag)

        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext(2)
        firstPublishSubject.onCompleted()
        secondPublishSubject.onNext(4)
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext(6)
    }

    func mergeAllOfObservableCompleteExample() {
        print("\n— merge: One Of Observable Complete example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<Int>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable<Int>.merge(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> Merge Result: \($0)\n")},
                onCompleted: { print("===> Merge Observable Completed\n") }
            )
            .disposed(by: disposeBag)

        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext(2)
        firstPublishSubject.onCompleted()
        secondPublishSubject.onNext(4)
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext(6)
        secondPublishSubject.onCompleted()
    }

    func combineLatestExample() {
        print("\n— combineLatest example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(onNext: { print("* First Observable Element: \($0)") })
        let secondObservable = secondPublishSubject
            .do(onNext: { print("* Second Observable Element: \($0)") })

        Observable.combineLatest(firstObservable, secondObservable)
            .subscribe(onNext: { print("===> CombineLatest Result: \"first is (\($0)) & second is (\($1))\"\n") })
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
    }

    func combineLatestOneOfObservableCompleteExample() {
        print("\n— combineLatest example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable.combineLatest(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> CombineLatest Result: \"first is (\($0)) & second is (\($1))\"\n") },
                onCompleted: { print("===> CombineLatest Observable Completed\n") }
            )
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onCompleted()
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
    }

    func combineLatestAllOfObservableCompleteExample() {
        print("\n— combineLatest example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable.combineLatest(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> CombineLatest Result: \"first is (\($0)) & second is (\($1))\"\n") },
                onCompleted: { print("===> CombineLatest Observable Completed\n") }
            )
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onCompleted()
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
        secondPublishSubject.onCompleted()
    }

    func zipExample() {
        print("\n— zip example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(onNext: { print("* First Observable Element: \($0)") })
        let secondObservable = secondPublishSubject
            .do(onNext: { print("* Second Observable Element: \($0)") })

        Observable.zip(firstObservable, secondObservable)
            .subscribe(onNext: { print("===> Zip Result: \"first is (\($0)) & second is (\($1))\"\n") })
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
    }

    func zipOneOfObservableCompleteExample() {
        print("\n— zip example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable.combineLatest(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> Zip Result: \"first is (\($0)) & second is (\($1))\"\n") },
                onCompleted: { print("===> Zip Observable Completed\n") }
            )
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onCompleted()
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
    }

    func zipAllOfObservableCompleteExample() {
        print("\n— zip example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<String>()

        let firstObservable = firstPublishSubject
            .do(
                onNext: { print("* First Observable Element: \($0)") },
                onCompleted: { print("===> First Observable Completed\n") }
            )
        let secondObservable = secondPublishSubject
            .do(
                onNext: { print("* Second Observable Element: \($0)") },
                onCompleted: { print("===> Second Observable Completed\n") }
            )

        Observable.combineLatest(firstObservable, secondObservable)
            .subscribe(
                onNext: { print("===> Zip Result: \"first is (\($0)) & second is (\($1))\"\n") },
                onCompleted: { print("===> Zip Observable Completed\n") }
            )
            .disposed(by: disposeBag)
        firstPublishSubject.onNext(1)
        secondPublishSubject.onNext("a")
        firstPublishSubject.onCompleted()
        firstPublishSubject.onNext(3)
        secondPublishSubject.onNext("b")
        firstPublishSubject.onNext(5)
        secondPublishSubject.onNext("c")
        secondPublishSubject.onCompleted()
    }

    func concatExample() {
        print("\n— concat example —")
        let firstPublishSubject = PublishSubject<Int>()
        let secondPublishSubject = PublishSubject<Int>()

        let firstObservable = Observable<Int>.from([1, 3, 5])
            .do(onNext: { print("* First Observable Element: \($0)") })
        let secondObservable = Observable<Int>.from([2, 4, 6])
            .do(onNext: { print("* Second Observable Element: \($0)") })

        Observable.concat(firstObservable, secondObservable)
            .subscribe(onNext: { print("===> Concat Result: \($0)\n") })
            .disposed(by: disposeBag)
    }

    private let disposeBag: DisposeBag = .init()
}
playgroundShouldContinueIndefinitely()

let combinationOperators = CombinationOperators()
//combinationOperators.mergeExample()
//combinationOperators.mergeOneOfObservableCompleteExample()
//combinationOperators.mergeAllOfObservableCompleteExample()
//combinationOperators.combineLatestExample()
//combinationOperators.combineLatestOneOfObservableCompleteExample()
//combinationOperators.mergeAllOfObservableCompleteExample()
//combinationOperators.zipExample()
//combinationOperators.zipOneOfObservableCompleteExample()
//combinationOperators.zipAllOfObservableCompleteExample()
//combinationOperators.concatExample()
//: [Next](@next)

