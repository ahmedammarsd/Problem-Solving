let l1 = [2, 4, 3],
  l2 = [5, 6, 4];

function addTwoNumbers(l1, l2) {
  // 1- =========== bulit functions its not work in leetCode ==========
  //   let sum = parseInt(l1.reverse().join("")) + parseInt(l2.reverse().join(""));
  //   console.log(
  //     sum
  //       .toString()
  //       .split("")
  //       .reverse()
  //       .map((n) => parseInt(n))
  //   );

  //   let reverseL1 = [];
  //   for (let i = l1.length - 1; i >= 0; i--) {
  //     reverseL1.push(l1[i]);
  //   }
  //   console.log(reverseL1);

  let reverseL1 = [];
  let reverseL2 = [];
  for (let i = l1.length; i >= 0; i--) {
    reverseL1.push(l1[i]);
    reverseL2.push(l2[i]);
  }
  let sum = parseInt(reverseL1.join("")) + parseInt(reverseL2.join(""));
  let newArr = sum.toString().split("");
  let newArr2 = newArr.map((n) => parseInt(n));
  console.log(newArr2);
}

addTwoNumbers(l1, l2);
