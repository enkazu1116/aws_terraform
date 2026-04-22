# Terraformの学習リポジトリ
## 概要
このリポジトリは、Terraformを使ったクラウド構築の勉強を行うリポジトリである。

## 目的
本を読みながら実際に作成して、IaCの理解を深める。
下記の2冊を通して、VPC、ECSの作成を実際に行う。

### 参考にする技術書
- [詳解 AWS Infrastrucuture as Code](https://www.amazon.co.jp/%EF%BC%BB%E8%A9%B3%E8%A7%A3%EF%BC%BDAWS-Infrastructure-Code%E2%80%95%E2%80%95%E4%BD%BF%E3%81%A3%E3%81%A6%E6%AF%94%E3%81%B9%E3%82%8BTerraform%EF%BC%86AWS-CDK-%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E9%81%B8%E6%9B%B8/dp/4297147246/ref=sr_1_1?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&crid=1DGBFIWHSP2EL&dib=eyJ2IjoiMSJ9.cgnUm9ZnBv4GRF1k3Da8n64X5qBqiQLopZ4FqiRuWDjCST7qfdgJu9qoYhqfIxS3jSUfW582NFAlJbuBN5-LybSaMW8cNSDU4nUMjSFOz8qxjJVAeM5iD0g3bS6ecRegj_BI7lc_BWwgDrJAQD1sBW9vKfcpNzu9AX3fIVMv0n3qUJH-Oev_wQ863L3xoHGoiRbzTJu7fYf54RLsOGq5-85c1f-30fofqI13-H8DwXrnhH50w2v2gU5HXucqicZ1B9otuHn-K3Hr4Op5p53MJjTtwmuRgcxtR917JXNeC1s.fFDjNB_BmytX1d-JQwDPuHRXvF5efhlk3qrH4OhqrRk&dib_tag=se&keywords=%E8%A9%B3%E8%A7%A3+aws&qid=1776574119&sprefix=%E8%A9%B3%E8%A7%A3aws%2Caps%2C191&sr=8-1)
- [Terraformで始める実践IaC](https://www.amazon.co.jp/Terraform%E3%81%A7%E3%81%AF%E3%81%98%E3%82%81%E3%82%8B%E5%AE%9F%E8%B7%B5IaC-%E2%80%95AWS%E3%81%A7%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%83%81%E3%83%A3%E6%A7%8B%E7%AF%89%E3%81%AE%E5%9F%BA%E6%9C%AC%E3%81%8B%E3%82%89%E7%B6%99%E7%B6%9A%E7%9A%84%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%BE%E3%81%A7-%E4%BC%8A%E8%97%A4-%E5%A4%AA%E6%96%89/dp/4814400136/ref=sr_1_5?crid=1JIQMVTPR68PY&dib=eyJ2IjoiMSJ9.Z6vyP3wMNaUaAXfLF7KWpRgfX_lqIboWPDB3PDRIM09wuuqTyQg6PgX4ybgHnF9ZJ71ntaFbLxpTFBnXxGkljb9hop9Ihz8yTzDMIYVcu2BUgClfSs4fjTZIlb3Q-7dzIWhu1AB0aL8FJO-5tC-4vDuCk_R7JddY0dUSFRPdt3sZeXjRjCVg6lpUZRedH-1ppXwyEZYoRFXOTsP-sQkibNh2by1dS1-rlykPBRK8AOob69zkSzYc-mEUcaAOjpwF9XRw9Z9QNlfZJ88k8Tp_ngjJBPBe0ZUbrqiBCjiKyr8.ejDHviE2saMGa9Cf7LpwYuCqXJL7ivq_TUfM6c6l7v4&dib_tag=se&keywords=terraform+%E6%9C%AC&qid=1776574540&sprefix=Terraform%2Caps%2C224&sr=8-5)

## 実践
ECS, Lambdaを使用して構築を行う。
