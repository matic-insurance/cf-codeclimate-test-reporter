# cf-plugin-codeclimate

[CodeFresh](https://codefresh.io) plugin to upload test coverage results to [CodeClimate](https://codeclimate.com)

# Usage

Add freestyle pipeline step with CC_TEST_REPORTER_ID and CC_COMMAND

```yaml
  BeforeBuild:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
      - CC_COMMAND=before-build

  AfterBuild:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
      - CC_COMMAND=after-build reports/.testresult.json --input-type simplecov --prefix /app

  FormatCoverage:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
      - CC_COMMAND=format-coverage reports/.resultset.json --input-type simplecov --prefix /app --output reports/cc/results.1.json

  SumCoverage:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
      - CC_COMMAND=sum-coverage reports/cc/results.*.json --parts 3 --output reports/cc/report.json

  UploadCoverage:
    image: cf-plugin-codeclimate:latest
    environment:
      - CC_TEST_REPORTER_ID=123abc
      - CC_COMMAND=upload-coverage --input reports/cc/report.json
```

**Important:** Do not use quotes around CC_COMMAND variable

# Environment Variables

| Variable            | Required | Default | Description                                                                                  |
|---------------------|----------|---------|----------------------------------------------------------------------------------------------|
| CC_TEST_REPORTER_ID | yes      |         | CodeClimate Test Reporter ID                                                                 |
| CC_COMMAND          | yes      |         | CodeClimate command to execute                                                               |

