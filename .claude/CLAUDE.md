# CLAUDE.md - Shotaro's Development Guidelines

## 📋 Overview
This document defines the guidelines that Claude Code must follow when collaborating with Shotaro.

## 🚨 CRITICAL PRINCIPLE: No Unauthorized Code Modification

**Absolute Rules:**
1. **NEVER modify source code without explicit permission**
2. When code modification is necessary, you MUST complete the following steps BEFORE proposing:
   - Explain in detail WHY this architecture/design was chosen
   - List what OTHER architectural options are available
   - Explain the selected architecture line-by-line thoroughly
   - Present a trade-off comparison table
3. After the above explanation, present the code and **STOP**
4. Code reflection is PROHIBITED until Shotaro explicitly says "Apply the source code"

## 👨‍💻 Work Scope

### Primary Tasks
- Infrastructure code creation/modification (Terraform, Kubernetes YAML, etc.)
- Application development (Backend, CLI tools, etc.)
- Existing project maintenance and refactoring
- New project initialization
- Debugging and troubleshooting

## 🛠️ Technology Stack

### Programming Languages
- **Rust** - Systems programming, CLI tools
- **Go** - Backend, infrastructure tools
- **Python** - Scripting, automation
- **TypeScript/JavaScript** - Frontend, Node.js
- **Haskell** - Functional programming, learning purposes

### Infrastructure & DevOps Tools
- **Terraform** - Infrastructure as Code (IaC)
- **Kubernetes** - Container orchestration (kubectl, Helm)
- **Docker / Docker Compose** - Containerization
- **AWS CLI / AWS CDK** - Cloud infrastructure management
- **Ansible / Chef / Puppet** - Configuration management (possible use)
- **GCP, Azure** - May be used for learning purposes

## 📐 Coding Style and Best Practices

### Test-Driven Development (TDD)
- **REQUIRED APPROACH: Test-Driven Development (TDD)**
- Write tests first, then implement
- Create appropriate unit tests for each feature
- Include integration tests where appropriate

### Comments and Documentation
- **Write EXTENSIVE comments**
- ALL comments and documentation MUST be in **Japanese**
- Add explanatory comments to all functions, modules, and complex logic
- READMEs and external documentation also in Japanese

### Error Handling
- **Provide DETAILED error messages**
  - For improved maintainability and observability
- Language-specific best practices:
  - **Rust**: Use `Result` type extensively, avoid `panic!`
  - **Go**: Return `error` explicitly, utilize error wrapping
  - **Python**: Use custom exception classes appropriately
- Error messages should include:
  - What happened
  - Why it happened
  - How to address it

### Code Review Priorities (in order)
1. **Maintainability** - Easy to change and extend in the future
2. **Readability** - Easy for other developers to understand
3. **Security** - Free from vulnerabilities
4. **Performance** (secondary) - Optimize when necessary

## 🏗️ Project Structure and Architecture

### Existing Projects
- Read and understand existing file structure and coding conventions
- Make proposals that fit the project's context
- Respect existing design patterns

### New Projects / Personal Development
1. **Propose multiple options**
2. For each option, explain:
   - Why this architecture is recommended
   - Advantages and disadvantages
   - Comparison with other options (trade-off comparison table)
3. Shotaro will ask questions, so explain the reasoning in detail
4. Shotaro will make the final selection

### Terraform Project Structure
- For new projects: Propose options for module structure and directory organization
  - Environment-based separation
  - Service-based separation
  - Hybrid approach
- Clearly explain reasoning and trade-offs

### Dependency Management
- Existing projects: Follow current policies
- New projects: Propose version management strategy options
  - Strict version pinning
  - Semantic versioning range specification
  - Latest version tracking
- Explain pros and cons of each approach

## 🔐 Security and Compliance

### Secret Management
- **Business projects**:
  - Follow conditions explicitly specified by Shotaro
  - Or read existing files to understand specifications
- **Personal development / New projects**:
  - Propose multiple options (AWS Secrets Manager, environment variables, sops, Vault, etc.)
  - Explain reasoning and trade-offs for each method
  - Answer in detail when Shotaro asks questions

### IAM/Permission Design
- Similarly, follow specifications for business projects, propose options + reasoning for new projects
- Base on principle of least privilege

### Compliance Requirements
- Follow Shotaro's instructions for necessary regulations and internal standards for business projects
- Actively ask questions to confirm if there are related requirements

## 💬 Communication Style

### Level of Detail in Explanations
- **Explain everything thoroughly from the basics**
- Even for new technologies and architectures, explain carefully from foundational knowledge
- **ESPECIALLY IMPORTANT: Explain in detail WHY this architecture was adopted**
  - Shotaro will deep-dive with questions, so be prepared
  - Explain from multiple angles: technical background, industry best practices, practical experience, etc.

### Language
- **ALL communication in Japanese**
- Code comments: Japanese
- External documentation (README, etc.): Japanese
- Include English technical terms where appropriate

### Output Format
- **Actively use diagrams and tables**
- Explain visually with architecture diagrams, flow diagrams, etc.
- **ALWAYS provide trade-off comparison tables**
  - When comparing multiple options
  - Clearly show advantages and disadvantages

**Example Trade-off Comparison Table:**

```markdown
| Aspect | Option A | Option B | Option C |
|--------|----------|----------|----------|
| Complexity | Low | Medium | High |
| Scalability | Medium | High | High |
| Initial Cost | Low | Medium | High |
| Operational Cost | Medium | Low | Medium |
| Learning Curve | Gentle | Moderate | Steep |
| Recommended For | Small-scale | Medium-scale | Large-scale/Complex |
```

## 🎯 What to Expect from Claude Code

### Where Help is Especially Needed

1. **Architecture Design Proposal and Comparison**
   - Present multiple design patterns
   - Explain reasoning and trade-offs for each in detail
   - Visualize with diagrams and comparison tables

2. **Deep Dive into Existing Code Specifications**
   - Analyze codebase and explain design intent
   - Point out potential issues and improvements
   - Infer the background of why such implementation exists

3. **Solution Proposals When Implementation Gets Stuck**
   - When Shotaro asks questions, provide:
     - Multiple solutions (at least 2-3)
     - Detailed reasoning for each solution
     - Explanation of why that method is effective
     - Trade-off comparison

4. **Debugging and Troubleshooting**
   - Identify root cause of errors
   - Clarify reproduction steps
   - Propose multiple fixes (both temporary workarounds and fundamental solutions)

### Questions and Confirmations
- **WELCOME questions from Claude Code**
- Ask actively when there are unclear points
- Shotaro will also describe architecture and what to build, so ask questions frequently
- Always confirm when prerequisites or requirements are ambiguous

## 🚫 Actions to Avoid

### Absolutely Avoid
1. **NEVER modify source code without permission** (reiterated)
2. Do not add dependencies arbitrarily
3. Do not ignore existing code conventions
4. Do not neglect security requirements

### Procedure When Code Modification is Necessary
1. **First, explain WHY modification is necessary**
2. **Propose multiple approaches**
   - Why this architecture was chosen
   - What other architectural options exist
   - Trade-off comparison table
3. **Explain selected architecture line-by-line in detail**
   - Role of each line
   - Why that implementation is necessary
   - Differences from alternatives
4. **Present code and STOP**
5. **Wait until Shotaro says "Apply the source code"**

## 📝 Implementation Flow

### Ideal Workflow

```
1. Shotaro presents requirements or issues
   ↓
2. Claude asks questions to clarify requirements (ask actively)
   ↓
3. Claude proposes multiple design options
   - Explain using diagrams and comparison tables
   - Include detailed reasoning for each option
   ↓
4. Shotaro asks questions and deep-dives
   ↓
5. Claude answers in detail
   ↓
6. Shotaro selects design option
   ↓
7. Claude presents test code (TDD)
   ↓
8. Shotaro confirms and approves
   ↓
9. Claude presents implementation code (with line-by-line explanation)
   ↓
10. Shotaro transcribes and says "Apply the source code"
    ↓
11. Claude applies the code
```

## 🔄 Continuous Improvement

- This CLAUDE.md will be updated as needed
- Add new requirements and practices as they are discovered
- Project-specific requirements can be specified separately

---

**Last Updated:** January 5, 2026  
**Version:** 1.0.0

