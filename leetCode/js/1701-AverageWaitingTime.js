// let customers = [
//   [1, 2],
//   [2, 5],
//   [4, 3],
// ];

let customers = [
  [2, 3],
  [6, 3],
  [7, 5],
  [11, 3],
  [15, 2],
  [18, 1],
];
// [
//   [5, 2],
//   [5, 4],
//   [10, 3],
//   [20, 1],
// ];
let timeFinishOrder;
let timeForCompleateOrders = [];
for (let customer in customers) {
  let arrivalTime = customers[customer][0];
  let timeForComplateTheOrder = customers[customer][1];
  let timeToTakeOrder;

  if (customer == 0) {
    timeToTakeOrder = arrivalTime + timeForComplateTheOrder;
    // timeForCompleateOrders.push(timeToTakeOrder - arrivalTime);
    // timeFinishOrder = timeToTakeOrder;
  } else {
    timeToTakeOrder = timeFinishOrder + timeForComplateTheOrder;
    if (timeToTakeOrder < arrivalTime) {
      timeToTakeOrder = arrivalTime + timeForComplateTheOrder;
      // timeForCompleateOrders.push(timeToTakeOrder - arrivalTime);
      // timeFinishOrder = timeToTakeOrder;
    } else {
      timeToTakeOrder = timeFinishOrder + timeForComplateTheOrder;
      // timeForCompleateOrders.push(timeToTakeOrder - arrivalTime);
      // timeFinishOrder = timeToTakeOrder;
    }

    // timeForCompleateOrders.push(timeToTakeOrder - arrivalTime);
    // timeFinishOrder = timeToTakeOrder;
  }
  timeForCompleateOrders.push(timeToTakeOrder - arrivalTime);
  timeFinishOrder = timeToTakeOrder;

  // let oldArrivaleTime = 0;
  // let lastTime = customer - 1;
  // if (customer != 0) {
  //   oldArrivaleTime = customers[lastTime][1];
  // }
  //let timeStart = arrivalTime - oldArrivaleTime;
  console.log(arrivalTime, timeToTakeOrder, timeFinishOrder);
}
console.log(timeForCompleateOrders);
console.log(timeForCompleateOrders.reduce((a, b) => a + b) / customers.length);
// for (let customer in customers) {
//   let arrivalTime = customers[customer][0];
//   let time = customers[customer][1];
//   let timeTakeOrder = arrivalTime + time;
//   let oldArrivaleTime = 0;
//   let lastTime = customer - 1;
//   if (customer != 0) {
//     oldArrivaleTime = customers[lastTime][0];
//   }
//   let timeStart = arrivalTime - oldArrivaleTime;
//   console.log(arrivalTime, timeTakeOrder, timeStart, oldArrivaleTime);
// }

// CHAT-GPT SOLVE
let total_waiting_time = 0;
let current_time = 0;

for (let i = 0; i < customers.length; i++) {
  let arrival_time = customers[i][0];
  let time_needed = customers[i][1];

  // Chef starts at the maximum of arrival time and current time
  current_time = Math.max(current_time, arrival_time) + time_needed;

  // Calculate waiting time for this customer
  let waiting_time = current_time - arrival_time;

  // Add this waiting time to the total waiting time
  total_waiting_time += waiting_time;
}

// Calculate the average waiting time
let average_waiting_time = total_waiting_time / customers.length;

//return average_waiting_time;
