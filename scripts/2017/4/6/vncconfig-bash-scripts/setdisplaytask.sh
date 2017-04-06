#!/bin/bash
# 1= display ; 2=name
vncconfig -display :$1 -set desktop=$2
