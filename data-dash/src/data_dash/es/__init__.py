from elasticsearch_dsl import connections
from .documents import *

ES_ENDPOINT = 'localhost:6900'

connections.create_connection(hosts=[ES_ENDPOINT], timeout=20)

Page.init()