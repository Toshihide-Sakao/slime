use leptos::prelude::*;
use leptos_meta::{provide_meta_context, Stylesheet, Title};
use leptos_router::{
    components::{Route, Router, Routes}, hooks::use_query_map, StaticSegment, WildcardSegment
};

use crate::components::header::Header;

#[component]
pub fn HomePage() -> impl IntoView {
    // Creates a reactive value to update the button

    view! {
        <Header/>
        <h1 class="font-sans text-lg text-center">"slime CRM!"</h1>
        

        // <button class="bg-red-200 rounded  px-2 py-2" on:click=on_click>"Click Me: " {count}</button>
    }
}