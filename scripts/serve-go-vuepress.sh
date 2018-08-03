#!/usr/bin/env bash

cd "../client/ashtons-blog-vuepress"
yarn
yarn 'run' 'build'
./scripts/post-build.sh
cd "../.."

cd ./server/ashtons-blog-serv-go
go build '-o' 'bin/serve' 'src/serve.go'
cd "../.."

echo "$PWD"

./server/ashtons-blog-serv-go/bin/serve -dist=client/ashtons-blog-vuepress/dist
