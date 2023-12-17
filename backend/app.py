from chalice import Chalice
from chalice.app import Request, Response

import strawberry
from strawberry.chalice.views import GraphQLView

app = Chalice(app_name="BadgerProject")


@strawberry.type
class Query:
    @strawberry.field
    def greetings(self) -> str:
        return "hello from the illustrious stack badger"


@strawberry.type
class Mutation:
    @strawberry.mutation
    def echo(self, string_to_echo: str) -> str:
        return string_to_echo


schema = strawberry.Schema(query=Query, mutation=Mutation)
view = GraphQLView(schema=schema, graphiql=False)


@app.route("/graphql", methods=["GET", "POST"], content_types=["application/json"])
def handle_graphql() -> Response:
    request: Request = app.current_request
    result = view.execute_request(request)
    return result
