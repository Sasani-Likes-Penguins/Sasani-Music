# Sasani-Music

This repository contains my original arrangements, example recordings creative by the software I use, and will eventually have recordings of myself playing.

In the future I will add my own compositions.

## The Sound-y Bits
<script>
const user = "Sasani-Likes-Penguins";
const repo = "Sasani-Music";
const rootPath = "Music";  // This is the folder treated as the root

// Function to fetch and display folders/files recursively
async function showFolder(path, container) {
  const res = await fetch(`https://api.github.com/repos/${user}/${repo}/contents/${path}`);
  const items = await res.json();

  const ul = document.createElement("ul");

  for (const item of items) {
    const li = document.createElement("li");
    if (item.type === "dir") {
      li.textContent = item.name;
      li.style.cursor = "pointer";
      li.style.fontWeight = "bold";
      const subList = document.createElement("ul");
      subList.style.display = "none";
      subList.style.marginLeft = "20px";
      li.onclick = async () => {
        if (subList.childElementCount === 0) {
          await showFolder(item.path, subList);
        }
        subList.style.display = subList.style.display === "none" ? "block" : "none";
      };
      li.appendChild(subList);
    } else {
      const a = document.createElement("a");
      a.href = item.download_url;
      a.textContent = item.name;
      a.style.textDecoration = "none";
      a.style.color = "#00bfff";
      li.appendChild(a);
    }
    ul.appendChild(li);
  }
  container.appendChild(ul);
}

// On page load, show *contents of Music/* — but not Music itself
showFolder(rootPath, document.body);
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