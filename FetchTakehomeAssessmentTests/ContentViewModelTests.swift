//
//  ContentViewModelTests.swift
//  FetchTakehomeAssessmentTests
//
//  Created by Rebecca Banks on 1/12/25.
//

import XCTest
@testable import FetchTakehomeAssessment

final class ContentViewModelTests: XCTestCase {

    func testContentViewModelSetUpWithData() {
        let viewModel = makeSUT()

        XCTAssertEqual(viewModel.recipes, MockAPIResponse().recipes)
        XCTAssertFalse(viewModel.hasError)
        XCTAssertEqual(viewModel.errorMessage, "")
    }

    func testContentViewModelSetUpWithoutData() {
        let viewModel = makeSUT(withData: false)

        XCTAssertEqual(viewModel.recipes, [])
        XCTAssertTrue(viewModel.hasError)
        XCTAssertEqual(viewModel.errorMessage, "No recipes found")
    }

    func testContentViewModelSetUpWithAPIError() {
        let viewModel = makeSUT(withError: true)

        XCTAssertEqual(viewModel.recipes, [])
        XCTAssertTrue(viewModel.hasError)
        XCTAssertEqual(viewModel.errorMessage, "Unable to retrieve data")
    }

    private func makeSUT(withData: Bool = true,
                         withError: Bool = false,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> ContentViewModel {
        let apiService: APIService
        if withError {
            apiService = MockAPIServiceWithError()
        } else {
            if withData {
                apiService = MockAPIService()
            } else {
                apiService = MockAPIServiceWithoutDataNoError()
            }
        }

        let viewModel = ContentViewModel(apiService: apiService)
        trackMemoryLeak(viewModel, file: file, line: line)

        return viewModel
    }
}
