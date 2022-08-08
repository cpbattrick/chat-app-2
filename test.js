// find how many smurfs there are in the array
var smurfs = ["Brainy Smurf", "Smurfette", "Hefty Smurf", "Lazy Smurf", "Sneaky Smurf"];

// function to find a smurf
function findSmurf(smurf) {
    // loop through the array
    for (var i = 0; i < smurfs.length; i++) {
        // if the smurf is found
        if (smurfs[i] === smurf) {
        // return the index
        return i;
        }
    }
    // if the smurf is not found
    return -1;
    }

// function to find a smurf using array methods
function findSmurf2(smurf) {
    // find the index of the smurf
    var index = smurfs.indexOf(smurf);
    // if the smurf is found
    if (index !== -1) {
        // return the index
        return index;
    }
    // if the smurf is not found
    return -1;
}


// function to count the type of smurf using the findSmurf2 function and a forEach loop without comments
    function countSmurfs2(smurfs) {
        // create a variable to store the number of smurfs
        var count = 0;
        // loop through the array
        smurfs.forEach(function(smurf) {
            // find the index of the smurf
            var index = findSmurf2(smurf);
            // if the smurf is found
            if (index !== -1) {
                // increment the count
                count++;
            }
        });
        // return the number of smurfs
        return count;
    }

    // test the function
    console.log(findSmurf("Brainy Smurf"));

    // test the function

    console.log(findSmurf("Hefty Smurf"));

    // test the function

    // jest to see if the function works
    test("findSmurf", () => {   
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
        expect(findSmurf("Lazy Smurf")).toBe(3);
        expect(findSmurf("Sneaky Smurf")).toBe(4);
        expect(findSmurf("Smurfette")).toBe(1);
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
        expect(findSmurf("Lazy Smurf")).toBe(3);
        expect(findSmurf("Sneaky Smurf")).toBe(4);
        expect(findSmurf("Smurfette")).toBe(1);
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
        expect(findSmurf("Lazy Smurf")).toBe(3);
        expect(findSmurf("Sneaky Smurf")).toBe(4);
        expect(findSmurf("Smurfette")).toBe(1);
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
        expect(findSmurf("Lazy Smurf")).toBe(3);
        expect(findSmurf("Sneaky Smurf")).toBe(4);
        expect(findSmurf("Smurfette")).toBe(1);
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
        expect(findSmurf("Lazy Smurf")).toBe(3);
        expect(findSmurf("Sneaky Smurf")).toBe(4);
        expect(findSmurf("Smurfette")).toBe(1);
        expect(findSmurf("Brainy Smurf")).toBe(0);
        expect(findSmurf("Hefty Smurf")).toBe(2);
    });

    //new smurf array const with 10 items
    const smurfs = ["Brainy Smurf", "Smurfette", "Hefty Smurf", "Lazy Smurf", "Sneaky Smurf", "Brainy Smurf", "Smurfette", "Hefty Smurf", "Lazy Smurf", "Sneaky Smurf"];

    // function to count the type of smurf using the findSmurf function and a forEach loop
    function countSmurfs(smurfs) {
        // create a variable to store the number of smurfs
        let count = 0;
        // loop through the array
        smurfs.forEach(function(smurf) {
            // if the smurf is found
            if (findSmurf(smurf) !== -1) {
                // increment the count
                count++;
            }
        } 
        );
        // return the count
        return count;
        }








