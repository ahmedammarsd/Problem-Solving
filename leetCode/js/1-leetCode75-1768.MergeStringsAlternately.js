var mergeAlternately = function (word1, word2) {
  let maxLength = word1.length > word2.length ? word1.length : word2.length;

  let word = "";
  for (let i = 0; i < maxLength; i++) {
    if (word1[i] != undefined) {
      word += word1[i];
    }
    if (word2[i] != undefined) {
      word += word2[i];
    }
  }
  return word;
};

let word1 = "abc",
  word2 = "pqr";
console.log(mergeAlternately(word1, word2));
