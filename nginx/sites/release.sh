#!/bin/bash

cd ../www.curiosityworks.org || true

hugo

git add .

git commit -m "publishing to live"

git push origin