use leptos::prelude::*;
use leptos_meta::{provide_meta_context, Stylesheet, Title};
use leptos_router::{
    components::{Route, Router, Routes}, hooks::use_query_map, StaticSegment, WildcardSegment
};

#[component]
pub fn App() -> impl IntoView {
    // Provides context that manages stylesheets, titles, meta tags, etc.
    provide_meta_context();

    view! {
        // injects a stylesheet into the document <head>
        // id=leptos means cargo-leptos will hot-reload this stylesheet
        <Stylesheet id="leptos" href="/pkg/slime.css"/>

        // sets the document title
        <Title text="Welcome to Bruh"/>

        // content for this welcome page
        <Router>
            <main>
                <Routes fallback=move || "Not found.">
                    <Route path=StaticSegment("") view=HomePage/>
                    <Route path=WildcardSegment("any") view=NotFound/>
                </Routes>
            </main>
        </Router>
    }
}

/// Renders the home page of your application.
#[component]
fn HomePage() -> impl IntoView {
    // Creates a reactive value to update the button
    let count = RwSignal::new(0);
    let on_click = move |_| *count.write() += 1;

    // let query = use_query_map();
    // // search stored as ?q=
    // let search = move || query.read().get("q").unwrap_or_default();
    // // a resource driven by the search string
    // let search_results = Resource::new(search, |_| get_users());

    view! {
        <h1>"Welcome to Bru!"</h1>
        <button on:click=on_click>"Click Me: " {count}</button>
        // <Form method="GET" action="">
        //     <input type="search" name="q" value=search/>
        //     <input type="submit"/>
        // </Form>
        // <Transition fallback=move || ()>
        //     /* render search results */
        //     {todo!()}
        // </Transition>
    }
}

/// 404 - Not Found
#[component]
fn NotFound() -> impl IntoView {
    // set an HTTP status code 404
    // this is feature gated because it can only be done during
    // initial server-side rendering
    // if you navigate to the 404 page subsequently, the status
    // code will not be set because there is not a new HTTP request
    // to the server
    #[cfg(feature = "ssr")]
    {
        // this can be done inline because it's synchronous
        // if it were async, we'd use a server function
        let resp = expect_context::<leptos_actix::ResponseOptions>();
        resp.set_status(actix_web::http::StatusCode::NOT_FOUND);
    }

    view! {
        <h1>"Not Found"</h1>
    }
}
