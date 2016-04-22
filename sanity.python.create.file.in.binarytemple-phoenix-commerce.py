#!/usr/bin/env python

import boto
from os import getenv
from boto.s3.connection import Key

from time import ctime

s3con = boto.connect_s3(getenv("PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID"), getenv("PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY")) 
s3con.connection.connect()

b = s3con.get_bucket("binarytemple-phoenix-commerce")

keys = b.list()
for k in keys:
    print k.name

k = Key(b)
k.key = "test.txt"
k.set_contents_from_string("last updated - %s" % ctime())
