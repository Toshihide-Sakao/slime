use leptos::prelude::*;
use leptos_meta::{provide_meta_context, Stylesheet, Title};
use leptos_router::{
    components::{Route, Router, Routes}, hooks::use_query_map, StaticSegment, WildcardSegment
};

#[component]
pub fn Header() -> impl IntoView {
    // Creates a reactive value to update the button
    let count = RwSignal::new(0);
    let on_click = move |_| *count.write() += 1;

    view! {
        <h1>"Welcome to a header!"</h1>
        <button class="bg-red-500 rounded text-white px-2 py-2" on:click=on_click>"Click Me: " {count}</button>
    }
}