pub mod app;
pub(crate) mod database;
pub(crate) mod models;
pub(crate) mod routes;
pub(crate) mod config;
pub(crate) mod errors;

#[cfg(feature = "hydrate")]
#[wasm_bindgen::prelude::wasm_bindgen]
pub fn hydrate() {
    use app::*;
    console_error_panic_hook::set_once();
    leptos::mount::hydrate_body(App);
}
