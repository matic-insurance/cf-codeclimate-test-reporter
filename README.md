# cf-plugin-codeclimate

[CodeFresh](https://codefresh.io) plugin to upload test coverage results to [CodeClimate](https://codeclimate.com)

- Plugin provides mapping of CodeFresh git/ci values to CodeClimate
- Plugin allows execution of multiple commands in single step

# Usage

1. Add freestyle pipeline step with CC_TEST_REPORTER_ID environment variable in a step or pipeline
1. Execute arbitary number of commands using `report` script

Arguments passed to `report` script in command will be passed to `cc-test-reporter` executable without changes

```yaml
  BeforeBuild:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
    commands:
      - report before-build

  AfterBuild:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
    commands:
      - report after-build -t simplecov --prefix /app

  CodeClimateFormatAndUpload:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
    commands:
      - report format-coverage reports/test_run_1/.resultset.json --input-type simplecov --prefix /app --output reports/cc/results.1.json
      - report format-coverage reports/test_run_2/.resultset.json --input-type simplecov --prefix /app --output reports/cc/results.2.json
      - report sum-coverage reports/cc/results.*.json --parts 2 --output reports/cc/report.json
      - report upload-coverage --input reports/cc/report.json
```

# Environment Variables

| Variable            | Required | Default | Description                                                                                  |
|---------------------|----------|---------|----------------------------------------------------------------------------------------------|
| CC_TEST_REPORTER_ID | yes      |         | CodeClimate Test Reporter ID                                                                 |

