#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse

def program():
    parser = argparse.ArgumentParser()
    parser.add_argument("arg1")
    args = parser.parse_args()

    print "Hello, world!"

if __name__ == '__main__':
    program()
