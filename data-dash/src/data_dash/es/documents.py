from elasticsearch_dsl import Document, Text, Keyword, Date

class Page(Document):
    url = Keyword()
    title = Text()
    content = Text()
    updated_at = Date()

    class Index:
        name = 'pages'