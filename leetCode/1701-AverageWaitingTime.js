let customers = [
  [1, 2],
  [2, 5],
  [4, 3],
];

for (customer in customers) {
  let arrivalTime = customers[customer][0];
  let time = customers[customer][1];
  let timeTakeOrder = arrivalTime + time;
  let oldArrivaleTime = 0;
  if (customer != 0) {
    oldArrivaleTime = customers[customer - 1][0];
  }
  let timeStart = arrivalTime - oldArrivaleTime;
  console.log(timeTakeOrder + timeStart);
}
