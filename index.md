# Sasani-Music

This repository contains my original arrangements, example recordings creative by the software I use, and will eventually have recordings of myself playing.

In the future I will add my own compositions.

## Categories
<div id="file-tree">Loading files...</div>

<script>
async function fetchRepoTree() {
  const user = "Sasani-Likes-Penguins";   // your GitHub username
  const repo = "Sasani-Music";            // your repository name
  const apiUrl = `https://api.github.com/repos/${user}/${repo}/git/trees/main?recursive=1`;
  const res = await fetch(apiUrl);
  const data = await res.json();
  return data.tree.filter(item => item.type === "blob" || item.type === "tree");
}

function buildTree(data) {
  const tree = {};
  data.forEach(item => {
    const parts = item.path.split("/");
    let current = tree;
    parts.forEach((part, i) => {
      if (!current[part]) current[part] = (i === parts.length - 1 ? null : {});
      current = current[part];
    });
  });
  return tree;
}

function createList(tree, basePath = "") {
  const ul = document.createElement("ul");
  ul.style.listStyle = "none";
  ul.style.paddingLeft = "1em";

  for (const name in tree) {
    const li = document.createElement("li");

    if (tree[name] === null) {
      const a = document.createElement("a");
      a.href = `${basePath}${name}`;
      a.textContent = name;
      a.target = "_blank";
      li.appendChild(a);
    } else {
      const span = document.createElement("span");
      span.textContent = "📁 " + name;
      span.style.cursor = "pointer";
      span.style.color = "#66ccff";
      span.onclick = () => {
        const sub = li.querySelector("ul");
        sub.style.display = sub.style.display === "none" ? "block" : "none";
      };
      li.appendChild(span);

      const subList = createList(tree[name], basePath + name + "/");
      subList.style.display = "none";
      li.appendChild(subList);
    }

    ul.appendChild(li);
  }
  return ul;
}

fetchRepoTree().then(data => {
  const tree = buildTree(data);
  const root = document.getElementById("file-tree");
  root.textContent = "";
  root.appendChild(createList(tree));
});
</script>


## More Instrument Info
I only write/arrange for what I have which are:
* Soprano, alto, and tenor recorder
* B♭, A, and F♯ Native American style flutes
* A 17 tine Kalimba in C, and a 21 tine kalimba that I haven't decided what key to tune to.
* A steel tongue drum—also needing a decision on what tuning to use (it's kind of a pain to tune it)
* Bass ukulele (nothing here for that yet as I'm still very new)
* A flute tuned to Makam Hicazcâr Aʂiran, (A Byzantine or A double harmony I think?)
* Irish whistles in the key of D major, B major, and G Mixolydian (Any of the D Major whistle music works for both high and low D whistles)
* Frame drum (I'm still learning, so nothing present yet)
* Guqin doesn't have anything yet as I will be a beginning when it arrives today (2025-10-13)

## Future instruments
I have several instruments in mind I'd love to learn, so eventually hope to include music for the following:
* Harp/Lever Harp/Irish lever harp, etc.

## The Music
* Irish whistle music have alternate PDFs with whistle tabs
* Native American Style flutes with also have alternate PDFs using the Nakai tab system

## Future plans
* I'd like to add some tips and guides at some point in the future.

*Readme and repo is a WIP*

## License
This repository’s sheet music and recordings are licensed under the  
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).