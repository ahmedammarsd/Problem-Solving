var mostPoints = function (questions) {
  let points = [];
  let brainpower = [];
  let toSkip = 0;
  let sum = 0;
  let values = [];
  for (let i = 0; i < questions.length; i++) {
    points.push(questions[i][0]);
    brainpower.push(questions[i][1]);
  }
  for (let i = 0; i < points.length; i++) {
    console.log(i);
    if (toSkip != 0) {
      toSkip--;
      continue;
    } else if (toSkip == 0) {
      sum = +points[i][0];
      toSkip = brainpower[i][1];
    }
  }
  console.log(points);
  console.log(brainpower);
  console.log(sum);
};

mostPoints([
  [3, 2],
  [4, 3],
  [4, 4],
  [2, 5],
]);
