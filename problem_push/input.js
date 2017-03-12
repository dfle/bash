function allAnagrams (string) {
    var results=[];

    var recurse = function(temp, letters) {
        if (temp.length === string.length && results.indexOf(temp) === -1) {
            results.push(temp);
        }
        for (var i=0; i<letters.length; i++) {
        var firstLetter = letters[i];
        var nextLetters = letters.slice(0,i) + letters.slice(i+1);
        recurse(temp + firstLetter, nextLetters);
        }
    }
    recurse('', string);
    return results;
}