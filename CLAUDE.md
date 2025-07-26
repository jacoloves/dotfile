# CLAUDE.md - TDD Development Guide for Senior Engineers

## Core Principles

- **Chat-based development**: All code should be provided in copyable blocks for transcription
- **Senior-level thinking**: Approach problems with architectural perspective, design patterns, and long-term maintainability
- **Cost optimization**: Maximize value per interaction to minimize API costs
- **TDD-first**: Follow Kent Beck's Red-Green-Refactor cycle religiously

## TDD-Optimized Chat Patterns

### Cost Reduction Strategies

- **Batch requests**: Get test design, implementation, and refactoring suggestions in single interactions
- **Comprehensive scope**: Request entire modules rather than individual functions
- **Avoid redundant iterations**: Plan thoroughly before implementation to minimize back-and-forth

### Efficient TDD Workflow

1. **Requirements → Test Design → Architecture** in one prompt
2. **Implementation with refactoring opportunities** in the next
3. **Impact analysis for future features** as needed

## TDD Cycle-Specific Prompts

### Red Phase (Failing Tests)
```
Design comprehensive test cases for [feature] using TDD approach. Include:
- Primary happy path tests
- Edge cases and error conditions  
- Test setup and teardown
- Expected implementation architecture
- Testing framework recommendations
```

### Green Phase (Minimal Implementation)
```
Implement code to pass the above tests. Provide:
- Production-ready implementation (not just "make it pass")
- Code that handles multiple test cases efficiently
- Clear separation of concerns
- Immediate refactoring opportunities identified
```

### Refactor Phase (Improvement)
```
Refactor the implementation focusing on:
- SOLID principles adherence
- Performance optimizations
- Code readability and maintainability
- Preparation for next likely features
```

## Senior Engineer Expectations

### Architectural Thinking
- Consider system-wide impact of changes
- Discuss trade-offs explicitly (performance vs. readability, etc.)
- Plan for scalability and extensibility
- Address technical debt proactively

### Code Quality Standards
- Follow language-specific best practices
- Implement proper error handling and logging
- Include comprehensive documentation
- Ensure thread safety where applicable

### Testing Philosophy
- Write tests that document behavior, not implementation
- Focus on business value and user outcomes
- Balance unit, integration, and end-to-end testing
- Consider test maintenance cost

## Interaction Templates

### Feature Development
```
I need to implement [feature description]. Please provide:
1. TDD test cases covering all scenarios
2. Implementation that passes all tests
3. Refactoring suggestions for clean code
4. Integration points with existing system
```

### Bug Fix
```
Fix [bug description] using TDD approach:
1. Reproduce bug with failing test
2. Minimal fix to make test pass
3. Refactor to prevent similar issues
4. Assess impact on existing functionality
```

### Architecture Review
```
Review this code architecture for [context]:
1. Design pattern appropriateness
2. SOLID principles compliance
3. Performance implications
4. Future extensibility concerns
```

## Cost-Effective Practices

### Maximize Single Interactions
- Request complete modules with tests, implementation, and documentation
- Ask for multiple alternatives when design decisions are involved
- Include error handling and edge cases in initial requests

### Minimize Iterations
- Provide detailed context upfront
- Specify exact requirements and constraints
- Ask for explanation of design decisions to avoid misunderstandings

### Batch Related Work
- Group related features in single conversations
- Plan entire user stories rather than individual tasks
- Consider integration requirements from the start

## Quality Gates

Before considering any code complete:
- [ ] All tests pass and cover edge cases
- [ ] Code follows established patterns and conventions
- [ ] Documentation explains business logic and trade-offs
- [ ] Performance implications are understood
- [ ] Security considerations are addressed
- [ ] Integration points are clearly defined
