# data-dash

Build a simple search engine with Scrapy and Amazon Elasticsearch. An example
use case is to easily index the whole AWS documentation and search it using
regular expressions (which is way better than its built-in search).

## ingridients

- **Python**, primary scripting language 
- **Scrapy**, to scrape Web pages and parse them with ease
- **Amazon Elasticsearch Service**, managed Elasticsearch service
- **Amazon S3**, for storing templates and code artifacts
- **Amazon EC2 family**, infrastructure
- **AWS Code family**, continuous delivery
- **AWS CloudFormation**, automated generation and updates of stacks
- **AWS Cloud Development Kit**, for easy generation of CloudFormation templates

## preparations

- vpc-checklist
- python-install
- cli-install
- git-install
- github-fork

## recipe

You may directly create a complete stack using templates provided.

- using-aws-cdk
- using-cloudformation

Or for the fun part, follow the steps in next section.

## steps

### 1. create a VPC

### 2. create a public subnet

### 3. create an EC2 instance

### 4. create a CodeDeploy application

### 5. install CodeDeploy agent

### 6. fork the Scrapy code repo

### 7. create a CodePipeline pipeline

### 7. create an Amazon Elasticsearch Service domain

### run the pipeline

### start indexing

### query!