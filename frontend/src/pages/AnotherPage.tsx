import {gql, useQuery} from "@apollo/client";

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
        (data && data.books.map(book => (
            <>{book.title} - {book.author}</>
        )))
    }</>
}

export default function AnotherPage() {
    return <>
        {"Another Page"}
        <BooksList />
    </>
}