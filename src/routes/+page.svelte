<script>
    let name = "takuya"
    let age = 30

    function incrementAge() {
        age++
    }
</script>

<style>
    h1 {
        color: purple;
    }
</style>

<h1>Welcome to SvelteKit</h1>

<h1 class="text-3xl font-bold underline">
    Hello world!
</h1>

<p>hello {name}, my age is {age}!</p>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
npm

<button class="btn" on:click={incrementAge}>Change Age</button>