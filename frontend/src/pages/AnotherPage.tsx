import {gql, useQuery} from "@apollo/client";
import {Book} from "../__generated__/graphql.ts";

const GET_BOOKS = gql(`
query GetBooks {
  books {
    author
    title
  }
}`)

function BooksList() {
    const {loading, data} = useQuery(GET_BOOKS)
    return <>{loading ? (<p>{"Loading"}</p>) :
        (data && data.books.map((book: Book, index: number) => (
            <div key={index}>{book.title} - {book.author}</div>
        )))
    }</>
}

export default function AnotherPage() {
    return <>
        {"Another Page"}
        <BooksList />
    </>
}