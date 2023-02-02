# Dependency Injection Example

This repository contains a simple test project to showcase conventions for injecting mocked dependencies to allow real unit testing.

## Why

- If a class `AService` just uses `BService`, in our unit tests of `AService` will be code of `BService` be executed. 
- Changes of the implementation in `BService` can change test results of `AService`.
- To avoid this, we inject a mock of `BService` when testing `AService`

## Conventions
### Services
- Inject dependency in initializer, with an default parameter if possible. This default value can also be provided by a factory class in the future.
### ServiceProtocols
- Always name it with `Protocol` as suffix
- Put the protocol in a separate file in the same folder as the Service
- Always create protocols, to allow dependent classes to quickly mock it. Only create mocks of your class if needed
### ServiceMocks
- Mocks have to be classes to be injected and changed from outside, namely our test functions.
- Mocks should be placed in the test target
- Mocks must have `Mock` as suffix.
- Always Put mock variables directly above the specific function.
- Name those variables alwasys beginning with the function name
### Tests
- Name the tested class variable `sut` (system under test)
- Name functions like this `func testFunctionName_input_expectedOutput()` 
